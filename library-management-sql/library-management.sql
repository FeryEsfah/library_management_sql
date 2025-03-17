
-- Table: tbl_publisher
CREATE TABLE tbl_publisher (
    publisher_PublisherName VARCHAR(255) PRIMARY KEY ,
    publisher_PublisherAddress VARCHAR(255),
    publisher_PublisherPhone VARCHAR(20)
);

INSERT INTO tbl_publisher
    (publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
    VALUES
    ('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
    ('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
    ('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
    ('Chilton Books','Not Available','Not Available'),
    ('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
    ('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),    
    ('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
    ('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
    ('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
    ('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
    ('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
    ('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
    ('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
    ('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
    ('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
    ('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')    
  ;

  SELECT * FROM tbl_publisher


--*****************************************************

-- Table: tbl_book
CREATE TABLE tbl_book (
    book_BookID INT PRIMARY KEY,
    book_Title VARCHAR(255),
    book_PublisherName VARCHAR(255),
    FOREIGN KEY (book_PublisherName) REFERENCES tbl_publisher(publisher_PublisherName)
);

INSERT INTO tbl_book
    (book_BookID,book_Title, book_PublisherName)
    VALUES 
    (1,'The Name of the Wind', 'DAW Books'),
    (2,'It', 'Viking'),
    (3,'The Green Mile', 'Signet Books'),
    (4,'Dune', 'Chilton Books'),
    (5,'The Hobbit', 'George Allen & Unwin'),
    (6,'Eragon', 'Alfred A. Knopf'),
    (7,'A Wise Mans Fear', 'DAW Books'),
    (8,'Harry Potter and the Philosophers Stone', 'Bloomsbury'),
    (9,'Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
    (10,'The Giving Tree', 'Harper and Row'),
    (11,'The Hitchhikers Guide to the Galaxy', 'Pan Books'),
    (12,'Brave New World', 'Chalto & Windus'),
    (13,'The Princess Bride', 'Harcourt Brace Jovanovich'),
    (14,'Fight Club', 'W.W. Norton'),
    (15,'Holes', 'Scholastic'),
    (16,'Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
    (17,'Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
    (18,'The Fellowship of the Ring', 'George Allen & Unwin'),
    (19,'A Game of Thrones', 'Bantam'),
    (20,'The Lost Tribe', 'Picador USA');

    SELECT * FROM tbl_book
  SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin'

  -- *************************************************************************

  -- Table: tbl_library_branch
CREATE TABLE tbl_library_branch (
    library_branch_BranchID INT PRIMARY KEY,
    library_branch_BranchName VARCHAR(255),
    library_branch_BranchAddress VARCHAR(255) 
);

INSERT INTO tbl_library_branch
    (library_branch_BranchID, library_branch_BranchName, library_branch_BranchAddress)
    VALUES
    (1,'Sharpstown','32 Corner Road, New York, NY 10012'),
    (2,'Central','491 3rd Street, New York, NY 10014'),
    (3,'Saline','40 State Street, Saline, MI 48176'),
    (4,'Ann Arbor','101 South University, Ann Arbor, MI 48104');

SELECT * FROM tbl_library_branch

-- *****************************************************


-- Table: tbl_borrower
CREATE TABLE tbl_borrower (
    borrower_CardNo INT PRIMARY KEY,
    borrower_BorrowerName VARCHAR(255),
    borrower_BorrowerAddress VARCHAR(255),
    borrower_BorrowerPhone VARCHAR(20)
);

INSERT INTO tbl_borrower
    (borrower_CardNo,borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)
    VALUES
    (100,'Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
    (101,'Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
    (102,'Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
    (103,'Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
    (104,'Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
    (105,'Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
    (106,'Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
    (107,'Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
  
SELECT * FROM tbl_borrower

-- ********************************************************************

-- Table: tbl_book_loans
CREATE TABLE tbl_book_loans (
    book_loan_LoanID INT PRIMARY KEY,
    book_loans_BookID INT,
    book_loans_BranchID INT,
    book_loans_CardNo INT,
    book_loans_DateOut DATE,
    book_loans_DueDate DATE,
    FOREIGN KEY (book_loans_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_loans_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID),
    FOREIGN KEY (book_loans_CardNo) REFERENCES tbl_borrower(borrower_CardNo)
);

INSERT INTO tbl_book_loans
    (book_loan_LoanID, book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
    VALUES
    (1,'1','1','100','1/1/18','2/2/18'),
    (2,'2','1','100','1/1/18','2/2/18'),
    (3,'3','1','100','1/1/18','2/2/18'),
    (4,'4','1','100','1/1/18','2/2/18'),
    (5,'5','1','102','1/3/18','2/3/18'),
    (6,'6','1','102','1/3/18','2/3/18'),
    (7,'7','1','102','1/3/18','2/3/18'),
    (8,'8','1','102','1/3/18','2/3/18'),
    (9,'9','1','102','1/3/18','2/3/18'),
    (10,'11','1','102','1/3/18','2/3/18'),
    (11,'12','2','105','12/12/17','1/12/18'),
    (12,'10','2','105','12/12/17','1/12/17'),
    (13,'20','2','105','2/3/18','3/3/18'),
    (14,'18','2','105','1/5/18','2/5/18'),
    (15,'19','2','105','1/5/18','2/5/18'),
    (16,'19','2','100','1/3/18','2/3/18'),
    (17,'11','2','106','1/7/18','2/7/18'),
    (18,'1','2','106','1/7/18','2/7/18'),
    (19,'2','2','100','1/7/18','2/7/18'),
    (20,'3','2','100','1/7/18','2/7/18'),
    (21,'5','2','105','12/12/17','1/12/18'),
    (22,'4','3','103','1/9/18','2/9/18'),
    (23,'7','3','102','1/3/18','2/3/18'),
    (24,'17','3','102','1/3/18','2/3/18'),
    (25,'16','3','104','1/3/18','2/3/18'),
    (26,'15','3','104','1/3/18','2/3/18'),
    (27,'15','3','107','1/3/18','2/3/18'),
    (28,'14','3','104','1/3/18','2/3/18'),
    (29,'13','3','107','1/3/18','2/3/18'),
    (30,'13','3','102','1/3/18','2/3/18'),
    (31,'19','3','102','12/12/17','1/12/18'),
    (32,'20','4','103','1/3/18','2/3/18'),
    (33,'1','4','102','1/12/18','2/12/18'),
    (34,'3','4','107','1/3/18','2/3/18'),
    (35,'18','4','107','1/3/18','2/3/18'),
    (36,'12','4','102','1/4/18','2/4/18'),
    (37,'11','4','103','1/15/18','2/15/18'),
    (38,'9','4','103','1/15/18','2/15/18'),
    (39,'7','4','107','1/1/18','2/2/18'),
    (40,'4','4','103','1/1/18','2/2/18'),
    (41,'1','4','103','2/2/17','3/2/18'),
    (42,'20','4','103','1/3/18','2/3/18'),
    (43,'1','4','102','1/12/18','2/12/18'),
    (44,'3','4','107','1/13/18','2/13/18'),
    (45,'18','4','107','1/13/18','2/13/18'),
    (46,'12','4','102','1/14/18','2/14/18'),
    (47,'11','4','103','1/15/18','2/15/18'),
    (48,'9','4','103','1/15/18','2/15/18'),
    (49,'7','4','107','1/19/18','2/19/18'),
    (50,'4','4','103','1/19/18','2/19/18'),
    (51,'1','4','103','1/22/18','2/22/18');
    
  SELECT * FROM tbl_book_loans

  --****************************************************************

  -- Table: tbl_book_copies
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT PRIMARY KEY,
  book_copies_BookID INT,
    book_copies_BranchID INT,
    book_copies_No_Of_Copies INT,
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID)
);


-- Table: tbl_book_copies
CREATE TABLE tbl_book_copies (
    book_copies_CopiesID INT PRIMARY KEY,
  book_copies_BookID INT,
    book_copies_BranchID INT,
    book_copies_No_Of_Copies INT,
    FOREIGN KEY (book_copies_BookID) REFERENCES tbl_book(book_BookID),
    FOREIGN KEY (book_copies_BranchID) REFERENCES tbl_library_branch(library_branch_BranchID)
);

INSERT INTO tbl_book_copies
    (book_copies_CopiesID, book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
    VALUES
    (1,'1','1','5'),
    (2,'2','1','5'),
    (3,'3','1','5'),
    (4,'4','1','5'),
    (5,'5','1','5'),
    (6,'6','1','5'),
    (7,'7','1','5'),
    (8,'8','1','5'),
    (9,'9','1','5'),
    (10,'10','1','5'),
    (11,'11','1','5'),
    (12,'12','1','5'),
    (13,'13','1','5'),
    (14,'14','1','5'),
    (15,'15','1','5'),
    (16,'16','1','5'),
    (17,'17','1','5'),
    (18,'18','1','5'),
    (19,'19','1','5'),
    (20,'20','1','5'),
    (21,'1','2','5'),
    (22,'2','2','5'),
    (23,'3','2','5'),
    (24,'4','2','5'),
    (25,'5','2','5'),
    (26,'6','2','5'),
    (27,'7','2','5'),
    (28,'8','2','5'),
    (29,'9','2','5'),
    (30,'10','2','5'),
    (31,'11','2','5'),
    (32,'12','2','5'),
    (33,'13','2','5'),
    (34,'14','2','5'),
    (35,'15','2','5'),
    (36,'16','2','5'),
    (37,'17','2','5'),
    (38,'18','2','5'),
    (39,'19','2','5'),
    (40,'20','2','5'),
    (41,'1','3','5'),
    (42,'2','3','5'),
    (43,'3','3','5'),
    (44,'4','3','5'),
    (45,'5','3','5'),
    (46,'6','3','5'),
    (47,'7','3','5'),
    (48,'8','3','5'),
    (49,'9','3','5'),
    (50,'10','3','5'),
    (51,'11','3','5'),
    (52,'12','3','5'),
    (53,'13','3','5'),
    (54,'14','3','5'),
    (55,'15','3','5'),
    (56,'16','3','5'),
    (57,'17','3','5'),
    (58,'18','3','5'),
    (59,'19','3','5'),
    (60,'20','3','5'),
    (61,'1','4','5'),
    (62,'2','4','5'),
    (63,'3','4','5'),
    (64,'4','4','5'),
    (65,'5','4','5'),
    (66,'6','4','5'),
    (67,'7','4','5'),
    (68,'8','4','5'),
    (69,'9','4','5'),
    (70,'10','4','5'),
    (71,'11','4','5'),
    (72,'12','4','5'),
    (73,'13','4','5'),
    (74,'14','4','5'),
    (75,'15','4','5'),
    (76,'16','4','5'),
    (77,'17','4','5'),
    (78,'18','4','5'),
    (79,'19','4','5'),
    (80,'20','4','5');

  SELECT * FROM tbl_book_copies

  --********************************************************************

  -- Table: tbl_book_authors
CREATE TABLE tbl_book_authors (
  book_authors_AuthorsID INT PRIMARY KEY,
    book_authors_BookID INT,
    book_authors_AuthorName VARCHAR(255),
    FOREIGN KEY (book_authors_BookID) REFERENCES tbl_book(book_BookID)
);

INSERT INTO tbl_book_authors
    (book_authors_AuthorsID, book_authors_BookID,book_authors_AuthorName)
    VALUES
    (1,'1','Patrick Rothfuss'),
    (2,'2','Stephen King'),
    (3,'3','Stephen King'),
    (4,'4','Frank Herbert'),
    (5,'5','J.R.R. Tolkien'),
    (6,'6','Christopher Paolini'),
    (7,'6','Patrick Rothfuss'),
    (8,'8','J.K. Rowling'),
    (9,'9','Haruki Murakami'),
    (10,'10','Shel Silverstein'),
    (11,'11','Douglas Adams'),
    (12,'12','Aldous Huxley'),
    (13,'13','William Goldman'),
    (14,'14','Chuck Palahniuk'),
    (15,'15','Louis Sachar'),
    (16,'16','J.K. Rowling'),
    (17,'17','J.K. Rowling'),
    (18,'18','J.R.R. Tolkien'),
    (19,'19','George R.R. Martin'),
    (20,'20','Mark Lee');

  SELECT * FROM tbl_book_authors

  --*********************************************************************


-- Q1.	Find the titles of all books published by "Bloomsbury."
SELECT book_Title
FROM tbl_book
WHERE book_PublisherName = 'Bloomsbury';



--Q2.	List the names of borrowers whose phone numbers start with the area code "212."
SELECT borrower_BorrowerName
FROM tbl_borrower
WHERE borrower_BorrowerPhone LIKE '212-%';



--Q3.	Retrieve the titles of books with more than 10 copies available.
SELECT b.book_Title
FROM tbl_book b
JOIN tbl_book_copies bc ON b.book_BookID = bc.book_copies_BookID
GROUP BY b.book_Title
HAVING SUM(bc.book_copies_No_Of_Copies) > 10;



--Q4. Display the names of borrowers who have borrowed books from the "Central" branch.
SELECT DISTINCT b.borrower_BorrowerName
FROM tbl_borrower b
JOIN tbl_book_loans bl ON b.borrower_CardNo = bl.book_loans_CardNo
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
WHERE lb.library_branch_BranchName = 'Central';



--Q5.	List the titles of books borrowed by borrower "Joe Smith."
SELECT DISTINCT b.book_Title
FROM tbl_book b
JOIN tbl_book_loans bl ON b.book_BookID = bl.book_loans_BookID
JOIN tbl_borrower bw ON bl.book_loans_CardNo = bw.borrower_CardNo
WHERE bw.borrower_BorrowerName = 'Joe Smith';



--Q6. Find the names of publishers for the books authored by "J.K. Rowling." 
SELECT DISTINCT b.book_PublisherName
FROM tbl_book b
JOIN tbl_book_authors a ON b.book_BookID = a.book_authors_BookID
WHERE a.book_authors_AuthorName = 'J.K. Rowling';



--Q7. 	Count the total number of books available in the library.
SELECT SUM(book_copies_No_Of_Copies) AS TotalBooks
FROM tbl_book_copies;



--Q8. Calculate the average number of copies available per book across all branches.
SELECT AVG(book_copies_No_Of_Copies) AS avg_copies_per_book
FROM tbl_book_copies;


--Q9.Find the branch with the highest number of books loaned out.
SELECT TOP 1 library_branch_BranchName, COUNT(*) AS TotalBooksLoaned
FROM tbl_book_loans
JOIN tbl_library_branch ON tbl_book_loans.book_loans_BranchID = tbl_library_branch.library_branch_BranchID
GROUP BY library_branch_BranchName
ORDER BY TotalBooksLoaned DESC;



--Q10.	Insert a new book titled "The Catcher in the Rye" by "J.D. Salinger" into the database.
INSERT INTO tbl_book (book_BookID, book_Title, book_PublisherName)
VALUES (21, 'The Catcher in the Rye', 'DAW Books'); 
INSERT INTO tbl_book_authors (book_authors_AuthorsID, book_authors_BookID, book_authors_AuthorName)
VALUES (21, 21, 'J.D. Salinger');

SELECT * FROM tbl_book



--Q11. Update the address of the "Sharpstown" library branch to "45 West Side Avenue, New York, NY 10012."
UPDATE tbl_library_branch
SET library_branch_BranchAddress = '45 West Side Avenue, New York, NY 10012'
WHERE library_branch_BranchName = 'Sharpstown'
SELECT * FROM tbl_library_branch;



--Q12. Remove all books published by "Pan Books" from the database.
DELETE FROM tbl_book_authors
WHERE book_authors_BookID IN (
    SELECT book_BookID
    FROM tbl_book
    WHERE book_PublisherName = 'Pan Books'
);
DELETE FROM tbl_book_copies
WHERE book_copies_BookID IN (
    SELECT book_BookID
    FROM tbl_book
    WHERE book_PublisherName = 'Pan Books'
);
DELETE FROM tbl_book_loans
WHERE book_loans_BookID IN (
    SELECT book_BookID
    FROM tbl_book
    WHERE book_PublisherName = 'Pan Books'
);
DELETE FROM tbl_book
WHERE book_PublisherName = 'Pan Books';



--Q13.Retrieve the names of borrowers who have borrowed the same book more than once.
SELECT DISTINCT b.borrower_BorrowerName
FROM tbl_book_loans bl
JOIN tbl_borrower b ON bl.book_loans_CardNo = b.borrower_CardNo
GROUP BY b.borrower_BorrowerName, bl.book_loans_BookID
HAVING COUNT(bl.book_loan_LoanID) > 1;



--Q14. Find the title of the book with the earliest due date.
SELECT TOP 1 b.book_Title
FROM tbl_book_loans bl
JOIN tbl_book b ON bl.book_loans_BookID = b.book_BookID
ORDER BY bl.book_loans_DueDate ASC;



--Q15.	List the names of borrowers who have borrowed books authored by both "Stephen King" and "J.K. Rowling."
SELECT DISTINCT br.borrower_BorrowerName, 
			    ba.book_authors_AuthorName
FROM tbl_book_loans bl
JOIN tbl_book b ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_book_authors ba ON b.book_BookID = ba.book_authors_BookID
JOIN tbl_borrower br ON bl.book_loans_CardNo = br.borrower_CardNo
WHERE ba.book_authors_AuthorName IN ('Stephen King', 'J.K. Rowling');



--Q16.	Find the names of borrowers who have borrowed books published by "Bloomsbury.
SELECT DISTINCT br.borrower_BorrowerName
FROM tbl_book_loans bl
JOIN tbl_book b ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_borrower br ON bl.book_loans_CardNo = br.borrower_CardNo
WHERE b.book_PublisherName = 'Bloomsbury';



--Q17. Retrieve the titles of books borrowed by borrowers located in New York.
SELECT DISTINCT b.book_Title 
FROM tbl_book_loans bl
JOIN tbl_book b ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_borrower br ON bl.book_loans_CardNo = br.borrower_CardNo
WHERE br.borrower_BorrowerAddress LIKE '%New York%';



--Q18 Calculate the average number of books borrowed per borrower.
SELECT AVG(book_count) AS average_books_borrowed
FROM (
    SELECT bl.book_loans_CardNo, COUNT(*) AS book_count
    FROM tbl_book_loans bl
    GROUP BY bl.book_loans_CardNo
) AS borrower_book_counts;



-- Q19.	Find the branch with the highest average number of books borrowed per borrower.
SELECT TOP 1 bl.book_loans_BranchID, lb.library_branch_BranchName, 
            (COUNT(*) * 1.0 / COUNT(DISTINCT bl.book_loans_CardNo)) AS avg_books_per_borrower
FROM tbl_book_loans bl
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
GROUP BY bl.book_loans_BranchID, lb.library_branch_BranchName
ORDER BY avg_books_per_borrower DESC;



-- Q20.	Rank library branches based on the total number of books borrowed, without grouping
SELECT lb.library_branch_BranchName, 
       COUNT(bl.book_loans_BookID) AS total_books_borrowed,
       RANK() OVER (ORDER BY COUNT(bl.book_loans_BookID) DESC) AS branch_rank
FROM tbl_book_loans bl
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
GROUP BY lb.library_branch_BranchName
ORDER BY branch_rank;



--Q21. Calculate the percentage of books borrowed from each branch relative to the total number of books borrowed across all branches.
SELECT lb.library_branch_BranchName, 
       COUNT(bl.book_loans_BookID) AS total_books_borrowed,
       (COUNT(bl.book_loans_BookID) * 100.0 / 
        SUM(COUNT(bl.book_loans_BookID)) OVER ()) AS percentage_of_total_books
FROM tbl_book_loans bl
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
GROUP BY lb.library_branch_BranchName
ORDER BY percentage_of_total_books DESC;



--Q22. Find the names of borrowers who have borrowed books authored by "Stephen King" and "J.K. Rowling" from the same library branch.
SELECT br.borrower_BorrowerName
FROM tbl_borrower br
JOIN tbl_book_loans bl ON br.borrower_CardNo = bl.book_loans_CardNo
JOIN tbl_book b ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_book_authors ba ON b.book_BookID = ba.book_authors_BookID
WHERE ba.book_authors_AuthorName IN ('Stephen King', 'J.K. Rowling')
GROUP BY br.borrower_BorrowerName
HAVING COUNT(ba.book_authors_AuthorName) = 2;



--Q23. Retrieve the names of borrowers who have borrowed books from branches located in New York and have more than 5 books checked out.  
SELECT br.borrower_BorrowerName
FROM tbl_borrower br
JOIN tbl_book_loans bl ON br.borrower_CardNo = bl.book_loans_CardNo
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
WHERE lb.library_branch_BranchAddress LIKE '%New York%'  
GROUP BY br.borrower_BorrowerName
HAVING COUNT(bl.book_loans_BookID) > 5;



--Q24. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
SELECT SUM(bc.book_copies_No_Of_Copies) AS TotalCopies
FROM tbl_book_copies bc
JOIN tbl_book b ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe' AND lb.library_branch_BranchName = 'Sharpstown';



-- Q25. How many copies of the book titled "The Lost Tribe" are owned by each library branch?
SELECT DISTINCT lb.library_branch_BranchName,
       SUM(bc.book_copies_No_Of_Copies) OVER (PARTITION BY lb.library_branch_BranchName) AS TotalCopies
FROM tbl_book_copies bc
JOIN tbl_book b ON bc.book_copies_BookID = b.book_BookID
JOIN tbl_library_branch lb ON bc.book_copies_BranchID = lb.library_branch_BranchID
WHERE b.book_Title = 'The Lost Tribe';



--Q26. Retrieve the names of all borrowers who do not have any books checked out.
SELECT b.borrower_BorrowerName
FROM tbl_borrower b
LEFT JOIN tbl_book_loans bl ON b.borrower_CardNo = bl.book_loans_CardNo
WHERE bl.book_loans_CardNo IS NULL;



--Q27. For each book that is loaned out from the "Sharpstown" branch and whose Due Date is today, retrieve the book title, the borrower's name, and the borrower's address. 
INSERT INTO tbl_book_loans 
    (book_loan_LoanID, book_loans_BookID, book_loans_BranchID,
	book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)
VALUES 
    (52, 1, 1, 100, GETDATE(), GETDATE());

	
SELECT b.book_Title, br.borrower_BorrowerName, br.borrower_BorrowerAddress
FROM tbl_book_loans bl
JOIN tbl_book b ON bl.book_loans_BookID = b.book_BookID
JOIN tbl_borrower br ON bl.book_loans_CardNo = br.borrower_CardNo
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
WHERE lb.library_branch_BranchName = 'Sharpstown'
AND bl.book_loans_DueDate = CAST(GETDATE() AS DATE);



--Q28. For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
SELECT lb.library_branch_BranchName, COUNT(bl.book_loans_BookID) AS total_books_loaned
FROM tbl_book_loans bl
JOIN tbl_library_branch lb ON bl.book_loans_BranchID = lb.library_branch_BranchID
GROUP BY lb.library_branch_BranchName;
