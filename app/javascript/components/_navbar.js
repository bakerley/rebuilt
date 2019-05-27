const transparentNavbar = () => {
  if (window.location.pathname=="/") {
    const navbar = document.querySelector(".navbar");
    navbar.classList.remove("fixed-top");
    navbar.classList.remove("bg-primary");
  } else {
    const pageContent = document.querySelector("#page-content");
    pageContent.classList.add("pt-3")
  }
}

 export { transparentNavbar };

