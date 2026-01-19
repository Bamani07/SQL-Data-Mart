CREATE TABLE Theatre (
   TheatreId VARCHAR(30) PRIMARY KEY,
   CName     VARCHAR(20),
   Address   VARCHAR(30),
   MainTel   VARCHAR(15)
);

CREATE TABLE Productions (
   Pid                VARCHAR(20) PRIMARY KEY,
   Title              VARCHAR(40),
   ProductionDirector VARCHAR(40),
   PlayAuthor         VARCHAR(40)
);

CREATE TABLE Performances (
   PerId     VARCHAR(20) PRIMARY KEY,
   PDate     VARCHAR(20),
   PHour     VARCHAR(5),
   PMinute   VARCHAR(5),
   Comments  VARCHAR(50),
   TheatreId VARCHAR(30),
   Pid       VARCHAR(20),
   CONSTRAINT fk_P
      FOREIGN KEY (Pid)
      REFERENCES Productions(Pid),
   CONSTRAINT fk_T
      FOREIGN KEY (TheatreId)
      REFERENCES Theatre(TheatreId)
);

CREATE TABLE Clients (
   ClientId VARCHAR(20) PRIMARY KEY,
   Title    VARCHAR(20),
   Names    VARCHAR(20),
   Street   VARCHAR(20),
   Town     VARCHAR(20),
   County   VARCHAR(20),
   TelNo    VARCHAR(20),
   Email    VARCHAR(20)
);  -- 🔹 removed trailing comma

CREATE TABLE Purchase (
   PurchaseId      VARCHAR(20) PRIMARY KEY,
   PaymentMethod   VARCHAR(20),
   DeliveryMethod  VARCHAR(20),
   TotalAmount     INT,
   ClientId        VARCHAR(20),
   PerId           VARCHAR(20),
   CONSTRAINT fk_py
       FOREIGN KEY (ClientId)
       REFERENCES Clients(ClientId),
   CONSTRAINT fk_px
       FOREIGN KEY (PerId)
       REFERENCES Performances(PerId)
);


INSERT INTO Theatre (TheatreId, CName, Address, MainTel)
VALUES 
('1001', 'Roopam', '120 Civil Lines', '12909991'),
('1002', 'ICV',    '120 Nehru Garden', '995817');


INSERT INTO Productions (Pid, Title, ProductionDirector, PlayAuthor)
VALUES
('10', 'The Cross Bow', 'John Willson', 'Meny'),
('20', 'The Buls', 'Cena', 'Sony');


INSERT INTO Performances (PerId, PDate, PHour, PMinute, Comments, TheatreId, Pid)
VALUES
('PER1', '2026-01-10', '19', '00', 'Nice Movie', '1001', '10'),
('PER2', '2026-01-11', '18', '30', 'Worst Movie', '1002', '20');


INSERT INTO Clients (ClientId, Title, Names, Street, Town, County, TelNo, Email)
VALUES
('111', 'Mr', 'John Wick', '120', 'Laytown', 'USA', '99581713', 'abc@gmail.com'),
('110', 'Mr', 'Harry', '122', 'Iceberg', 'USA', '9920920192', 'def@gmail.com'),
('112', 'Ms', 'Sinsa', '121', 'Downtown', 'USA', '24534332', 'ghi@gmail.com');


INSERT INTO Purchase (PurchaseId, PaymentMethod, DeliveryMethod, TotalAmount, ClientId, PerId)
VALUES
('112', 'Card','Home', 1221, '111', 'PER1'),
('113', 'Cash','Theatre', 1222, '110', 'PER2');

SELECT 
    p.Pid,
    SUM(pr.TotalAmount) AS Total_Sales
FROM Purchase pr
JOIN Performances pe ON pr.PerId = pe.PerId
JOIN Productions p   ON pe.Pid = p.Pid
GROUP BY p.Pid;

SELECT 
    SUBSTRING(aa.PDate, 4, 4) AS Month,
    cc.CName AS TheatreName,
    SUM(bb.TotalAmount) AS TotalSale
FROM Purchase bb
JOIN Performances aa ON bb.PerId = aa.PerId
JOIN Theatre cc ON aa.TheatreId = cc.TheatreId
GROUP BY 
    SUBSTRING(aa.PDate, 4, 4),
    cc.CName;

SELECT 
    c.CName AS TheatreName,
    cl.Names AS ClientName,
    MAX(p.TotalAmount) AS TotalAmount
FROM Clients cl
JOIN Purchase p     ON cl.ClientId = p.ClientId
JOIN Performances pe ON p.PerId = pe.PerId
JOIN Theatre c      ON pe.TheatreId = c.TheatreId
GROUP BY 
    cl.Names,
    c.CName;