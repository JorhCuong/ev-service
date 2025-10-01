const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const PartUsed = sequelize.define('PartUsed', {
  Part_used_ID: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  Work_order_ID: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Part_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Quantity: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  Cost: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false
  }
}, {
  tableName: 'Parts_used',
  timestamps: false
});

module.exports = PartUsed;
