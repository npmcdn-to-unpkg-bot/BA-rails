$(document).ready(function() {

  $('.grid').masonry({
    // options
    itemSelector: '.grid-item',
    columnWidth: 200
  });

  $("#img").hover(function() {
    $(this).css("background-color", "black");
  }, function() {
    $(this).css("background-color", "pink");
  });



});
