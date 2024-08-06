-- Checking for date ranges and # of records

SELECT MIN(date) AS min_date, MAX(date) AS max_date, COUNT(*) AS record_count
  
FROM portfolio-project-430215.Stock_Prices.stock_prices

--	min_date	max_date	record_count	
	2014-01-02	2017-12-29	497472

-- Checking for missing values

SELECT *
FROM portfolio-project-430215.Stock_Prices.stock_prices
WHERE symbol IS NULL

-- NO VALUES MISSING

SELECT *
FROM portfolio-project-430215.Stock_Prices.stock_prices
WHERE `date` IS NULL

-- NO VALUES MISSING

SELECT *
FROM portfolio-project-430215.Stock_Prices.stock_prices
WHERE open IS NULL

-- There are 11 'open' values missing. 8 of these are missing high and low values as well. 4 of these have 0 volume, which means no trades were made that day, so it makes sense why those value would be missing. 

SELECT *
FROM portfolio-project-430215.Stock_Prices.stock_prices
WHERE high IS NULL

SELECT *
FROM portfolio-project-430215.Stock_Prices.stock_prices
WHERE low IS NULL

-- Same result as previous query. These missing values wouldn't significantly impact analysis. We will focus on close values more.

SELECT *
FROM portfolio-project-430215.Stock_Prices.stock_prices
WHERE close IS NULL

-- No missing values

SELECT *
FROM portfolio-project-430215.Stock_Prices.stock_prices
WHERE volume IS NULL

-- No missing values


-- Checking for duplicates. Combine the symbol and date to get unique results. 

SELECT symbol, date, COUNT(*) AS cnt
FROM portfolio-project-430215.Stock_Prices.stock_prices
GROUP BY symbol, date
HAVING cnt > 1
ORDER BY cnt DESC

-- No duplicates

