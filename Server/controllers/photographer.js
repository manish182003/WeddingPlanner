const Photographer = require("../models/photographer");


//To get all vendors
async function handleGetAllphotographer(req, res){
    const allDBphotographer  = await Photographer.find({});
    return res.json(allDBphotographer);
}

//To get specfic user according to its id
async function handleGetphotographerById(req, res){
    const photographer  = await Photographer.findById(req.params.id);
    if(!photographer) return res.status(404).json({ error : "user not found"});
    return res.json(photographer);
}

//To update vendor 
async function handleUpdatephotographerById(req, res){
    await Photographer.findByIdAndUpdate(req.params.id);
    return res.json({status : "Sucess"});
}

//To remove vendor
async function handleDeletephotographerById(req, res){
    await photographer.findByIdAndDelete(req.params.id);
    return res.json({status : "Success"});
}

//To add or create new vendor
async function handleCreateNewphotographer(req, res){
    const body = req.body;
    if(
        
        !body.photographer_Name || 
        !body.photographer_Image ||
        !body.photographer_Discription ||
        !body.photographer_Price
    ){
        return res.status(400).json({msg : "All fields are required"});
    }

    const result = await Photographer.create({
        photographerName: body.photographer_Name,
        photographerImage: body.photographer_Image,
        photographerDiscription: body.photographer_Discription,
        photographerPrice: body.photographer_Price,
    });
    return res.status(201).json({msg: "Success", id: result._id});
}

module.exports = {
    handleGetAllphotographer,
    handleGetphotographerById,
    handleDeletephotographerById,
    handleUpdatephotographerById,
    handleCreateNewphotographer,
};
