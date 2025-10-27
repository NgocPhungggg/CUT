---------------------Readers tables---------------------
CREATE TABLE Readers (
    ReaderID     INT IDENTITY(1,1) PRIMARY KEY,
    FullName     NVARCHAR(100) NOT NULL,
    BirthDate    DATE          NOT NULL,
    Address      NVARCHAR(200),
    PhoneNumber  VARCHAR(15)   UNIQUE,
    Email        VARCHAR(100)  UNIQUE
);

-------------------------Books-------------------------
CREATE TABLE Books (
    BookID       INT IDENTITY(1,1) PRIMARY KEY,
    Title        NVARCHAR(200) NOT NULL,
    Author       NVARCHAR(100) NOT NULL,
    Publisher    NVARCHAR(100),
    PublishYear  INT,
    Category     NVARCHAR(100)
);

----------------------Library Cards---------------------
CREATE TABLE LibraryCards (
    CardID       INT IDENTITY(1,1) PRIMARY KEY,
    ReaderID     INT NOT NULL,
    IssueDate    DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    ExpiryDate   DATE NULL,
    CONSTRAINT FK_LibraryCards_Readers FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID) ON DELETE CASCADE
);

----------------------Library Slips---------------------
CREATE TABLE BorrowSlips (
    BorrowID     INT IDENTITY(1,1) PRIMARY KEY,
    CardID       INT NOT NULL,
    BorrowDate   DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    DueDate      DATE NOT NULL,
    CONSTRAINT FK_BorrowSlips_Cards FOREIGN KEY (CardID) REFERENCES LibraryCards(CardID)
);

----------------------Borrow Details---------------------
CREATE TABLE BorrowDetails (
    BorrowID     INT NOT NULL,
    BookID       INT NOT NULL,
    ReturnDate   DATE NULL,
    Condition    NVARCHAR(50) NULL,
    CONSTRAINT PK_BorrowDetails PRIMARY KEY (BorrowID, BookID),
    CONSTRAINT FK_BorrowDetails_BorrowSlips FOREIGN KEY (BorrowID) REFERENCES BorrowSlips(BorrowID) ON DELETE CASCADE,
    CONSTRAINT FK_BorrowDetails_Books FOREIGN KEY (BookID)   REFERENCES Books(BookID)
);


ALTER TABLE Books
ADD CONSTRAINT CK_PublishYear CHECK (PublishYear >= 1900 AND PublishYear <= YEAR(GETDATE()))

ALTER TABLE LibraryCards
ADD CONSTRAINT CK_Card_Expiry CHECK (ExpiryDate IS NULL OR ExpiryDate >= IssueDate)

ALTER TABLE BorrowSlips
ADD CONSTRAINT CK_DueDate CHECK (DueDate >= BorrowDate)

CREATE INDEX IX_BorrowSlips_Card ON BorrowSlips(CardID);
CREATE INDEX IX_BorrowDetails_Book ON BorrowDetails(BookID);
CREATE INDEX IX_Books_Category ON Books(Category);





