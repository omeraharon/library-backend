const dal = require("../data-access-layer/dal");
const uuid = require("uuid");

async function getAllBooksAsync() {
    const sql = `SELECT * FROM Books INNER JOIN Genre on Genre.genreId = Books.genreId`;
    
    return await dal.executeAsync(sql);
}

async function getAllGenresAsync() {
    const sql = `SELECT * FROM Genre`;
    
    return await dal.executeAsync(sql);
}

async function updateBookAsync(book) {
    const sql = `UPDATE Books SET bookName = ?, description = ? WHERE uuid = ?`;
    const info = await dal.executeAsync(sql, [book.bookName, book.description, book.uuid]);

    return info.affectedRows === 0 ? null : book;
}

async function deleteBookAsync(uuid) {
    const sql = `DELETE FROM Books WHERE uuid = ?`; 
    await dal.executeAsync(sql, [uuid]);
}

async function addBookAsync(book) {
    book.uuid = uuid.v4();

    const sql = `INSERT INTO Books VALUES(DEFAULT, ?, ?, ?, ?)`;

    const info = await dal.executeAsync(sql, [book.bookName, book.uuid, book.description, book.genreId]);
    book.bookId = info.insertId;

    return book;
}

module.exports = {
    getAllBooksAsync,
    getAllGenresAsync,
    updateBookAsync,
    deleteBookAsync,
    addBookAsync
}