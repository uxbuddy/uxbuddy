$(document).ready(function() {
  $('select').material_select();
  $("#toggle").click((function(){
    var counter = 1;
    return function()
    {
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
