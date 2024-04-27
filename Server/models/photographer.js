
const mongoose = require("mongoose");

//Schema
const photographerSchema  = new mongoose.Schema({
    photographerName:{
        type: String,
        required: true,
    },
    photographerImage:[{
        type: String,
    }],
    photographerDiscription:{
        type: String,
    },
    photographerPrice:{
        type: String,
    },
});


//model construction 
const photographer = mongoose.model("photographer", photographerSchema);


// vendor moder exported
module.exports = photographer;