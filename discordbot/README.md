# AllFaiths Discord Bot

This bot posts a daily Word from your allfaithsonfire.db and responds to:
- `/word` – sends a random verse
- `/quote` – sends a quote of the day

## 🔧 Setup

```bash
npm install
```

## 🧪 Dev Mode

```bash
npm run dev
```

## 🚀 Production Mode (with pm2)

```bash
npm run prod
pm2 save
pm2 startup
```

## Config

Edit `config.json`:
- `"token"`: your bot token
- `"channelId"`: where to post
- `"postTimeUTC"`: time to post (24h UTC, e.g., "15:00")