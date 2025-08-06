document.addEventListener("turbo:load", () => {
  const nav = document.querySelector(".topbar");
  const btnPrev = document.querySelector(".scroll-btn.prev");
  const btnNext = document.querySelector(".scroll-btn.next");

  if (nav && btnPrev && btnNext) {
    btnPrev.addEventListener("click", () => {
      nav.scrollBy({ left: -150, behavior: "smooth" });
    });

    btnNext.addEventListener("click", () => {
      nav.scrollBy({ left: 150, behavior: "smooth" });
    });
  }
});
