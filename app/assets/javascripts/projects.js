$(function () {
  $('#project_focus_area_id').change(function(){
    var focus_area = $(this).val();
    $.ajax({
          url: '/projects/load_sub_focus_areas',
          data: {focus_area: focus_area},
          success: function(response){
            $('#sub_focus_area').html(response)
          }
    })
  })
});