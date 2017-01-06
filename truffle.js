module.exports = {
  build: {
    "index.html": "index.html",
    "dashboard.html": "dashboard.html",
    "app.js": [
      "../node_modules/jquery/dist/jquery.min.js",
      "../node_modules/bootstrap/dist/js/bootstrap.min.js",
      "js/app.js",
      "./js/"
    ],
    "app.css": [
     "../node_modules/bootstrap/dist/css/bootstrap.min.css",
      "css/app.css",
      "./css/",
      "stylsheets/app.css",
      "stylesheets/dashboard.css",
    ],
    "images/": "./img/"
  },
  rpc: {
    host: "localhost",
    port: 8545
  }
};
