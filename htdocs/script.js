
document.querySelectorAll('.book-toggle').forEach(btn => {
    btn.addEventListener('click', () => {
        const chapters = btn.nextElementSibling;
        chapters.style.display = chapters.style.display === 'block' ? 'none' : 'block';
    });
});
