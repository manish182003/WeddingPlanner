const mongoose=require('mongoose')
const otpSchema=mongoose.Schema({

  otp:{
    required:true,
    type:Number,
  },
  email:{
    required:true,
    type:String,
  },
  CreatedAt:{
    type:Date,
    default:Date.now(),
  }



});

const otp=mongoose.model('otp',otpSchema);
module.exports=otp;