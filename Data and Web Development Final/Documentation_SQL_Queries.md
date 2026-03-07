# Complex SQL Queries Documentation

This document provides a breakdown of the complex SQL queries implemented in the Kumari Cinemas ASP.NET Web Forms application. These queries are essential for generating advanced reports and providing analytical insights into the system's data.

## 1. User Ticket History Report (`UserTicket.aspx`)

**Objective:** Retrieve a chronological history of a specific user's ticket purchases, with the ability to filter the results by a specific time frame (e.g., the last 6 months) or view all historical records.

**SQL Query:**
```sql
SELECT b.BOOKINGTIME, t.SEATNO, t.STATUS 
FROM "BOOKINGS" b 
INNER JOIN "TICKETS" t ON b.BOOKINGID = t.BOOKINGID 
WHERE b.USERID = :USERID 
  AND (:PERIOD = -1 OR b.BOOKINGTIME >= ADD_MONTHS(SYSDATE, -:PERIOD)) 
ORDER BY b.BOOKINGTIME DESC
```

**Documentation Highlights:**
* **Data Aggregation:** Uses an `INNER JOIN` between the `BOOKINGS` and `TICKETS` tables, linked by the primary/foreign key `BOOKINGID`, to flatten the relationship and show individual seat numbers alongside the booking timestamp.
* **Dynamic Date Filtering:** Employs Oracle's `ADD_MONTHS(SYSDATE, -:PERIOD)` function to calculate dynamic date thresholds based on user input from the UI dropdown. The `:PERIOD = -1` condition acts as a bypass switch for when the user selects "All Historical Records".
* **Sorting:** Orders the results using `ORDER BY b.BOOKINGTIME DESC` to ensure the most recent purchases appear at the top of the GUI grid.

---

## 2. Theater Movies & Showtimes Analysis (`TheaterMovie.aspx`)

**Objective:** Display a comprehensive grid of movie showtimes across different theaters and halls, while simultaneously calculating and rendering the real-time "Paid Occupancy Percentage" for each individual showtime.

**SQL Query:**
```sql
SELECT 
    th.CITY, th.NAME AS THEATER_NAME, h.NAME AS HALL_NAME, 
    m.TITLE as MOVIE_TITLE, m.DURATION, m.LANGUAGE, m.GENRE, 
    s.SHOWDATE, s.SHOWTIME, s.PRICE, 
    NVL((
        SELECT ROUND((COUNT(t.TICKETID) / NULLIF(h.CAPACITY, 0)) * 100, 2) 
        FROM "TICKETS" t 
        INNER JOIN "BOOKINGS" b ON t.BOOKINGID = b.BOOKINGID 
        WHERE b.SHOWTIMEID = s.SHOWTIMEID AND UPPER(t.STATUS) = 'PAID'
    ), 0) AS OCCUPANCY_PCT 
FROM "THEATERS" th 
INNER JOIN "HALLS" h ON th.THEATERID = h.THEATERID 
INNER JOIN "SHOWTIMES" s ON h.HALLID = s.HALLID 
INNER JOIN "MOVIES" m ON s.MOVIEID = m.MOVIEID 
WHERE (:THEATERID = -1 OR th.THEATERID = :THEATERID) 
  AND (:MOVIEID = -1 OR m.MOVIEID = :MOVIEID) 
ORDER BY s.SHOWDATE DESC, s.SHOWTIME DESC
```

**Documentation Highlights:**
* **Multi-Table Joins:** Combines data from four core tables (`THEATERS`, `HALLS`, `SHOWTIMES`, and `MOVIES`) using sequential `INNER JOIN` clauses to create a complete view of a scheduled screening.
* **Correlated Subquery:** Features a complex inline subquery within the `SELECT` statement to calculate occupancy. This subquery counts the number of tickets marked as 'PAID' for the specific `SHOWTIMEID` currently being evaluated by the outer query.
* **Mathematical Safety Rules:** Uses `NULLIF(h.CAPACITY, 0)` to prevent fatal "Divide by Zero" exceptions in the database engine if a hall is configured with a 0 capacity. 
* **Null Handling (`NVL`):** Wraps the subquery in `NVL(..., 0)` to guarantee that showtimes with exactly zero ticket sales return a `0` percentage rather than a raw database `NULL`, maintaining UI integrity.
* **Dynamic Search Parameters:** Uses parameterized conditions `(:THEATERID = -1 OR th.THEATERID = :THEATERID)` allowing the data source to securely filter the grid based on UI dropdown selections without requiring multiple different query strings or risking SQL injection.

---

## 3. Top 3 Theaters by Occupancy (`MovieOccupancy.aspx`)

**Objective:** For a selected movie, rank the top 3 best-performing locations (Theater + Hall combinations) based on their total historical seat occupancy percentage across all showtimes.

**SQL Query:**
```sql
SELECT * FROM (
    SELECT 
        th.NAME || ' (' || h.NAME || ')' AS LABEL,
        th.NAME AS THEATER, th.CITY, h.NAME AS HALL,
        NVL(ROUND((COUNT(t.TICKETID) / NULLIF((COUNT(DISTINCT s.SHOWTIMEID) * MAX(h.CAPACITY)), 0)) * 100, 2), 0) AS PCT 
    FROM "SHOWTIMES" s 
    INNER JOIN "HALLS" h ON s.HALLID = h.HALLID 
    INNER JOIN "THEATERS" th ON h.THEATERID = th.THEATERID 
    LEFT JOIN "BOOKINGS" b ON s.SHOWTIMEID = b.SHOWTIMEID 
    LEFT JOIN "TICKETS" t ON b.BOOKINGID = t.BOOKINGID AND UPPER(t.STATUS) = 'PAID' 
    WHERE s.MOVIEID = :MID
    GROUP BY th.NAME, h.NAME, th.CITY, h.HALLID 
    ORDER BY PCT DESC
) WHERE ROWNUM <= 3
```

**Documentation Highlights:**
* **String Concatenation:** Uses the Oracle string concatenation operator `||` to format a clean UI label directly in the database logic (`Theater Name (Hall Name)`).
* **Left Outer Joins:** Crucially uses `LEFT JOIN` for `BOOKINGS` and `TICKETS`. This ensures that if a showtime has occurred but *no* tickets were sold, the Theater/Hall combination is still included in the dataset (with a 0% occupancy), rather than disappearing entirely.
* **Advanced Aggregation Mathematics:** Calculates the total theoretical capacity across multiple showtimes using `(COUNT(DISTINCT s.SHOWTIMEID) * MAX(h.CAPACITY))`. It then divides the total valid tickets `COUNT(t.TICKETID)` by this theoretical maximum to find the true cumulative occupancy percentage.
* **Inline View / Derived Table:** Because Oracle SQL processes `ORDER BY` after `ROWNUM`, the query encapsulates the sorting logic inside a sub-select block (an inline view). The outer query then safely applies `WHERE ROWNUM <= 3` to extract only the top tier performers.
