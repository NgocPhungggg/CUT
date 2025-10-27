---------------------Readers tables---------------------
INSERT INTO Readers (FullName, BirthDate, Address, PhoneNumber, Email)
VALUES
(N'Alice Nguyen',     '2002-05-12', N'Hanoi, Vietnam',            '840901234567', 'alice.nguyen@uni.edu'),
(N'Carlos Diaz',      '2001-09-22', N'Madrid, Spain',             '34912345678',  'carlos.diaz@uni.edu'),
(N'Daria Kowalska',   '2000-03-04', N'Krakow, Poland',            '48123456789',  'daria.k@uni.edu'),
(N'Ethan Smith',      '1999-11-30', N'New York, USA',             '11234567890',  'ethan.smith@uni.edu'),
(N'Farah Hassan',     '2002-07-18', N'Casablanca, Morocco',       '212612345678', 'farah.hassan@uni.edu'),
(N'Giulia Rossi',     '2001-02-22', N'Rome, Italy',               '390612345678', 'giulia.rossi@uni.edu'),
(N'Hiro Tanaka',      '2000-12-09', N'Tokyo, Japan',              '81312345678',  'hiro.tanaka@uni.edu'),
(N'Isabella Santos',  '2002-10-14', N'Sao Paulo, Brazil',         '551112345678', 'isabella.santos@uni.edu'),
(N'Jakub Nowak',      '1999-06-25', N'Warsaw, Poland',            '48501234567',  'jakub.nowak@uni.edu'),
(N'Linh Tran',        '2001-08-05', N'Ho Chi Minh City, Vietnam', '84812345678',  'linh.tran@uni.edu');

INSERT INTO Books (Title, Author, Publisher, PublishYear, Category)
VALUES
(N'Introduction to Databases', N'Elmasri & Navathe', N'Pearson', 2021, N'Computer Science'),
(N'Data Structures and Algorithms', N'Robert Lafore', N'Pearson', 2020, N'Computer Science'),
(N'Artificial Intelligence: A Modern Approach', N'Stuart Russell', N'Prentice Hall', 2021, N'Artificial Intelligence'),
(N'Machine Learning Basics', N'Tom Mitchell', N'McGraw Hill', 2019, N'Artificial Intelligence'),
(N'Linear Algebra and Its Applications', N'Gilbert Strang', N'Wellesley-Cambridge', 2016, N'Mathematics'),
(N'Operating System Concepts', N'Silberschatz et al.', N'Wiley', 2018, N'Computer Science'),
(N'Computer Networks', N'Andrew S. Tanenbaum', N'Pearson', 2019, N'Networking'),
(N'Statistics for Data Science', N'James D. Miller', N'O''Reilly', 2022, N'Data Science'),
(N'Programming in Python 3', N'Mark Summerfield', N'Addison-Wesley', 2017, N'Programming'),
(N'Cloud Computing Essentials', N'Rajkumar Buyya', N'Elsevier', 2020, N'Cloud Computing');


INSERT INTO LibraryCards (ReaderID, IssueDate, ExpiryDate)
VALUES
(1, '2023-09-01', '2026-09-01'),
(2, '2023-09-01', '2026-09-01'),
(3, '2023-09-01', '2026-09-01'),
(4, '2023-09-01', '2026-09-01'),
(5, '2023-09-01', '2026-09-01'),
(6, '2023-09-01', '2026-09-01'),
(7, '2023-09-01', '2026-09-01'),
(8, '2023-09-01', '2026-09-01'),
(9, '2023-09-01', '2026-09-01'),
(10, '2023-09-01', '2026-09-01');

INSERT INTO BorrowSlips (CardID, BorrowDate, DueDate)
VALUES
(1, '2024-01-10', '2024-01-24'),
(2, '2024-01-15', '2024-01-29'),
(3, '2024-01-20', '2024-02-03'),
(4, '2024-02-01', '2024-02-15'),
(5, '2024-02-10', '2024-02-24');

-- BorrowSlip 1: Alice Nguyen
INSERT INTO BorrowDetails (BorrowID, BookID, ReturnDate, Condition)
VALUES
(1, 1, '2024-01-20', N'Good'),   -- Returned
(1, 2, NULL, N'On Loan');        -- Still borrowed
INSERT INTO BorrowDetails (BorrowID, BookID, ReturnDate, Condition)
VALUES
(2, 3, NULL, N'On Loan');
INSERT INTO BorrowDetails (BorrowID, BookID, ReturnDate, Condition)
VALUES
(3, 4, NULL, N'On Loan'),
(3, 5, NULL, N'On Loan');
INSERT INTO BorrowDetails (BorrowID, BookID, ReturnDate, Condition)
VALUES
(4, 6, '2024-02-10', N'Good');
INSERT INTO BorrowDetails (BorrowID, BookID, ReturnDate, Condition)
VALUES
(5, 7, NULL, N'On Loan'),
(5, 8, NULL, N'On Loan');
