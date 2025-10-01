const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Booking = sequelize.define('Booking', {
  Booking_ID: {
    type: DataTypes.STRING,
    primaryKey: true
  },
  Customer_ID: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Service_center_ID: {
    type: DataTypes.STRING,
    allowNull: false
  },
  Booking_date: {
    type: DataTypes.DATEONLY,
    allowNull: false
  },
  Scheduled_at: {
    type: DataTypes.DATE,
    allowNull: false
  },
  Status: {
    type: DataTypes.ENUM('pending', 'confirmed', 'completed', 'canceled'),
    defaultValue: 'pending'
  }
}, {
  tableName: 'Bookings',
  timestamps: false
});

module.exports = Booking;
