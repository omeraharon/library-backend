const express = require("express");
const libraryLogic = require("../business-logic-layer/library-logic");
const errorsHelper = require("../helpers/errors-helper");
const BookModel = require("../models/book-model");
const router = express.Router();

router.get("/", async (req, res) => { 
    try {
        const books = await libraryLogic.getAllBooksAsync();
        res.status(201).json(books);
    }
    catch (err) {
        res.status(500).send(errorsHelper.getError(err));
    }
});

router.get("/genres", async (req, res) => { 
    try {
        const genres = await libraryLogic.getAllGenresAsync();
        res.status(201).json(genres);
    }
    catch (err) {
        res.status(500).send(errorsHelper.getError(err));
    }
});

router.patch("/:uuid", async (req, res) => {
    try {
        const uuid = req.params.uuid;
        const bookToUpdate = new BookModel(req.body);
        
        const errors = bookToUpdate.ValidatePatch();
        if(errors) return res.status(400).send(errors);
        
        bookToUpdate.uuid = uuid;
        const updateBook = await libraryLogic.updateBookAsync(bookToUpdate);

        res.status(201).json(updateBook);
    }
    catch(err) {
        res.status(500).send(errorsHelper.getError(err));
    }
});

router.delete("/:uuid", async (req, res) => {
    try {
        const uuid = req.params.uuid;
        await libraryLogic.deleteBookAsync(uuid);
        res.sendStatus(204);
    }
    catch(err) {
        res.status(500).send(errorsHelper.getError(err));
    }
});

router.post("/", async (req, res) => {
    try {
        const bookToAdd = new BookModel(req.body);

        const errors = bookToAdd.ValidatePost();
        if(errors) return res.status(400).send(errors);

        const addedBook = await libraryLogic.addBookAsync(bookToAdd);
        res.status(201).json(addedBook);
    }
    catch(err) {
        res.status(500).send(errorsHelper.getError(err));
    }
});

module.exports = router;