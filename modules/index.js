class Module {
  constructor(app) {
    this.app = app;
  }
  init() {
    const propertycontroller = require("./property/property.controller");
    new propertycontroller(this.app);
  }
}
module.exports = Module;
