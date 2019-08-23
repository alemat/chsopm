class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  belongs_to :institution, optional: true

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def superadmin?
  	superadmin_role == true
  end

  def supervisor?
  	supervisor_role == true
  end

  def dmin?
  	admin_role == true
  end

  def user?
  	user_role == true
  end

end
