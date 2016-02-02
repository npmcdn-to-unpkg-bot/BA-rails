// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {

  var clickEvent = false;
  $('#myCarousel').carousel({
    interval: 4000
  }).on('click', '.list-group li', function() {
    clickEvent = true;
    $('.list-group li').removeClass('active');
    $(this).addClass('active');
  }).on('slid.bs.carousel', function(e) {
    if (!clickEvent) {
      var count = $('.list-group').children().length - 1;
      var current = $('.list-group li.active');
      current.removeClass('active').next().addClass('active');
      var id = parseInt(current.data('slide-to'));
      if (count == id) {
        $('.list-group li').first().addClass('active');
      }
    }
    clickEvent = false;
  });
})

$(window).load(function() {
  var boxheight = $('#myCarousel .carousel-inner').innerHeight();
  var itemlength = $('#myCarousel .item').length;
  var triggerheight = Math.round(boxheight / itemlength + 1);
  $('#myCarousel .list-group-item').outerHeight(triggerheight);
});
