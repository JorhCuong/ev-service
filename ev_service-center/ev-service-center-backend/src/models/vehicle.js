// models/Vehicle.js
module.exports = (sequelize, DataTypes) => {
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

  // Thiết lập quan hệ
  Vehicle.associate = (models) => {
    Vehicle.belongsTo(models.User, {
      foreignKey: 'Customer_ID',
      as: 'Customer'
    });
    Vehicle.hasMany(models.Booking, {
      foreignKey: 'Vehicle_ID',
      as: 'Bookings'
    });
  };

  return Vehicle;
};
