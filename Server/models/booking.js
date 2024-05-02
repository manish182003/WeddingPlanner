//const { Timestamp } = require('mongodb');
const mongoose=require('mongoose')
const BookingSchema = new mongoose.Schema({

  username:{
    type:String,
  },
  name:{
    type: String,
    required : true,
  },
  description: {
    type: String ,
  },
  price: {
    type: String,
  },
  image: [{
    type: String,
  }],
}, { Timestamp : true });

const booking=mongoose.model('booking',BookingSchema);
module.exports=booking;