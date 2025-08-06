
document.addEventListener("turbo:load", () => {
  const navLinks = document.querySelectorAll(".topbar a");
  const details = document.querySelectorAll(".property-detail");
  const cards = document.querySelectorAll(".property-card");

  navLinks.forEach(link => {
    link.addEventListener("click", e => {
      e.preventDefault();
      const propertyId = link.dataset.propertyId;

      // Hide all details & cards
      details.forEach(d => d.style.display = "none");
      cards.forEach(c => c.style.display = "none");

      debugger
      // Show selected property
      document.querySelector(`.property-detail[data-property-id="${propertyId}"]`).style.display = "flex";
      document.querySelectorAll(`.property-card[data-property-id="${propertyId}"]`).forEach(c => {
        c.style.display = "block";
      });
    });
  });

  // Show first property by default
  if (navLinks.length > 0) {
    navLinks[0].click();
  }
});
