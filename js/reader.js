
document.addEventListener("DOMContentLoaded", () => {
  const links = document.querySelectorAll("a[data-path]");
  const reader = document.getElementById("reader");

  if (!reader) return;

  links.forEach(link => {
    link.addEventListener("click", async (e) => {
      e.preventDefault();
      const path = link.getAttribute("data-path");

      try {
        const response = await fetch(path);
        if (!response.ok) throw new Error("Fetch failed");
        const html = await response.text();
        reader.innerHTML = html;
        reader.scrollIntoView({ behavior: "smooth" });
      } catch (err) {
        reader.innerHTML = "<p>Error loading chapter. Please try again.</p>";
        console.error("Error loading chapter:", err);
      }
    });
  });
});
