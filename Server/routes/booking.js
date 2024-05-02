const express = require("express");

const { handleGetAllBooking,
        handleGetBookingByUsername,
        handleUpdateBookingByUsername,
        handleDeleteBookingByUsername,
        handleCreateNewBookingForPhotographer,
        handleCreateNewBookingForVendor,
        // handleCreateNewBookingForVenue,
     } = require("../controllers/booking");


const router = express.Router();

//route to get all bookings (for Admin use only)
router.route("/").get(handleGetAllBooking)


// routes for post method of all services (photographer, venue, vendor) to create them on the basis of their respective names
router.route("/photographer/:photographerName").post(handleCreateNewBookingForPhotographer);
// router.route("/venue/:id").post(handleCreateNewBookingForVenue);
router.route("/vendor/").post(handleCreateNewBookingForVendor);


// route to get booking by username as username is a unique attribute also same for delete and patch
router
    .route("/username/:username")
    .get(handleGetBookingByUsername)
    .patch(handleUpdateBookingByUsername)


//here the id should be booking id
router.route("/username&id/:username/:id").delete(handleDeleteBookingByUsername)

module.exports = router;
