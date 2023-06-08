function responsiveMenu() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += "responsive";
  } else {
    x.className = "topnav";
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
