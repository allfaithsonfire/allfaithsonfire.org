import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import sqlite3 from 'better-sqlite3';
import ejs from 'ejs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const db = sqlite3('../allfaithsonfire.db');

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  const books = db.prepare('SELECT id, title FROM books').all();
  books.forEach(book => {
    book.chapters = db.prepare('SELECT id, title, filename FROM chapters WHERE book_id = ?').all(book.id);
  });

  const quote = db.prepare('SELECT quote FROM quotes ORDER BY RANDOM() LIMIT 1').get() || { quote: 'Let the word be light.' };

  const filename = req.query.chapter;
  let chapter = null;
  let verses = [];

  if (filename) {
    chapter = db.prepare('SELECT id, title FROM chapters WHERE filename = ?').get(filename);
    if (chapter) {
      verses = db.prepare('SELECT verse_number, text FROM verses WHERE chapter_id = ? ORDER BY verse_number ASC').all(chapter.id);
    }
  }

  res.render('index', { books, chapter, verses, quote });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running at http://localhost:${PORT}`));


app.get('/chapter/:filename', (req, res) => {
  const chapter = db.prepare(`
    SELECT c.id, c.title AS chapter_title, b.title AS book_title,
           c.created_at, c.moral, c.consequence, c.redemption
    FROM chapters c
    JOIN books b ON c.book_id = b.id
    WHERE c.filename = ?
  `).get(req.params.filename);

  if (!chapter) return res.status(404).send("Not found");

  const verses = db.prepare(`
    SELECT verse_number, text
    FROM verses
    WHERE chapter_id = ?
    ORDER BY verse_number ASC
  `).all(chapter.id);

  res.render('chapter_snippet', { chapter, verses });
});