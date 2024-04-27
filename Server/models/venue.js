const mongoose = require("mongoose");

//Schema

const venueSchema  = new mongoose.Schema({
    venueName:{
        type: String,
        required: true,
    },
    venueImage:[{
        type: String,
    }],
    venueLocation:{
        type: String,
        
    },
    venueDiscription:{
        type: String,
    },
    venuePrice:{
        type: String,
    },
});


//model construction 
const Venue = mongoose.model("venue", venueSchema);


// vendor moder exported
module.exports = Venue;