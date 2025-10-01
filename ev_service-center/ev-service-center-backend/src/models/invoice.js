const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Invoice = sequelize.define('Invoice', {
  Invoice_ID: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  Booking_ID: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Amount: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false
  },
  Date_issued: {
    type: DataTypes.DATE,
    allowNull: false
  }
}, {
  tableName: 'Invoices',
  timestamps: false
});

module.exports = Invoice;
