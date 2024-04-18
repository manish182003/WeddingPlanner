const { url } = require("inspector");
const mongoose = require("mongoose");

//Schema
console.log('model1')
const vendorSchema  = new mongoose.Schema({
    vendorName:{
        type: String,
        required: true,
    },
    vendorImage:[{
        type: String,
    }],
    vendorDiscription:{
        type: String,
    },
    vendorPrice:{
        type: String,
    },
});

console.log('mode2')
//model construction 
const Vendor = mongoose.model("vendors", vendorSchema);


// vendor moder exported
module.exports = Vendor;