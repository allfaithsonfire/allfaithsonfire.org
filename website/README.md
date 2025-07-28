# AllFaithsOnFire Web Server

## 🧪 Development
```bash
npm install
npm run dev
```

## 🚀 Production
```bash
npm run prod
pm2 save
pm2 startup
```

## Notes
- This server reads from a shared SQLite DB at `../allfaithsonfire.db`.
- Static files (HTML/CSS/JS) go in the `/public` folder.