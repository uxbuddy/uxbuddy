$(document).on('turbolinks:load', function() {
  $('select').material_select();
  $(".toggle_button").click((function(){
    var counter = 1;
    return function()
    {
      $.ajax({
        url: window.location.pathname + "/answers",
        type: "POST",
        data: {answer: {
          response: $("#range"+counter).val(),
          comment: $("#comment"+counter).val(),
          question_no: counter - 1
        }},
        success: function() {
          return false;
        }
      });
      $(".q" + counter).hide();
      counter = counter + 1;
      $(".q" + counter).show();

    };

  })());

  $("#start").click((function(){
    return function()
    {
       $("#iframe-row, .q1, #toggle, #test-title").show();
       $(".welcome").hide();
    };
  })());

});
