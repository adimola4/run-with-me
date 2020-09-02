// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
$=require ("jquery")


$(function () {
    'use strict'
  
    $('[data-toggle="collapse"]').on('click', function () {
      // let x = document.getElementById( "collapse-hide" )
      // if (document.body.offsetWidth < 991.98){
      //   if (x.style.display === "none") {
      //     x.hidden()
      //    // x.style.display = "block !important";
      //   } 
      // }else {
      //     x.hidden()
      //     //x.style.display = "none";
      //   }
      // //document.getElementById( "collapse-hide" ).append(menu_link_add);
      $('.offcanvas-collapse').toggleClass('open')
    })
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    })
  })

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
