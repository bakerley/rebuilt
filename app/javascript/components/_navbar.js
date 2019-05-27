const transparentNavbar = () => {
  if (window.location.pathname=="/") {
    const navbar = document.querySelector(".navbar");
    navbar.classList.remove("fixed-top");
    navbar.classList.remove("bg-primary");
  }
}

 export { transparentNavbar };

