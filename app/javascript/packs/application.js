// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
//= require jquery3
//= require popper
//= require bootstrap
import $ from 'jquery';
global.$ = jQuery;

$(document).ready(function(){
  $('.close').click(function(){
    $('.alert.flash').hide();
  });

  $(document).on("click", "button.aside-btn", function () { 
    $('#nav').addClass('shadow-active');
    $('#nav-aside').addClass('active');
  });

  $(document).on("click", "button.nav-close.nav-aside-close", function () { 
    $('#nav').removeClass('shadow-active');
    $('#nav-aside').removeClass('active');
  });

  $(document).on("click", "#dropdownMenuLink", function(event){
    const clickedElement = $(event.target.parentNode).children().last();
    clickedElement.toggleClass('show');
  });

  $(document).on("click", ".toggleMenu", function () { 
    $("#mainMenu").toggleClass('open');
  });
});

