const mssqlcon = require("../../dbconnection");
class propertyMSSql {
  async getAllpropertys() {
    const conn = await mssqlcon.getConnection();
    const res = await conn.request().execute("getAllProperties");

    return res.recordset;
  }
  async addproperty(prod) {
    //console.log(prod);
    const conn = await mssqlcon.getConnection();
    const res = await conn
      .request()
      .input("property_name", prod.property_name)
      .input("property_address", prod.property_address)
      .input("property_geo_location", prod.property_geo_location)
      .execute("addproperty");
    return res;
  }
  async updateproperty(prod) {
    const conn = await mssqlcon.getConnection();
    const res = await conn
      .request()
      .input("property_id", prod.property_id)
      .input("property_name", prod.property_name)
      .input("property_address", prod.property_description)
      .input("property_geo_location", prod.property_qty)
      .execute("updateproperty");
    return res;
  }
  async deleteproperty(id) {
    const conn = await mssqlcon.getConnection();
    const res = await conn
      .request()
      .input("property_id", id)
      .execute("deleteproperty");
    return res;
  }
}
module.exports = new propertyMSSql();
