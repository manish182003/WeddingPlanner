const express=require('express');
const otp=express.Router();
const nodemailer = require('nodemailer');
const {google}  =  require("googleapis");
const otpdata=require('../models/otp');
const User=require('../models/User');
const bcrypt = require('bcrypt');



otp.post("/api/mail/otp", async(req,res)=>{
    const reset_email = req.body.email;



     const user=await User.findOne({username:reset_email});


     if(!user){
      res.status(400).json({error:'User with that email does not exist!'})
     }else{
      const CLIENT_ID = "145604803965-ihnq83tuh9v2g5r4ojbid30stsrm9unc.apps.googleusercontent.com";
      const CLIENT_SECRET =  "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";
      const REFRESH_TOKEN = "1//04MYkFrc8-wbFCgYIARAAGAQSNwF-L9IrJE5fV-GW_b3CVrghdmWW_4h3wAovxIsgSsKF3kFCz5QT8Fby-lGV12TcN4hJwqu4GqU";
      const REDIRECT_URI = "https://developers.google.com/oauthplayground";
    
      const OAuth2Client = new google.auth.OAuth2(CLIENT_ID, CLIENT_SECRET, REDIRECT_URI);
      const randomNumber = Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000;
    
      OAuth2Client.setCredentials({ refresh_token : REFRESH_TOKEN});
    
        try{
            const accesstoken =  await OAuth2Client.getAccessToken();
            const transport = nodemailer.createTransport({
                service: 'gmail',
                auth: {
                    type: 'OAuth2',
                    user: 'EternalTie.EternalTie@gmail.com',
                    pass: 'EternalTie.EternalTie123',
                    clientId: CLIENT_ID,
                    clientSecret: CLIENT_SECRET,
                    refreshToken: REFRESH_TOKEN,
                    accessToken: accesstoken
                }
            });
    
            const mailOptions = {
                from: 'EternalTie 🥰💖 <EternalTie.EternalTie@gmail.com>',
                to: reset_email,
                subject: "Verification Email",
                // text:"",
                html:"<center>Your OTP Is\n <h1 style='color:green;'>"+randomNumber+"</h1></center>",
    
            }
    
            // const result =  await transport.sendMail(mailOptions);
            const result = transport.sendMail(mailOptions,async  function (errors, info) {
              if (errors) {
                console.log(errors);
                res.json({message:"OTP Is Send is failed"});
              } else {
                console.log(info);
                res.status(200).json({message:"OTP Is Sended"});
                const data=await otpdata.findOne({email: reset_email});
                if(!data){
                  const OTP=otpdata({otp:randomNumber,email:reset_email});
                  await OTP.save(); 
                }else{
                  data.otp=randomNumber;
                  await data.save();
                }
             
          
  
              }
            });
      
            
    
        } catch(error){
            console.log(error);
            res.json({message:"OTP Is Send failed"});
        }
     }
  
    
  })



  otp.post('/api/mail/validateOtp',async(req,res)=>{


    try{

      const {email,otp}=req.body;
   
      const OTP=await otpdata.findOne({email})
         
      if(!OTP){
       res.status(400).json({error:'InValid OTP'})
      }
   
      if(OTP.otp!=Number(otp)){
       res.status(400).json({error:'Otp is Not Recognized'})
      }else{
     
        res.status(200).json({message:'otp is correct'});
   
   
      }
   
   
    }catch(e){
      res.status(400).json({error:e.message});
    }

  
     



  });


  otp.post('/api/mail/changePassword',async(req,res)=>{



    try{

      const {email,password}=req.body;

      const user= await User.findOne({username:email});

       if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }
    const saltRounds=10;
    const salt = await bcrypt.genSalt(saltRounds);
    const hashedPassword = await bcrypt.hash(password, salt);

      
  console.log(user)
    user.password=hashedPassword;
    await user.save();

  await otpdata.deleteOne({email});
  res.status(200).json({success:'Password Changed Successfuly'});



    }catch(e){
      res.status(400).json({error:e.message});
    }

   




   });


  module.exports=otp;
  
