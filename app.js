const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
async function init() {
  const approuting = require("./modules");
  const appmodules = new approuting(app);
  appmodules.init();
}
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
app.use(
  cors({
    origin: "*",
  })
);
init();
module.exports = app;
