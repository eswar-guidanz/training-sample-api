const property = require("./property");
const express = require("express");

var cors = require("cors");
const corsOptions = {
  origin: "*",
  credentials: true, //access-control-allow-credentials:true
  optionSuccessStatus: 200,
};
const router = express.Router();
class propertyController {
  constructor(app) {
    router.get("/", property.getAllpropertys);
    router.post("/", (req, res) => {
      console.log(req.body, "body");
      return property.addproperty(req.body);
    });
    router.put("/", (req, res) => {
      return property.updateproperty(req);
    });
    router.delete("/:id", (id, res) => {
      return property.deleteproperty(id);
    });
    app.use("/api/v1/properties", router);
    app.use(cors(corsOptions));
  }
}
module.exports = propertyController;
