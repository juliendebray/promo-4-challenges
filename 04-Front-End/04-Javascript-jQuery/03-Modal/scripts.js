$(function() {
  $('img').on('click',function(e){
    $('body').append('<div class="inner"></div>');
    $(".inner").css("height", $(document).height());
    $(".inner").css("width", $(document).width());
    $('body').append('<div class="img-container"></div>');
    $('.img-container').append($('<img src=' + $(this).attr('src') + ' class="modal">'));
    $('.modal').css({'width':$(this).data('modal-width'), 'height':$(this).data('modal-height')});
    $('.img-container').fadeIn();
    $(".inner").on('click',function(e) {
      $('.modal').hide();
      $('.img-container').hide();
      $('.inner').hide();
    });
  });
})