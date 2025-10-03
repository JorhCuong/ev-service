const { Vehicle } = require('../models');  // Sequelize auto index.js export

// Tạo xe mới
exports.createVehicle = async (req, res) => {
  try {
    const vehicle = await Vehicle.create(req.body);
    res.status(201).json(vehicle);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Lấy tất cả xe theo Customer_ID
exports.getVehiclesByCustomer = async (req, res) => {
  try {
    const vehicles = await Vehicle.findAll({ where: { Customer_ID: req.params.customerId } });
    res.json(vehicles);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Lấy chi tiết 1 xe
exports.getVehicle = async (req, res) => {
  try {
    const vehicle = await Vehicle.findByPk(req.params.id);
    if (!vehicle) return res.status(404).json({ error: 'Vehicle not found' });
    res.json(vehicle);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Cập nhật xe
exports.updateVehicle = async (req, res) => {
  try {
    const [updated] = await Vehicle.update(req.body, { where: { Vehicle_ID: req.params.id } });
    if (!updated) return res.status(404).json({ error: 'Vehicle not found' });
    const vehicle = await Vehicle.findByPk(req.params.id);
    res.json(vehicle);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

// Xóa xe
exports.deleteVehicle = async (req, res) => {
  try {
    const deleted = await Vehicle.destroy({ where: { Vehicle_ID: req.params.id } });
    if (!deleted) return res.status(404).json({ error: 'Vehicle not found' });
    res.json({ ok: true });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
