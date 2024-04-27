const Vendor = require("../models/vendor");

// 

//To get all vendors
async function handleGetAllVendor(req, res){
    const allDBVendors  = await Vendor.find({});
    return res.json(allDBVendors);
}

//To get specfic user according to its id
async function handleGetVendorById(req, res){
    const vendor  = await Vendor.findById(req.params.id);
    if(!vendor) return res.status(404).json({ error : "user not found"});
    return res.json(vendor);
}

//To apdate vendor
async function handleUpdateVendorById(req, res){
    await Vendor.findByIdAndUpdate(req.params.id);
    return res.json({status : "Sucess"});
}

//To remove vendor
async function handleDeleteVendorById(req, res){
    await vendor.findByIdAndDelete(req.params.id);
    return res.json({status : "Success"});
}

//To add or create new vendor
async function handleCreateNewVendor(req, res){
    const body = req.body;
 

    if(
        !body.vendor_Name || 
        !body.vendor_Image ||
        !body.vendor_Discription ||
        !body.vendor_Price
    ){
     
        return res.status(400).json({msg : "All fields are required"});
    }
     
    const result = await Vendor.create({
        vendorName: body.vendor_Name,
        vendorImage: body.vendor_Image,
        vendorDiscription: body.vendor_Discription,
        vendorPrice: body.vendor_Price,
    });
       
    return res.status(201).json({msg: "Success", id: result._id});
}

module.exports = {
    handleGetAllVendor,
    handleGetVendorById,
    handleDeleteVendorById,
    handleUpdateVendorById,
    handleCreateNewVendor,
};
