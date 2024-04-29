
CREATE DATABASE Library_management;

USE Library_management;

CREATE TABLE Students
(
  #id INT AUTO_INCREMENT,
  student_id VARCHAR(225) NOT NULL,
  first_name VARCHAR(225) NOT NULL,
  last_name VARCHAR(225) NOT NULL,
  email_address VARCHAR(225) NOT NULL,
  PRIMARY KEY (student_id)
);

CREATE TABLE Category
(
  category_id VARCHAR(225) NOT NULL,
  category_name VARCHAR(225) NOT NULL,
  PRIMARY KEY (category_name)
);

CREATE TABLE Reservation_status
(
  res_status_id VARCHAR(225) NOT NULL,
  status_value VARCHAR(225) NOT NULL,
  PRIMARY KEY (res_status_id)
);

CREATE TABLE Books
(
  book_id VARCHAR(225) NOT NULL,
  title VARCHAR(225) NOT NULL,
  publication_date VARCHAR(225) NOT NULL,
  copies_owned INT NOT NULL,
  author VARCHAR(225) NOT NULL,
  category_name VARCHAR(225) NOT NULL,
  PRIMARY KEY (book_id),
  FOREIGN KEY (category_name) REFERENCES Category(category_name)
);

CREATE TABLE Borrows
(
  borrow_id VARCHAR(225) NOT NULL,
  borrow_date VARCHAR(225) NOT NULL,
  returned_date VARCHAR(225),
  student_id VARCHAR(225) NOT NULL,
  book_id VARCHAR(225) NOT NULL,
  PRIMARY KEY (borrow_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Reserves
(
  reserve_id VARCHAR(225) NOT NULL,
  reserve_date DATE NOT NULL,
  period VARCHAR(225) NOT NULL DEFAULT '7 days',
  student_id VARCHAR(225) NOT NULL,
  status_id VARCHAR(225) NOT NULL,
  book_id VARCHAR(225) NOT NULL,
  PRIMARY KEY (reserve_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (status_id) REFERENCES Reservation_status(res_status_id),
  FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

CREATE TABLE Fines
(
  fine_id VARCHAR(225) NOT NULL,
  fine_date DATE NOT NULL,
  fine_amount INT NOT NULL,
  student_id VARCHAR(225) NOT NULL,
  borrow_id VARCHAR(225) NOT NULL,
  PRIMARY KEY (fine_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (borrow_id) REFERENCES Borrows(borrow_id)
);

CREATE TABLE Pays
(
  payment_id VARCHAR(225) NOT NULL,
  payment_date DATE NOT NULL,
  amount INT NOT NULL,
  student_id VARCHAR(225) NOT NULL,
  fine_id VARCHAR(225) NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (fine_id) REFERENCES Fines(fine_id)
);
CREATE TABLE Address (
  student_id VARCHAR(225) NOT NULL,
  address_id INT NOT NULL,
  street VARCHAR(225),
  city VARCHAR(225),
  PRIMARY KEY (student_id, address_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
