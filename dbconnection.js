const mssql = require("mssql");
class DBConnection {
  async getConnection() {
    try {
      return await mssql.connect({
        type: "MSSQLSERVER",
        user: "sa",
        password: "sql",
        server: "localhost",
        database: "property_management",
        port: 1433,
        trustServerCertificate: true,
      });
    } catch (error) {
      console.log(error);
    }
  }
}
module.exports = new DBConnection();
