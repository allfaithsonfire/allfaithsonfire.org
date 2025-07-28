
import { Client, GatewayIntentBits } from 'discord.js';
import sqlite3 from 'sqlite3';
import { open } from 'sqlite';
import { readFile } from 'fs/promises';

const config = JSON.parse(await readFile('./config.json', 'utf-8'));
const client = new Client({ intents: [GatewayIntentBits.Guilds, GatewayIntentBits.GuildMessages, GatewayIntentBits.MessageContent] });

let db;

async function postTodaysWord(channel) {
  const row = await db.get('SELECT text FROM verses ORDER BY RANDOM() LIMIT 1');
  if (row) {
    channel.send(`📜 **Today’s Word:**
${row.text}`);
  }
}

async function postQuote(channel) {
  const row = await db.get('SELECT quote FROM quotes ORDER BY RANDOM() LIMIT 1');
  if (row) {
    channel.send(`💬 *${row.quote}*`);
  }
}

client.once('ready', async () => {
  console.log(`AllFaithsBot ready as ${client.user.tag}`);
  db = await open({ filename: config.dbPath, driver: sqlite3.Database });

  const now = new Date();
  const [hour, minute] = config.postTimeUTC.split(':').map(Number);
  const msUntilPost = new Date(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate(), hour, minute, 0, 0).getTime() - now.getTime();
  setTimeout(() => {
    const channel = client.channels.cache.get(config.channelId);
    if (channel) postTodaysWord(channel);
    setInterval(() => postTodaysWord(channel), 24 * 60 * 60 * 1000); // every 24h
  }, msUntilPost > 0 ? msUntilPost : 1000); // post soon if missed

  console.log('Bot scheduled for daily Word.');
});

client.on('messageCreate', async message => {
  if (!message.guild || message.author.bot) return;

  const cmd = message.content.trim().toLowerCase();
  if (cmd === '/word') {
    await postTodaysWord(message.channel);
  } else if (cmd === '/quote') {
    await postQuote(message.channel);
  }
});

client.login(config.token);
