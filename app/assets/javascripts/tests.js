$(document).ready(function() {
  $('select').material_select();
  $(".toggle_button").click((function(){
    var counter = 0;
    return function()
    {
      $.ajax({
        url: window.location.pathname + "/answers",
        type: "POST",
        data: {answer: {
          response: $("#range"+counter).val(),
          question_no: counter
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
       $("#iframe, .q1, #toggle").show();
       $(".welcome").hide();
    };
  })());
});
