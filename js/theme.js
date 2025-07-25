
document.getElementById("toggle-theme").addEventListener("click", () => {
  const body = document.body;
  body.classList.toggle("theme-dark");
  body.classList.toggle("theme-light");
  const link = document.getElementById("theme-link");
});
