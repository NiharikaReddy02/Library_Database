const express = require("express");
const router = express.Router();
const borrowsController = require("../controllers/borrowsController");

// Routes
router.get("/", borrowsController.getAllBorrows);
router.get("/add", borrowsController.getAddBorrowsForm);
router.post("/add", borrowsController.addBorrows);
router.get("/edit/:borrow_id", borrowsController.getEditBorrowsForm);
router.post("/edit/:borrow_id", borrowsController.editBorrows);
router.get("/delete/:borrow_id", borrowsController.deleteBorrows);

module.exports = router;
