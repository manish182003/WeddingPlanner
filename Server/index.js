const express = require('express');
const app = express();
const db = require('./db');
const vendorRouter = require("./routes/vendor")
const venueRouter = require("./routes/venue")
const photographerRouter = require("./routes/photographer")
const authRoutes = require('./routes/auth');
const otp=require('./routes/otp')
const bookingRouter = require("./routes/booking")

// const mailrouter =  require('./routes/mail');

// Setting a incoming request format to json and urlencoded So we can get it with req.body
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// route for /login and /signup
app.use('/api/auth', authRoutes);

// route for venues get and create
app.use("/api/vendor", vendorRouter);

// route for venues get and create
app.use("/api/photographer", photographerRouter);

// route for venues get and create
app.use("/api/venue", venueRouter);


//route for booking get and create
app.use("/api/booking",bookingRouter)

app.use(otp);

app.listen(3000, () => {
  console.log('Server is running on port 3000 ');
});
