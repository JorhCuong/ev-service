const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const WorkOrder = sequelize.define('WorkOrder', {
  Work_order_ID: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  Booking_ID: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Technician_name: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Status: {
    type: DataTypes.ENUM('pending', 'in_progress', 'completed'),
    allowNull: false
  },
  Completion_date: {
    type: DataTypes.DATE,
    allowNull: true
  }
}, {
  tableName: 'Work_orders',
  timestamps: false
});

module.exports = WorkOrder;
