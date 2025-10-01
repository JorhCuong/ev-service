const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const ChecklistItem = sequelize.define('ChecklistItem', {
  Checklist_item_ID: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  Description: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Status: {
    type: DataTypes.ENUM('pending', 'completed'),
    allowNull: false
  },
  Work_order_ID: {
    type: DataTypes.STRING,
    allowNull: false
  }
}, {
  tableName: 'Checklist_items',
  timestamps: false
});

module.exports = ChecklistItem;
