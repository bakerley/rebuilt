const transparentNavbarFooter = () => {
    const navbar = document.querySelector(".navbar");
    const footer = document.querySelector(".footer");
    const pageContent = document.querySelector("#page-content")
  if (window.location.pathname=="/") {
    navbar.classList.remove("fixed-top");
    navbar.classList.remove("bg-primary");
    footer.classList.remove("bg-primary");
    pageContent.classList.remove("min-height-100");
    footer.classList.add("bg-transparent");
    footer.classList.add("position-fixed-bottom");
  } else {
    pageContent.classList.add("pt-5");
    pageContent.classList.add("pb-5");
    footer.classList.add("bg-primary");
  }
}

 export { transparentNavbarFooter };

