$(document).on('turbolinks:load', function() {
  $('.parallax').parallax();
  $('select').material_select();

  $("#start").click((function(){
    return function() {
      generateSlider(1);
      $("#iframe-row, .q1, #toggle, #test-title").show();
      $(".welcome, .q0").hide();
    };
  })());

  $(".toggle_button_next").click((function(){
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

  $(".toggle_button_finish").click((function(){
    var counter = $("#qnum").text();
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
      $(".q" + counter-1).hide();
      counter = counter + 1;
      $(".q" + counter).show();
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

  $('#test_test_type_id_2').prop('disabled', true);
  $('#test_test_type_id_3').prop('disabled', true);
  $('#test_test_type_id_4').prop('disabled', true);
  $('#test_test_type_id_5').prop('disabled', true);
  $('#test_test_type_id_6').prop('disabled', true);
  $('#test_test_type_id_7').prop('disabled', true);

});
