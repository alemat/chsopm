$(function () {
    $('#report_report_focus_area').change(function(){
      var focus_area = $(this).val();
      $.ajax({
            url: '/visualizations/load_projects_by_focus_area',
            data: {focus_area: focus_area},
            success: function(response){
              $('#report_sub_focus_area').html(response)
            }
      })
    })


    $('#report_report_sub_focus_area').change(function(){
      var sub_focus_area = $(this).val();
      alert(sub_focus_area)
      $.ajax({
            url: '/visualizations/load_projects_by_sub_focus_area',
            data: {sub_focus_area: sub_focus_area},
            success: function(response){
              $('#report_chart').html(response)
            }
      })
    })

  });
