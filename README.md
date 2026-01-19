A relational database has been created according to the ERD.  The tables
are as follows:
•	Theatre(Theatre#, Name, Address, MainTel);
•	Production(P#, Title, ProductionDirector, PlayAuthor);
•	Performance(Per#, P#, Theatre#, pDate, pHour, pMinute, Comments);
•	Client(Client#, Title, Name, Street, Town, County, telNo, e-mail);
•	TicketPurchase(Purchase#, Client#, Per#, PaymentMethod, DeliveryMethod, TotalAmount).

QUERY 1
	The total sale value of each production. 

QUERY 2
  Monthly sale value of each theatre.

QUERY 3
	The theatre name (for each theatre) and the names of clients who have the highest spending in that theatre.
