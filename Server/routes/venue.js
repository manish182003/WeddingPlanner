const express = require("express");


//Extracting all functions from controllers/vendor
const { handleGetAllVenue,
        handleGetVenueById,
        handleUpdateVenueById,
        handleDeleteVenueById,
        handleCreateNewVenue,
 
 } = require("../controllers/venue");

const router = express.Router();


//If "/" gets a post req then post and if get req then get

router.route("/").get(handleGetAllVenue).post(handleCreateNewVenue);


//For by id, update, delete
router
    .route("/:id")
    .get(handleGetVenueById)
    .patch(handleUpdateVenueById)
    .delete(handleDeleteVenueById);


module.exports = router;     
