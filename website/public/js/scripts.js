document.addEventListener('DOMContentLoaded', () => {
  const themeButtons = document.querySelectorAll('#theme-menu button[data-theme]');
  const columnToggle = document.querySelector('#theme-menu input[type=checkbox]');
  const root = document.body;

  // Load theme
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme) root.classList.add(savedTheme);

  // Load column setting
  if (localStorage.getItem('twocol') === 'true') {
    document.querySelector('.inner-content').classList.add('two-col');
    columnToggle.checked = true;
  }

  themeButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      root.className = '';
      root.classList.add(btn.dataset.theme);
      localStorage.setItem('theme', btn.dataset.theme);
    });
  });

  columnToggle.addEventListener('change', () => {
    const content = document.querySelector('.inner-content');
    if (columnToggle.checked) {
      content.classList.add('two-col');
      localStorage.setItem('twocol', 'true');
    } else {
      content.classList.remove('two-col');
      localStorage.setItem('twocol', 'false');
    }
  });

  // TOC book toggles
  document.querySelectorAll('.book-toggle').forEach(toggle => {
    toggle.addEventListener('click', () => {
      const list = toggle.nextElementSibling;
      list.classList.toggle('open');
    });
  });
});