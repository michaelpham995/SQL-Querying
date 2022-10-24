-- Question 1
UPDATE CHECKOUTS
SET LATE_FLAG = 'Y'
WHERE DUE_BACK_DATE < CURRENT_DATE;

-- Question 2
SELECT GENRE, TITLE, PUBLISHER, NUMBER_OF_PAGES
FROM TITLE
ORDER BY NUMBER_OF_PAGES ASC;

--Question 3
SELECT FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM AUTHOR
WHERE FIRST_NAME < 'D'
ORDER BY LAST_NAME DESC;

--Question 4
SELECT PATRON_ID, TITLE_COPY_ID, DATE_OUT, DUE_BACK_DATE, DATE_IN
FROM CHECKOUTS
WHERE DATE_OUT BETWEEN '01-FEBRUARY-2021' AND '28-FEBRUARY-2021'
ORDER BY 5,3;

--Question 5
SELECT PATRON_ID, TITLE_COPY_ID, DATE_OUT, DUE_BACK_DATE, DATE_IN
FROM CHECKOUTS
WHERE DATE_OUT >= '01-FEBRUARY-2021' AND DATE_OUT <= '28-FEBRUARY-2021'
ORDER BY 5,3;

--Question 6
SELECT CHECKOUT_ID, TITLE_COPY_ID, 2 - TIMES_RENEWED AS RENEWALS_LEFT 
FROM CHECKOUTS
WHERE ROWNUM <= 5
ORDER BY RENEWALS_LEFT ASC;

--Question 7


SELECT * FROM 
(SELECT TITLE, GENRE,
    ROUND(NUMBER_OF_PAGES / 100, 0) AS BOOK_LEVEL
FROM TITLE
)
WHERE BOOK_LEVEL > 9;

--Question 8
SELECT FIRST_NAME, MIDDLE_NAME, LAST_NAME 
FROM AUTHOR
WHERE MIDDLE_NAME IS NOT NULL
ORDER BY 2, 3 ASC;

--Question 9 
SELECT SYSDATE AS TODAY_UNFORMATTED, TO_CHAR(SYSDATE, 'MON-DD-YYYY') AS TODAY_FORMATTED,
5 AS DAYS_LATE,
.25 AS LATE_FEE,
5 * .25 AS TOTAL_LATE_FEES,
5 - (5 * .25) AS LATE_FEES_UNTIL_LOCK
FROM DUAL;

--Question 10
SELECT CHECKOUT_ID, TITLE_COPY_ID, 2 - TIMES_RENEWED AS RENEWALS_LEFT
FROM CHECKOUTS
ORDER BY RENEWALS_LEFT
FETCH FIRST 5 ROWS ONLY;

--Question 11
SELECT DISTINCT GENRE
FROM TITLE
ORDER BY GENRE ASC;

--Question 12
SELECT *
FROM TITLE
WHERE LOWER(TITLE) LIKE '%bird%';




DROP TABLE AUTHOR;
DROP TABLE CHECKOUTS;
DROP TABLE LOCATION;
DROP TABLE PATRON;
DROP TABLE PATRON_PHONE;
DROP TABLE PATRON_TITLE_HOLDS;
DROP TABLE TITLE;
DROP TABLE TITLE_AUTHOR_LINKING; 
DROP TABLE TITLE_LOC_LINKING;




