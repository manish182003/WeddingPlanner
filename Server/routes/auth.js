// routes/auth.js
const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('../models/User');


// signup route /api/auth/signup
router.post('/signup', async (req, res) => {
 
  try {

    const { username , password } =  req.body;

    const existingUser = await User.findOne({ username });

    if (existingUser) {
      return res.status(409).json({ error: 'Username already exists' });
    }

   

    const saltRounds=10;
    const salt = await bcrypt.genSalt(saltRounds);
    const hashedPassword = await bcrypt.hash(password, salt);
    const user = new User({ username, password: hashedPassword });
    await user.save();
    res.status(201).json({ message: 'User created successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
  
});

// login route /api/auth/login
router.post('/login', async (req, res) => {
  try {
    const { username, password } = req.body;

    const user = await User.findOne({ username });
    if (!user) {
      return res.status(404).json({ error: 'Invalid username or password' });
    }
    const isValidPassword = await bcrypt.compare(password, user.password);
    if (!isValidPassword) {
      return res.status(401).json({ error: 'Invalid username or password' });
    }
    const token = jwt.sign({ userId: user._id }, 'secret');
    res.status(200).json({ token });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});


router.post('/tokenisvalid',async (req,res)=>{
  try{
   const token=req.header('x-auth-token');
   if(!token)
   return res.status(401).json({error:'Unauthorized: Token is missing or invalid'});
  const verified= jwt.verify(token,'secret');
   if(!verified){
      res.status(401).json({error:'Unauthorized: Invalid token'});
   }

  

const user=await User.findById(verified.userId);
if(!user)
return res.status(404).json({error:'User not found'});

res.status(200).json(user);


  }catch(e){
res.status(500).json({error:req.message});

  }


});








module.exports = router;
