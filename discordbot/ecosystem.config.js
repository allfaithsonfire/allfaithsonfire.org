module.exports = {
  apps: [{
    name: "allfaithsbot",
    script: "bot.js",
    watch: false,
    env: {
      NODE_ENV: "production"
    }
  }]
};