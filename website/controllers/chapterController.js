import Database from 'better-sqlite3';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
// The database file lives in the repository root. The previous relative path
// pointed to `website/db/allfaithsonfire.db`, which does not exist and causes
// runtime failures when the site attempts to open the SQLite database. Adjust
// the path to correctly resolve the database from the controller directory.
const db = new Database(path.join(__dirname, '../../allfaithsonfire.db'));

export function getChapter(req, res) {
  const stmt = db.prepare(`
    SELECT c.id, c.title, c.filename, c.created_at, 
           b.title AS book_title,
           m.text AS moral, r.text AS redemption, co.text AS consequence
    FROM chapters c
    JOIN books b ON b.id = c.book_id
    LEFT JOIN morals m ON m.id = c.moral_id
    LEFT JOIN redemptions r ON r.id = c.redemption_id
    LEFT JOIN consequences co ON co.id = c.consequence_id
    WHERE c.id = ?
  `);
  const chapter = stmt.get(req.params.id);

  const verses = db.prepare('SELECT verse_number, text FROM verses WHERE chapter_id = ? ORDER BY verse_number ASC').all(req.params.id);

  if (!chapter) return res.status(404).render('404', { title: 'Chapter Not Found' });

  res.render('chapter', { chapter, verses });
}
