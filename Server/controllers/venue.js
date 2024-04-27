const Venue = require("../models/venue");

//To get all vendors
async function handleGetAllVenue(req, res){
    const allDBVenue  = await Venue.find({});
    return res.json(allDBVenue);
}

//To get specfic user according to its id
async function handleGetVenueById(req, res){
    const venue  = await Venue.findById(req.params.id);
    if(!venue) return res.status(404).json({ error : "user not found"});
    return res.json(venue);
}

//To apdate vendor
async function handleUpdateVenueById(req, res){
    await Venue.findByIdAndUpdate(req.params.id);
    return res.json({status : "Sucess"});
}

//To remove vendor
async function handleDeleteVenueById(req, res){
    await Venue.findByIdAndDelete(req.params.id);
    return res.json({status : "Success"});
}

//To add or create new vendor
async function handleCreateNewVenue(req, res){
    const body = req.body;
 

    if(
        !body.venue_Name || 
        !body.venue_Image ||
        !body.venue_Location ||
        !body.venue_Discription ||
        !body.venue_Price
    ){
     
        return res.status(400).json({msg : "All fields are required"});
    }
     
    const result = await Venue.create({
        venueName: body.venue_Name,
        venueImage: body.venue_Image,
        venueLocation: body.venue_Location,
        venueDiscription: body.venue_Discription,
        venuePrice: body.venue_Price,
        

    });
       
    return res.status(201).json({msg: "Success", id: result._id});
}

module.exports = {
    handleGetAllVenue,
    handleGetVenueById,
    handleDeleteVenueById,
    handleUpdateVenueById,
    handleCreateNewVenue,
};
