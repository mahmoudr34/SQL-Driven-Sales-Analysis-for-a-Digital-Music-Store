/* Query 1 */

SELECT Genre.Name,
       count(invoiceline.InvoiceId)
FROM Genre
JOIN Track ON Genre.GenreId = Track.GenreId
JOIN InvoiceLine ON InvoiceLine.TrackId = Track.TrackId
GROUP BY Genre.Name
ORDER BY 2 DESC
LIMIT 5;


/* Query 2 */

SELECT strftime('%w', Invoice.InvoiceDate),
       count(invoice.invoicedate)
FROM Invoice
JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre ON Genre.GenreId = Track.GenreId
WHERE Genre.Name = 'Rock'
GROUP BY 1
ORDER BY 1;


/* Query 3 */

SELECT Genre.Name,
       avg(invoice.Total)
FROM Genre
JOIN Track ON Genre.GenreId = Track.GenreId
JOIN InvoiceLine ON InvoiceLine.TrackId = Track.TrackId
JOIN Invoice ON Invoice.InvoiceId = InvoiceLine.InvoiceId
WHERE Genre.Name = 'Rock';



/* Query 4 */

SELECT Invoice.CustomerId,
       count(invoice.InvoiceId)
FROM Invoice
JOIN Customer ON Customer.CustomerId = Invoice.CustomerId
JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre ON Genre.GenreId = Track.GenreId
WHERE Genre.Name = 'Rock'
GROUP BY Invoice.CustomerId
ORDER BY 2 DESC
LIMIT 10;