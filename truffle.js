module.exports = {
  build: {
    "index.html": "index.html",
    "app.js": [
      "../node_modules/jquery/dist/jquery.min.js",
      "js/app.js"
    ],
    "app.css": [
      "css/app.css"
    ],
    "images/": "images/"
  },
  rpc: {
    host: "localhost",
    port: 8545
  }
};
