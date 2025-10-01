const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Payment = sequelize.define('Payment', {
  Payment_ID: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  Invoice_ID: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Amount_paid: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false
  },
  Payment_date: {
    type: DataTypes.DATE,
    allowNull: false
  },
  Payment_method: {
    type: DataTypes.ENUM('cash', 'credit_card', 'bank_transfer'),
    allowNull: false
  }
}, {
  tableName: 'Payments',
  timestamps: false
});

module.exports = Payment;
