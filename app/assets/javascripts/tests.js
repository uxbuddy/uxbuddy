$(document).ready(function() {
  $("#toggle").click((function(){
    var counter = 1;
    return function()
    {
      $.ajax({
        url: "/tests/1/answers",
        type: "POST",
        data: {answer: {
          response: 3,
          question_id: counter
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
