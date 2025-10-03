const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const ServiceCenter = sequelize.define('ServiceCenter', {
  Service_center_ID: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  Name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Location: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Contact: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  tableName: 'Service_centers',
  timestamps: false
});

module.exports = ServiceCenter;
