const { Sequelize } = require('sequelize');
require('dotenv').config();

const sequelize = new Sequelize(
  process.env.DB_NAME,  // database name
  process.env.DB_USER,  // username
  process.env.DB_PASS,  // password
  {
    dialect: 'mssql',
    host: process.env.DB_HOST,   // Sequelize vẫn cần host
    port: process.env.DB_PORT,   // port
    logging: false,
    dialectOptions: {
      options: {
        encrypt: false,
        trustServerCertificate: true,
        server: process.env.DB_HOST   // 👈 thêm server ở đây cho tedious
      }
    }
  }
);

module.exports = sequelize;
