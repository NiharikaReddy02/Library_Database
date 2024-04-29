

const { db } = require("../config/index");

exports.getAllBooks = (req, res) => {
  db.query("SELECT * FROM books", (err, books) => {
    if (err) throw err;
    res.render("books", { view: "index", books: books });
  });
};

exports.getAddBookForm = (req, res) => {

  db.query("SELECT category_name from category", (err, categories) => {
    const category_name = categories.map(category => category.category_name);
    res.render("books",{view: "add" , categories:category_name});
  });
// res.render("books", { view: "add" });
};

exports.addBook = (req, res) => {
  const { book_id, category_name, title, publication_date, copies_owned, author } = req.body;
  const newBook = { book_id, category_name, title, publication_date, copies_owned, author};
  db.query("INSERT INTO books SET ?", newBook, (err, result) => {
    if (err) throw err;
    res.redirect("/books");
  });
};

exports.getEditBookForm = (req, res) => {
  const book_id = req.params.book_id;
  db.query("SELECT * FROM books WHERE book_id = ?", book_id, (err, result) => {
    if (err) throw err;
    db.query("SELECT category_name from category", (err, categories) => {
      const category_name = categories.map(category => category.category_name);
      res.render("books",{view: "edit" , categories:category_name, book:result[0]});
    });
    // res.render("books", { view: "edit", book: result[0] });
  });
};

exports.editBook = (req, res) => {
  const book_id = req.params.book_id; 
  const {category_name, title, publication_date, copies_owned, author} = req.body;
  
  db.query(
    "UPDATE books SET book_id = ?, category_name = ?, title = ?, publication_date = ?, copies_owned = ?, author = ? WHERE book_id = ?",
    
    [book_id, category_name, title, publication_date, copies_owned, author, book_id],
    (err, result) => {
      if (err) throw err;
      res.redirect("/books");
    }
  );
};

exports.deleteBook = (req, res) => {
  const book_id = req.params.book_id;
  db.query("DELETE FROM books WHERE book_id = ?", book_id, (err, result) => {
    if (err) throw err;
    res.redirect("/books");
  });
};



