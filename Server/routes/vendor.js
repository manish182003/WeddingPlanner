 const express = require("express");


//Extracting all functions from controllers/vendor
const { handleGetAllVendor,
        handleGetVendorById,
        handleUpdateVendorById,
        handleDeleteVendorById,
        handleCreateNewVendor,
 
 } = require("../controllers/vendor");

const router = express.Router();


//If "/" gets a post req then post and if get req then get

router.route("/").get(handleGetAllVendor).post(handleCreateNewVendor);


//For by id, update, delete
router
    .route("/:id")
    .get(handleGetVendorById)
    .patch(handleUpdateVendorById)
    .delete(handleDeleteVendorById);


module.exports = router;     
