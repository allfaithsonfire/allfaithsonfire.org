import express from 'express';
import { getChapter } from '../controllers/chapterController.js';

const router = express.Router();

router.get('/', (req, res) => {
  res.redirect('/chapter/1');
});

router.get('/chapter/:id', getChapter);

export default router;
