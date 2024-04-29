var mysql = require("mysql");

var db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "0000",
  database: "library_management",
});

db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL: " + err.stack);
    return;
  }
  console.log("Connected to MySQL as id " + db.threadId);

  // Function to create tables if it doesn't exist
  createStudentsTable();
  createCategoryTable();
  createBorrowsTable();
  createFinesTable();
  createPaysTable();
  createReservationsTable();
  createReservation_statusTable();
  createBooksTable()
});

// Function to create 'students' table if it doesn't exist
function createStudentsTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS students (
      STUDENT_id INT AUTO_INCREMENT PRIMARY KEY,
      first_name VARCHAR(255) NOT NULL,
      last_name VARCHAR(255) NOT NULL,
      email_address VARCHAR(255) NOT NULL,
      student_id INT NOT NULL
    )
  `;
  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating students table: " + err.stack);
      return;
    }
    console.log("Students table created successfully");
  });
}



function createCategoryTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS category (
      category_id INT NOT NULL,
      category_name VARCHAR(225) NOT NULL,
      PRIMARY KEY (category_name)
    )
  `;

  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating category table: " + err.stack);
      return;
    }
    console.log("Category table created successfully");
  });
}



function createBooksTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS books (
        book_id INT AUTO_INCREMENT PRIMARY KEY,
        category_name VARCHAR(255) ,
        title VARCHAR(255) NOT NULL,
        publication_date VARCHAR(225) NOT NULL,
        copies_owned INT NOT NULL,
        author VARCHAR(255) NOT NULL,
        FOREIGN KEY (category_name) REFERENCES Category(category_name)
    )
  `;

  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating students table: " + err.stack);
      return;
    }
    console.log("Books table created successfully");
  });
}

function createReservation_statusTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS reservation_status (
        res_status_id INT AUTO_INCREMENT PRIMARY KEY,
        status_value VARCHAR(20) NOT NULL,
        PRIMARY KEY (res_status_id)
    )
  `;

  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating students table: " + err.stack);
      return;
    }
    console.log("Reservation status table created successfully");
  });
}

function createBorrowsTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS borrows (
        borrow_id INT AUTO_INCREMENT PRIMARY KEY,
        borrow_date VARCHAR(225) NOT NULL,
        returned_date VARCHAR(225) NOT NULL DEFAULT '1947-01-01',
        student_id INT,  -- Change data type to INT to match primary key in students table
        book_id INT,     -- Change data type to INT to match primary key in books table
        PRIMARY KEY (borrow_id),
        FOREIGN KEY (student_id) REFERENCES students(id),
        FOREIGN KEY (book_id) REFERENCES books(book_id)
    )
  `;

  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating students table: " + err.stack);
      return;
    }
    console.log("Borrows table created successfully");
  });
}

function createReservationsTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS reserves (
        reserve_id INT NOT NULL,  -- Change to reserve_id to avoid conflicts with borrow_id
        reserve_date DATE NOT NULL,
        period VARCHAR(20) NOT NULL DEFAULT '7 days',
        student_id INT,  -- Change data type to INT to match primary key in students table
        book_id INT,     -- Change data type to INT to match primary key in books table
        PRIMARY KEY (reserve_id),
        FOREIGN KEY (student_id) REFERENCES students(id),
        FOREIGN KEY (book_id) REFERENCES books(book_id)
    )
  `;

  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating students table: " + err.stack);
      return;
    }
    console.log("Reserves table created successfully");
  });
}

function createFinesTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS fines (
        fine_id INT AUTO_INCREMENT PRIMARY KEY,
        fine_date DATE NOT NULL,
        fine_amount INT NOT NULL,
        student_id INT NOT NULL,    -- Change data type to INT to match primary key in students table
        borrow_id INT NOT NULL,  -- Borrow ID may be a VARCHAR, assuming it's the same as borrows table
        PRIMARY KEY (fine_id),
        FOREIGN KEY (student_id) REFERENCES students(id),
        FOREIGN KEY (borrow_id) REFERENCES borrows(borrow_id)  -- Reference the correct column
    )
  `;

  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating students table: " + err.stack);
      return;
    }
    console.log("Fines table created successfully");
  });
}

function createPaysTable() {
  const createTableQuery = `
    CREATE TABLE IF NOT EXISTS pays (
        payment_id VARCHAR(20) NOT NULL,
        payment_date DATE NOT NULL,
        amount INT NOT NULL,
        student_id INT NOT NULL,   -- Change data type to INT to match primary key in students table
        fine_id VARCHAR(20),   -- Fine ID may be a VARCHAR, assuming it's the same as fines table
        PRIMARY KEY (payment_id),
        FOREIGN KEY (student_id) REFERENCES students(id),
        FOREIGN KEY (fine_id) REFERENCES fines(fine_id)  -- Reference the correct column
    )
  `;

  db.query(createTableQuery, (err, results, fields) => {
    if (err) {
      console.error("Error creating students table: " + err.stack);
      return;
    }
    console.log("Pays table created successfully");
  });
}

module.exports = {
  createStudentsTable,
  createBooksTable,
  createReservationsTable,
  createFinesTable,
  createBorrowsTable,
  db,
};
