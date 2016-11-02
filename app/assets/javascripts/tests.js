$(document).on('turbolinks:load', function() {
  $('select').material_select();

  $("#start").click((function(){
    return function() {
      generateSlider(1);
      $("#iframe-row, .q1, #toggle, #test-title").show();
      $(".welcome, .q0").hide();
    };
  })());

  $(".toggle_button").click((function(){
    var counter = 1;
    return function()
    {
      $.ajax({
        url: window.location.pathname + "/answers",
        type: "POST",
        data: {answer: {
          response: $('#range'+counter+' .range-label span').text(),
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
      generateSlider(counter);
    };
  })());

  function generateSlider(counter) {
    var slider = document.getElementById('range' + counter);
    noUiSlider.create(slider, {
     start: [2.5],
     step: 1,
     range: {
       'min': 0,
       'max': 5
     },
     format: wNumb({
       decimals: 0
     }),
     pips: { // Show a scale with the slider
  		mode: 'steps',
  		stepped: true,
  		density: 10
  	}
    });
  }
});
