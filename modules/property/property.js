const propertyMssql = require("./property.mssql");
class property {
  async getAllpropertys(req, res) {
    try {
      const output = await propertyMssql.getAllpropertys();
      res.send(output);
    } catch (error) {
      console.log(error);
    }
  }
  async addproperty(req, res) {
    try {
      const output = await propertyMssql.addproperty(req);
      res.send(output);
    } catch (error) {
      console.log(error);
    }
  }
  async updateproperty(req, res) {
    try {
      const output = await propertyMssql.updateproperty(req);
      res.send(output);
    } catch (error) {
      console.log(error);
    }
  }
  async deleteproperty(id) {
    try {
      const output = await propertyMssql.deleteproperty(id);
      res.send(output);
    } catch (error) {
      console.log(error);
    }
  }
}
module.exports = new property();
