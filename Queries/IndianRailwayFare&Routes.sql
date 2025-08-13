select * from Railway;

-- The top 5 most expensive train routes
SELECT fromStnCode, toStnCode, MAX(totalFare) AS highest_fare
FROM RAILWAY
GROUP BY fromStnCode, toStnCode
ORDER BY highest_fare DESC
FETCH FIRST 5 ROWS ONLY;

-- Average fare by travel class
SELECT classCode, ROUND(AVG(totalFare), 2) AS avg_fare
FROM RAILWAY
GROUP BY classCode
ORDER BY avg_fare DESC;

-- Shortest vs longest distance journeys
SELECT fromStnCode, toStnCode, distance
FROM RAILWAY
ORDER BY distance DESC;

-- Total revenue by train number
SELECT trainNumber, SUM(totalFare) AS total_revenue
FROM RAILWAY
GROUP BY trainNumber
ORDER BY total_revenue DESC;

-- Combine expensive + long-distance journeys
SELECT fromStnCode, toStnCode, totalFare, distance
FROM RAILWAY
WHERE totalFare > 1000

UNION

SELECT fromStnCode, toStnCode, totalFare, distance
FROM RAILWAY
WHERE distance > 700;























