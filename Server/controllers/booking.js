const photographerModel = require('../models/photographer');
// const AuthModel = require('../models/User'); 
const vendorModel = require('../models/vendor');
// const venueModel = require('../models/venue'); 
const Booking = require("../models/booking");
const {handleNullVendor, handleNullPhotographer}  = require("./newServices");
// 

//To get all Bookings
async function handleGetAllBooking(req, res){
    const allDBBooking  = await Booking.find({});
    return res.json(allDBBooking);
}

//To get specfic user's booking according to its Username as username is a unique attribute

async function handleGetBookingByUsername(req, res) {
    try {
        const username = req.params.username;
        // Find bookings by username
        const bookings = await Booking.find({ username: username }).exec();
        
        if (!bookings || bookings.length === 0) {
            return res.status(404).json({ error: "Bookings not found for this username" });
        }

        return res.json(bookings);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Internal server error" });
    }
}



//To Update Booking by Username
async function handleUpdateBookingByUsername(req, res) {
    try {
        const username = req.params.username;
        const updateData = req.body; // Assuming the data to update is provided in the request body

        // Update bookings by username
        const result = await Booking.updateMany({ username: username }, updateData).exec();
        
        if (result.nModified === 0) {
            return res.status(404).json({ error: "No bookings found for this username" });
        }

        return res.json({ status: "Success", modifiedCount: result.nModified });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Internal server error" });
    }
}


//To remove booking Username
async function handleDeleteBookingByUsername(req, res) {
    try {
        const username = req.params.username;
        const bookingId = req.params.id; // Assuming bookingId is passed in the request parameters

        // Find and delete booking by username and bookingId
        const result = await Booking.findOneAndDelete({ username: username, _id: bookingId }).exec();
        
        if (!result) {
            return res.status(404).json({ error: "No booking found for this username and bookingId" });
        }

        return res.json({ status: "Success", deletedBooking: result });
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Internal server error" });
    }
}




//To add or create new booking for photographer by photographerName
async function handleCreateNewBookingForPhotographer(req, res){
    try {
        const body = req.body;

        // Find the specific photographer from vendor collection by photographerName
        const photographers = await photographerModel.find({ photographerName: req.params.photographerName }).exec();

        // Check if the photographer exists in the database
        if (photographers.length === 0) {
            // If photographer is not found, call the function to handle the case of null photographer
            await handleNullPhotographer(req.params.photographerName, res, body.username);
            return; // Exit the function after calling handleNullVendor
            
        }

        // Check if username is provided or not
        if (!body.user_name) {
            return res.status(400).json({ msg: "All fields are required" });
        }

        // Iterate over photographers to create bookings and add username to booking collections provided by the user
        for (const photographer of photographers) {
            const bookingData = {
                username: body.user_name,
                name: photographer.photographerName,
                description: photographer.photographerDiscription,
                price: photographer.photographerPrice,
                image: photographer.photographerImage,
            };

            // Insert booking data into bookings table
            await Booking.create(bookingData);
        }

        return res.status(201).json({ msg: "Success" });

    } catch (error) {
        console.error(error); // Log the error for debugging
        return res.status(400).json({ msg: "Failure" }); // Return failure response
    }
}



//To add or create new booking for vendor by id
async function handleCreateNewBookingForVendor(req, res){
    try {
        const body = req.body;

        // Find the specific vendor from vendor collection by vendorName
        const vendor = await vendorModel.findOne({ vendorName: req.body.vendorName }).exec();

        // Check if the vendor exists in the database
        if (!vendor) {
            // If vendor is not found, call the function to handle the case of null vendor
            await handleNullVendor(req.body.vendorName, res, body.username,body.image,body.description,body.price);
            return; // Exit the function after calling handleNullVendor
            
        }

        // Check if username is provided or not
        if (!body.username) {
            return res.status(400).json({ msg: "All fields are required" });
        }

        // Iterate over vendors to create bookings and add username to booking collections provided by the user
   
             let isBooked=await Booking.findOne({username:body.username, name:vendor.vendorName});

             if(isBooked){
               res.status(400).json({msg:'Venue Already Booked'});
               return;
             }else{
                const bookingData = {
                    username: body.username,
                    name: vendor.vendorName,
                    description: vendor.vendorDiscription,
                    price: vendor.vendorPrice,
                    image: vendor.vendorImage,
                };
    
                // Insert booking data into bookings table
                await Booking.create(bookingData);
             }


    
          
        

        return res.status(201).json({ msg: "Success" });

    } catch (error) {
        console.error(error); 
        return res.status(400).json({ msg: "Failure" }); // Return failure response
    }
}




//To add or create new booking for venue by id
// async function handleCreateNewBookingForVenue(req, res) {
//     try {
//         const body = req.body

//         //venues finds the specfic venue from venue collection by id of venue 
//         const venues = await venueModel.find({ _id: req.params.id }).exec();

//         //checks if username is provided or not *Note: user name is a unique value therefore
//         // can be used to retrive data from its respective table or locations linked to it
//         if (!body.user_name) {
//             return res.status(400).json({ msg: "All fields are required" });
//         }

//         // Iterate over venues to create bookings also add the username to booking collections which is provided by user
//         for (const venue of venues) {
//             const bookingData = {
//                 username: body.user_name,
//                 name: venue.venueName,
//                 description: venue.venueDiscription,
//                 price: venue.venuePrice,
//                 image: venue.venueImage,
//                 // Other fields if any
//             };

//             // Insert booking data into bookings table
//             await Booking.create(bookingData);
//         }

//         return res.status(201).json({ msg: "Success" });

//     } catch (error) {
//         return res.status(400).json({ msg: "failure" });
//     }
// }


module.exports = {
    handleCreateNewBookingForVendor,
    handleGetAllBooking,
    handleGetBookingByUsername,
    handleDeleteBookingByUsername,
    handleUpdateBookingByUsername,
    handleCreateNewBookingForPhotographer,
    // handleCreateNewBookingForVendor,
    // handleCreateNewBookingForVenue
};
