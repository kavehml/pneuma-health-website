(function () {
  var buttons = document.querySelectorAll(".filter-btn");
  var cards = document.querySelectorAll(".therapist-card");

  buttons.forEach(function (btn) {
    btn.addEventListener("click", function () {
      var cat = btn.getAttribute("data-filter") || "all";

      buttons.forEach(function (b) {
        b.classList.toggle("is-active", b === btn);
      });

      cards.forEach(function (card) {
        var raw = card.getAttribute("data-categories") || "";
        var list = raw.split(/\s+/).filter(Boolean);
        if (cat === "all" || list.indexOf(cat) !== -1) {
          card.removeAttribute("hidden");
        } else {
          card.setAttribute("hidden", "");
        }
      });
    });
  });
})();
