const express = require('express');
const { sequelize } = require('./src/models');


const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());

// test route
app.get('/', (req, res) => {
  res.send('<h1>EV Service Center API running...</h1>');
});

// connect DB
sequelize.authenticate()
  .then(() => {
    console.log('✅ Database connected');
    app.listen(PORT, () => {
    console.log(`Chúc mừng server của bạn đã chạy thành công http//ev-service-center:${PORT}`);
  });
  })
  .catch(err => console.error(' DB connection failed: ', err));

  

