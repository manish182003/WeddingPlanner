const express = require("express");
const { connectMongoDB } = require("./connection");
const vendorRouter = require("./routes/vendor")

const app = express();
const port = 3000;


//Connection
connectMongoDB("mongodb://localhost:27017/AdminDB").then(() => 
    console.log("MongoDB Connected!")
);

//middleware to convert object to json
app.use(express.json());


//Routes

app.use("/api/vendor", vendorRouter);

app.listen(port, () => console.log("server started"));

