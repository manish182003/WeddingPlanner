const express = require("express");


//Extracting all functions from controllers/vendor
const { handleGetAllphotographer,
        handleGetphotographerById,
        handleUpdatephotographerById,
        handleDeletephotographerById,
        handleCreateNewphotographer,
 
 } = require("../controllers/photographer");

const router = express.Router();


//If "/" gets a post req then post and if get req then get
router.route("/").get(handleGetAllphotographer).post(handleCreateNewphotographer);


//For by id, update, delete
router
    .route("/:id")
    .get(handleGetphotographerById)
    .patch(handleUpdatephotographerById)
    .delete(handleDeletephotographerById);


module.exports = router;     
