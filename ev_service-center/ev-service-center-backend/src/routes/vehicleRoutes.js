const express = require('express');
const router = express.Router();
const vehicleController = require('../controllers/vehicleController');

router.post('/', vehicleController.createVehicle);
router.get('/customer/:customerId', vehicleController.getVehiclesByCustomer);
router.get('/:id', vehicleController.getVehicle);
router.put('/:id', vehicleController.updateVehicle);
router.delete('/:id', vehicleController.deleteVehicle);

module.exports = router;
