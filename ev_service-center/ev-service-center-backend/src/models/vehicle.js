// models/vehicle.js
const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Vehicle = sequelize.define('Vehicle', {
  Vehicle_ID: {
    type: DataTypes.CHAR(36),
    primaryKey: true,
    defaultValue: DataTypes.UUIDV4,
  },
  Customer_ID: {
    type: DataTypes.CHAR(36),
    allowNull: false,
  },
  Brand: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  Model: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  Color: {
    type: DataTypes.STRING(30),
  },
}, {
  tableName: 'Vehicles',
  timestamps: true,
  createdAt: 'Created_at',
  updatedAt: 'Updated_at'
});

module.exports = Vehicle;
