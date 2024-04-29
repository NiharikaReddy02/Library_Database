USE Library_Management;

INSERT INTO Students (student_id, first_name, last_name, email_address)
VALUES
('S001', 'John', 'Doe', 'john.doe@example.com'),
('S002', 'Jane', 'Smith', 'jane.smith@example.com'),
('S003', 'Alice', 'Johnson', 'alice.johnson@example.com'),
('S004', 'Bob', 'Williams', 'bob.williams@example.com'),
('S005', 'Mary', 'Brown', 'mary.brown@example.com'),
('S006', 'David', 'Davis', 'david.davis@example.com'),
('S007', 'Sarah', 'Miller', 'sarah.miller@example.com'),
('S008', 'James', 'Wilson', 'james.wilson@example.com'),
('S009', 'Patricia', 'Moore', 'patricia.moore@example.com'),
('S010', 'Michael', 'Taylor', 'michael.taylor@example.com');

INSERT INTO Category (category_id, category_name)
VALUES
('C001', 'Novel'),
('C002', 'History'),
('C003', 'Social'),
('C004', 'Political'),
('C005', 'Story Book'),
('C006', 'Documentary'),
('C007', 'Physics'),
('C008', 'Chemistry'),
('C009', 'Mathematics'),
('C010', 'Business'),
('C011', 'Sports'),
('C012', 'Biology');

INSERT INTO Reservation_status (res_status_id, status_value)
VALUES
('RS001', 'Active'),
('RS002', 'Completed'),
('RS003', 'Cancelled'),
('RS004', 'Pending'),
('RS005', 'Overdue'),
('RS006', 'Processed'),
('RS007', 'Collected'),
('RS008', 'Failed'),
('RS009', 'Expired'),
('RS010', 'Confirmed');

INSERT INTO Books (book_id, title, publication_date, copies_owned, author, category_name)
VALUES
('B011', 'Adventures of the Mind', '2020-01-15', 4, 'Laura Hastings', 'Novel'),
('B012', 'The Last Emperor', '1995-07-23', 3, 'Stephen R. Donaldson', 'History'),
('B013', 'Social Structures', '2010-04-10', 5, 'Michael Stott', 'Social'),
('B014', 'Governing Dynamics', '2001-11-15', 2, 'Isaac Peterson', 'Political'),
('B015', 'Moonlit Tales', '1998-05-21', 7, 'Nora Roberts', 'Story Book'),
('B016', 'Earth Documented', '2003-09-12', 6, 'David Attenborough', 'Documentary'),
('B017', 'Quantum World', '2021-02-18', 4, 'Sean Carroll', 'Physics'),
('B018', 'The Bonding Electron', '1999-08-07', 3, 'Linus Pauling', 'Chemistry'),
('B019', 'Calculus Simplified', '2000-12-13', 2, 'Arthur Mattuck', 'Mathematics'),
('B020', 'Modern Economies', '2005-06-19', 5, 'Paul Krugman', 'Business'),
('B021', 'Olympic Legends', '2022-03-11', 7, 'Richard Thompson', 'Sports'),
('B022', 'Understanding Cells', '2007-04-25', 3, 'Bruce Alberts', 'Biology'),
('B023', 'Novel Ideas', '2019-10-30', 5, 'Clara Sunwoo', 'Novel'),
('B024', 'Historical Battles', '2004-03-22', 4, 'John Keegan', 'History'),
('B025', 'Social Change', '2016-08-15', 6, 'Malcolm Gladwell', 'Social'),
('B026', 'Political Theories', '2012-05-20', 7, 'Noam Chomsky', 'Political'),
('B027', 'Fairy Night', '2013-12-14', 8, 'Eliza Bennett', 'Story Book'),
('B028', 'Wildlife Chronicles', '2008-09-09', 5, 'Steve Winter', 'Documentary'),
('B029', 'Relativity for Beginners', '2017-07-18', 4, 'Albert Einstein', 'Physics'),
('B030', 'Organic Chemistry', '2021-01-25', 6, 'Peter Atkins', 'Chemistry'),
('B031', 'Math in Nature', '2023-02-05', 7, 'Ian Stewart', 'Mathematics'),
('B032', 'Corporate Strategy', '2022-11-19', 3, 'Michael Porter', 'Business'),
('B033', 'Sports Medicine', '2018-04-03', 4, 'Gideon Ariel', 'Sports'),
('B034', 'Marine Biology', '2019-05-16', 5, 'Rachel Carson', 'Biology'),
('B035', 'Space and Beyond', '2002-08-20', 2, 'Carl Sagan', 'Novel'),
('B036', 'Ancient Civilizations', '2015-09-11', 6, 'Jared Diamond', 'History'),
('B037', 'Community Voices', '2020-12-30', 7, 'Charles Taylor', 'Social'),
('B038', 'The Leader\'s Edge', '2013-03-27', 5, 'Simon Sinek', 'Political'),
('B039', 'Whispering Winds', '2014-07-14', 4, 'Amanda Hocking', 'Story Book'),
('B040', 'Planet Earth', '2009-06-25', 3, 'James Lovelock', 'Documentary');


INSERT INTO Borrows (borrow_id, borrow_date, returned_date, student_id, book_id)
VALUES
('BR011', '2023-04-01', '2023-04-15', 'S001', 'B011'),
('BR012', '2023-04-02', '2023-04-16', 'S002', 'B022'),
('BR013', '2023-04-03', '2023-04-17', 'S003', 'B040'),
('BR014', '2023-04-04', '2023-04-18', 'S004', 'B024'),
('BR015', '2023-04-05', '2023-04-19', 'S005', 'B012'),
('BR016', '2023-04-06', '2023-04-20', 'S006', 'B016'),
('BR017', '2023-04-07', '2023-04-21', 'S007', 'B027'),
('BR018', '2023-04-08', '2023-04-22', 'S008', 'B038'),
('BR019', '2023-04-09', '2023-04-23', 'S009', 'B029'),
('BR020', '2023-04-10', '2023-04-24', 'S010', 'B030');

-- INSERT INTO Borrows (borrow_id, borrow_date, returned_date, student_id, book_id)
-- VALUES
-- ('BR011', '2023-04-01', '2023-04-15', 'S001', 1), -- On time
-- ('BR012', '2023-04-02', '2023-04-17', 'S002', 2), -- Late
-- ('BR013', '2023-04-03', '2023-04-17', 'S003', 3), -- Late
-- ('BR014', '2023-04-04', '2023-04-18', 'S004', 4), -- Late
-- ('BR015', '2023-04-05', '2023-04-19', 'S005', 5), -- Late
-- ('BR016', '2023-04-06', '2023-04-20', 'S006', 6), -- Late
-- ('BR017', '2023-04-07', '2023-04-21', 'S007', 7), -- Late
-- ('BR018', '2023-04-08', '2023-04-22', 'S008', 8), -- Late
-- ('BR019', '2023-04-09', '2023-04-23', 'S009', 9), -- Late
-- ('BR020', '2023-04-10', '2023-04-24', 'S010', 10); -- Late


INSERT INTO Reserves (reserve_id, reserve_date, student_id, status_id, book_id)
VALUES
('RV001', '2023-04-01', 'S001', 'RS001', 'B011'),
('RV002', '2023-04-02', 'S002', 'RS002', 'B013'),
('RV003', '2023-04-03', 'S003', 'RS003', 'B015'),
('RV004', '2023-04-04', 'S004', 'RS004', 'B016'),
('RV005', '2023-04-05', 'S005', 'RS005', 'B017'),
('RV006', '2023-04-06', 'S006', 'RS006', 'B012'),
('RV007', '2023-04-07', 'S007', 'RS007', 'B026'),
('RV008', '2023-04-08', 'S008', 'RS008', 'B018'),
('RV009', '2023-04-09', 'S009', 'RS009', 'B040'),
('RV010', '2023-04-10', 'S010', 'RS010', 'B031');

-- INSERT INTO Fines (fine_id, fine_date, fine_amount, student_id, borrow_id)
-- VALUES
-- ('FN001', '2023-04-16', 15, 'S001', 'BR001'),
-- ('FN002', '2023-04-17', 10, 'S002', 'BR002'),
-- ('FN003', '2023-04-18', 20, 'S003', 'BR003'),
-- ('FN004', '2023-04-19', 25, 'S004', 'BR004'),
-- ('FN005', '2023-04-20', 30, 'S005', 'BR005'),
-- ('FN006', '2023-04-21', 5, 'S006', 'BR006'),
-- ('FN007', '2023-04-22', 45, 'S007', 'BR007'),
-- ('FN008', '2023-04-23', 50, 'S008', 'BR008'),
-- ('FN009', '2023-04-24', 35, 'S009', 'BR009'),
-- ('FN010', '2023-04-25', 40, 'S010', 'BR010');

INSERT INTO Fines (fine_id, fine_date, fine_amount, student_id, borrow_id)
VALUES
('FN011', '2023-04-18', 10, 'S002', 'BR012'),  -- 2 days late
('FN012', '2023-04-18', 10, 'S003', 'BR013'),  -- 2 days late
('FN013', '2023-04-19', 15, 'S004', 'BR014'),  -- 3 days late
('FN014', '2023-04-20', 20, 'S005', 'BR015'),  -- 4 days late
('FN015', '2023-04-21', 25, 'S006', 'BR016'),  -- 5 days late
('FN016', '2023-04-22', 30, 'S007', 'BR017'),  -- 6 days late
('FN017', '2023-04-23', 35, 'S008', 'BR018'),  -- 7 days late
('FN018', '2023-04-24', 40, 'S009', 'BR019'),  -- 8 days late
('FN019', '2023-04-25', 45, 'S010', 'BR020');  -- 9 days late


INSERT INTO Pays (payment_id, payment_date, amount, student_id, fine_id)
VALUES
('PY001', '2023-04-16', 15, 'S001', 'FN011'),
('PY002', '2023-04-17', 10, 'S002', 'FN012'),
('PY003', '2023-04-18', 20, 'S003', 'FN013'),
('PY004', '2023-04-19', 25, 'S004', 'FN014'),
('PY005', '2023-04-20', 30, 'S005', 'FN015'),
('PY006', '2023-04-21', 5, 'S006', 'FN016'),
('PY007', '2023-04-22', 45, 'S007', 'FN017'),
('PY008', '2023-04-23', 50, 'S008', 'FN018'),
('PY009', '2023-04-24', 35, 'S009', 'FN019');
