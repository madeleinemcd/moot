// function responsiveMenu() {
//   var x = document.getElementById("myTopnav");
//   if (x.className === "topnav") {
//     x.className += "responsive";
//   } else {
//     x.className = "topnav";
//   }
//   if (x.className === "search-function") {
//     x.className += "responsive";
//   } else {
//     x.className = "search-function";
//   }
// }

// function responsiveMenu() {
//   var x = document.getElementById("myTopnav");
//   var searchFunction = document.getElementById("searchFunction");

//   if (x.className === "topnav") {
//     x.className += " responsive";
//   } else {
//     x.className = "topnav";
//   }

//   if (searchFunction.className === "search-function") {
//     searchFunction.className += " responsive";
//   } else {
//     searchFunction.className = "search-function";
//   }
// }

//another futile try

// document.addEventListener("DOMContentLoaded", function() {
//   var searchContainer = document.getElementById("searchContainer");

//   function toggleSearchBar() {
//     searchContainer.classList.toggle("responsive");
//   }

//   function scrollFunction() {
//     var navbar = document.getElementById("myTopnav");
//     var sticky = navbar.offsetTop;

//     if (window.pageYOffset >= sticky) {
//       navbar.classList.add("sticky");
//     } else {
//       navbar.classList.remove("sticky");
//     }
//   }

//   window.onscroll = scrollFunction;

//   var icon = document.getElementById("navbarIcon");
//   icon.addEventListener("click", toggleSearchBar);

//   var navbar = document.getElementById("myTopnav");
//   navbar.addEventListener("click", function(event) {
//     if (!event.target.matches(".search-bar *")) {
//       searchContainer.classList.remove("responsive");
//     }
//   });
// });





//this below is the *working* code


function responsiveMenu() {
  var x = document.getElementById("myTopnav");
  var searchContainer = document.getElementById("searchContainer");

  if (x.className === "topnav") {
    x.className += " responsive";
    // searchContainer.style.display = "flex";
    searchContainer.className += " responsive";
  } else {
    x.className = "topnav";
    searchContainer.className = "search-bar";
    // searchContainer.style.display = "none";
  }
}



document.addEventListener("DOMContentLoaded", function() {
  // When the user scrolls the page, execute scrollFunction
  window.onscroll = function() {scrollFunction()};
  // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
  function scrollFunction() {
    console.log('Page offset:', window.pageYOffset);
    console.log('Sticky offset:', sticky);
    // Get the navbar
    var navbar = document.getElementById("myTopnav");
    // Get the offset position of the navbar
    var sticky = navbar.offsetTop;
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  }
});
