/*
  *
  * TODO: add your code here!
  *
*/
$(function() {
  $('#message').hide().delay( 1000 );
  $('#message').slideDown();
  $('#message').on('click', function(e) {
    $(this).hide();
    $('#message-wrapper').on('mouseenter', function() {
      $('#message').slideDown();
    });
    $('#message-wrapper').on('mouseleave', function() {
      $('#message').slideUp();
    });
  });
});