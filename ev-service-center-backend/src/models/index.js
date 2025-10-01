const sequelize = require('../config/db');
const User = require('./user');
const Booking = require('./booking');
const ServiceCenter = require('./serviceCenter');
const WorkOrder = require('./workOrder');
const Invoice = require('./invoice');
const Payment = require('./payment');
const PartUsed = require('./partUsed');
const ChecklistItem = require('./checklistItem');

//Quan hệ

// User - Booking
User.hasMany(Booking, { foreignKey: 'Customer_ID' });
Booking.belongsTo(User, { foreignKey: 'Customer_ID' });

// ServiceCenter - Booking
ServiceCenter.hasMany(Booking, { foreignKey: 'Service_center_ID' });
Booking.belongsTo(ServiceCenter, { foreignKey: 'Service_center_ID' });

// Booking - WorkOrder
Booking.hasOne(WorkOrder, { foreignKey: 'Booking_ID' });
WorkOrder.belongsTo(Booking, { foreignKey: 'Booking_ID' });

// Booking - Invoice
Booking.hasOne(Invoice, { foreignKey: 'Booking_ID' });
Invoice.belongsTo(Booking, { foreignKey: 'Booking_ID' });

// Invoice - Payment
Invoice.hasOne(Payment, { foreignKey: 'Invoice_ID' });
Payment.belongsTo(Invoice, { foreignKey: 'Invoice_ID' });

// WorkOrder - PartUsed
WorkOrder.hasMany(PartUsed, { foreignKey: 'Work_order_ID' });
PartUsed.belongsTo(WorkOrder, { foreignKey: 'Work_order_ID' });

// WorkOrder - ChecklistItem
WorkOrder.hasMany(ChecklistItem, { foreignKey: 'Work_order_ID' });
ChecklistItem.belongsTo(WorkOrder, { foreignKey: 'Work_order_ID' });

// associations
Booking.belongsTo(User, { foreignKey: 'Customer_ID' });
Booking.belongsTo(ServiceCenter, { foreignKey: 'Service_center_ID' });

module.exports = { sequelize, User, Booking, ServiceCenter, WorkOrder, Invoice, Payment, PartUsed, ChecklistItem };
