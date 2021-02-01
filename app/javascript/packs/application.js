// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

// Stimulus js:
import 'controllers'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Burger navigation menu
$(document).on('turbolinks:load', function() {

  // Check for click events on the navbar burger icon
  $(".navbar-burger").click(function() {

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");

  });
});

// Star rating widget
$(document).on('turbolinks:load', function () {

  setInitialStars();

  /* 1. Visualizing things on Hover - See next part for action on click */
  $('#stars li').on('mouseover', function () {
    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
    // Now highlight all the stars that's not after the current hovered star
    $(this).parent().children('li.star').each(function (e) {
      if (e < onStar) {
        $(this).addClass('hover');
      }
      else {
        $(this).removeClass('hover');
      }
    });

  }).on('mouseout', function () {
    $(this).parent().children('li.star').each(function (e) {
      $(this).removeClass('hover');
    });
  });


  /* 2. Action to perform on click */
  $('#stars li').on('click', function () {
    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
    var stars = $(this).parent().children('li.star');

    for (i = 0; i < stars.length; i++) {
      $(stars[i]).removeClass('selected');
    }

    for (i = 0; i < onStar; i++) {
      $(stars[i]).addClass('selected');
    }


    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);

    $("#rating_value").val(ratingValue); //pass the ratingValue to the html form
  });


});

function setInitialStars() {
  var onStar = $("#rating_value").val();
  if (onStar) {
    var selectedStar = $(`#stars li[data-value='${onStar}']`);
    // alternatively: var selectedStar = document.body.querySelector(`#stars li[data-value="${onStar}"]`);

    var stars = $(selectedStar).parent().children('li.star');

    for (i = 0; i < stars.length; i++) {
      $(stars[i]).removeClass('selected');
    }

    for (i = 0; i < onStar; i++) {
      $(stars[i]).addClass('selected');
    }
  }
}

