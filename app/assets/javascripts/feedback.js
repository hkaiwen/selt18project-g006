$(document).ready( function () {

  feedback = {
    setup: function () {
      $('<div id="showFeedback"></div>').hide().appendTo($('body'));
      feedback.getFeedback();
    },

    getFeedback: function () {
      console.log('in ajax');
      $.ajax({
        type: 'GET',
        url: '/show_feedback',
        timeout: 5000,
        success: feedback.showFeedback,
        error: function () {
          alert('Error!');
        }
      });
      return (false);
    },

    showFeedback: function (data) {
      console.log('show feedbACK');
      var oneFourth = Math.ceil($(window).width() / 4);
      $('#showFeedback').html(data).css({'left': 0, 'width': 2 * oneFourth, 'top': 250, 'right': 50}).show();
      $('#closeLink').click(function(){
        $('#showFeedback').hide();
        return(false);
      });
      return (false);
    },

  };
  $('#showfeedback').click(function () {
    $(feedback.setup);
  });


});
