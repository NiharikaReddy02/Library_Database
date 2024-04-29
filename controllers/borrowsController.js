const {db} = require("../config/index")

// Function to get all students
exports.getAllBorrows = (req, res) => {
  db.query("SELECT * FROM borrows", (err, borrows) => {
    if (err) throw err;
    res.render("borrows", { view: "index", borrows: borrows });
  });
};

// Function to render add student form
exports.getAddBorrowsForm = (req, res) => {

  db.query("SELECT student_id from students ", (err, students) => {
    if (err) throw err;
     const student_id = students.map(student => student.student_id);
     db.query("SELECT book_id from books order by book_id", (err, books) => {
      const book_id = books.map(book => book.book_id);
      res.render("borrows",{view: "add" , students:student_id, books:book_id});
   });
  });
  
  // res.render("borrows", { view: "add" });
};

// Function to add a new student
exports.addBorrows = (req, res) => {
  const { borrow_id, borrow_date, returned_date, student_id, book_id } = req.body;
  const newBorrow = { borrow_id, borrow_date, returned_date, student_id, book_id };
  db.query("INSERT INTO borrows SET ?", newBorrow, (err, result) => {
    if (err) throw err;
    res.redirect("/borrows");
  });
};

// Function to render edit student form
exports.getEditBorrowsForm = (req, res) => {
  const borrow_id = req.params.borrow_id;

  db.query(
    "SELECT * FROM borrows WHERE borrow_id = ?",
    borrow_id,
    (err, result) => {
      if (err) throw err;
      db.query("SELECT student_id from students ", (err, students) => {
        if (err) throw err;
         const student_id = students.map(student => student.student_id);
         db.query("SELECT book_id from books order by book_id", (err, books) => {
          const book_id = books.map(book => book.book_id);
           res.render("borrows",{view: "edit" , students:student_id, books:book_id, borrows: result[0]});
       });
      });

      //res.render("borrows", { view: "edit", borrows: result[0], students:student_id, books:book_id });
    }
  );
};

// Function to edit a student
exports.editBorrows = (req, res) => {
  const borrow_id = req.params.borrow_id;
  const { borrow_date, returned_date, student_id, book_id} = req.body;
  db.query(
    "UPDATE borrows SET borrow_date = ?, returned_date = ?, student_id = ?, book_id = ? WHERE borrow_id = ?",
    [borrow_date, returned_date, student_id, book_id,borrow_id],
    (err, result) => {
      if (err) throw err;
      res.redirect("/borrows");
    }
  );
};

// Function to delete a student
exports.deleteBorrows = (req, res) => {
  const borrow_id = req.params.borrow_id;
  db.query(
    "DELETE FROM borrows WHERE borrow_id = ?",
    borrow_id,
    (err, result) => {
      if (err) throw err;
      res.redirect("/borrows");
    }
  );
};
