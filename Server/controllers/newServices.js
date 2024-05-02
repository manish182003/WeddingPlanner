const { handleCreateNewVendor } = require("./vendor")
const vendorModel = require("../models/vendor")
const Booking = require("../models/booking");
const photographerModel = require("../models/photographer")
const { handleCreateNewphotographer } = require("./photographer")

// a boolean flag to avoid recursion
let vendorCreated = false;

// again decleared here to avoid cirular dependency
async function handleCreateNewBookingForVendor2(req, res){
    try {
        const body = req.body;

        // Find the specific vendor from vendor collection by vendorName
        const vendors = await vendorModel.find({ vendorName: req.body.vendorName }).exec();


        // Iterate over vendors to create bookings and add username to booking collections provided by the user
        for (const vendor of vendors) {
            const bookingData = {
                username: body.user_name,
                name: vendor.vendorName,
                description: vendor.vendorDiscription,
                price: vendor.vendorPrice,
                image: vendor.vendorImage,
                // Other fields if any
            };

            // Insert booking data into bookings table
            await Booking.create(bookingData);
        }

    } catch (error) {
        console.error(error); // Log the error for debugging
       
    }
}



async function handleNullVendor(vendorName, res, username,image,description,price) {
    try {
        // Check if the vendor has already been created
        if (!vendorCreated) {
            // Call the function to create a new vendor in the database
            await handleCreateNewVendor({
                body: {
                    vendor_Name: vendorName,
                    vendor_Image: image, 
                    vendor_Discription: description, 
                    vendor_Price: price
                }
            }, res);
            // Set flag to true indicating vendor has been created
            vendorCreated = true;
        }

        // After creating the new vendor, proceed with creating the booking
        await handleCreateNewBookingForVendor2({
            body: {
                user_name: username,
                vendorName: vendorName 
            },
           
        }, res);

    } catch (error) {
        console.error(error);
    }
}

// newService for photographer:(comments same as above)

let photographerCreated = false;

async function handleCreateNewBookingForPhotographer2(req, res){
    try {
        const body = req.body;

        // Find the specific vendor from vendor collection by vendorName
        const photographers = await photographerModel.find({ photographerName: req.params.photographerName }).exec();

        // Check if the vendor exists in the database
        // if (vendors.length === 0) {
        //     // If vendor is not found, call the function to handle the case of null vendor
        //     await handleNullVendor(req.params.vendorName, res);
        //     return; // Exit the function after calling handleNullVendor
            
        // }

        // Check if username is provided or not
        // if (!body.user_name) {
        //     return res.status(400).json({ msg: "All fields are required8" });
        // }

        // Iterate over vendors to create bookings and add username to booking collections provided by the user
        for (const photographer of photographers) {
            const bookingData = {
                username: body.user_name,
                name: photographer.photographerName,
                description: photographer.photographerDiscription,
                price: photographer.photographerPrice,
                image: photographer.photographerImage,
                // Other fields if any
            };

            // Insert booking data into bookings table
            await Booking.create(bookingData);
        }

        // return res.status(201).json({ msg: "Success" });

    } catch (error) {
        console.error(error); // Log the error for debugging
        // return res.status(400).json({ msg: "Failure" }); // Return failure response
    }
}



async function handleNullPhotographer(photographerName, res, username) {
    try {
        // Check if the vendor has already been created
        if (!photographerCreated) {
            // Call the function to create a new vendor in the database
            await handleCreateNewphotographer({
                body: {
                    photographer_Name: photographerName,
                    photographer_Image: "image", // Provide appropriate values if available
                    photographer_Discription: "msdpvm", // Provide appropriate values if available
                    photographer_Price: "70000000"// Provide appropriate values if available
                }
            }, res);
            // Set flag to true indicating vendor has been created
            photographerCreated = true;
        }

        // After creating the vendor, proceed with creating the booking
        await handleCreateNewBookingForPhotographer2({
            body: {
                user_name: username // Provide appropriate value if required
            },
            params: {
                photographerName : photographerName
            }
        }, res);

    } catch (error) {
        console.error(error);
    }
}


module.exports = { handleNullVendor,
                handleNullPhotographer} ;