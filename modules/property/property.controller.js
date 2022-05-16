const property = require("./property");
const express = require("express");
const router = express.Router();
class propertyController {
  constructor(app) {
    router.get("/", property.getAllpropertys);
    router.post("/", (req, res) => {
      return property.addproperty(req);
    });
    router.put("/", (req, res) => {
      return property.updateproperty(req);
    });
    router.delete("/:id", (id, res) => {
      return property.deleteproperty(id);
    });
    app.use("/api/v1/properties", router);
  }
}
module.exports = propertyController;
