const Joi = require("joi");

class BookModel {
    constructor(book) {
        this.bookId = book.bookId;
        this.bookName = book.bookName;
        this.uuid = book.uuid;
        this.description = book.description;
        this.genreId = book.genreId;
        this.genreName = book.genreName;
    }

    static #postValidationSchema = Joi.object({
        bookId: Joi.forbidden(),
        bookName: Joi.string().required().min(2).max(50),
        uuid: Joi.forbidden(),
        description: Joi.string().required().min(5).max(500),
        genreId: Joi.number().required(),
        genreName: Joi.string()
    });
    static #patchValidationSchema = Joi.object({
        bookId: Joi.number().required(),
        bookName: Joi.string().min(2).max(50),
        uuid: Joi.string().required(),
        description: Joi.string().min(5).max(500),
        genreId: Joi.number().required(),
        genreName: Joi.string()
    });

    ValidatePost() {
        const result = BookModel.#postValidationSchema.validate(this, {abortEarly: false});
        return result.error ? result.error.message : null;
    }
    ValidatePatch() {
        const result = BookModel.#patchValidationSchema.validate(this, {abortEarly: false});
        return result.error ? result.error.message : null;
    }
}

module.exports = BookModel;