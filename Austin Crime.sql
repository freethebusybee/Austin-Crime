-- Crime Trends
SELECT YEAR(occurred_date) AS theft_yr, COUNT(*) AS theft_no
FROM crime_report
WHERE category_description = 'Theft'
GROUP BY theft_yr, category_description
ORDER BY theft_no DESC
LIMIT 10;

-- Clearence Rates
SELECT 
  ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (), 2) AS percentage,
  CASE 
    WHEN clearance_status = 'C' THEN 'cleared' 
    WHEN clearance_status = 'N' THEN 'Not cleared' 
    ELSE 'undetermined status' 
  END AS clearance_status
FROM crime_report
WHERE clearance_status IN ('C', 'N', '')
GROUP BY clearance_status;

-- COVID 19 Impact
SELECT COUNT(*) AS count_of_crimes_covid
FROM crime_report
WHERE occurred_date BETWEEN '2020-03-01' AND '2021-09-01';

-- Geographical Analysis
SELECT location, COUNT(location)
FROM crime_report
GROUP BY location
ORDER BY COUNT(location) DESC
LIMIT 10;
