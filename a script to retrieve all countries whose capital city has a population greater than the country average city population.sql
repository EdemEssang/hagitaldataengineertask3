SELECT 
    co.Name AS Country,
    ci.Name AS Capital,
    ci.Population AS CapitalPopulation,
    AVG(all_cities.Population) AS AvgCityPopulation
FROM 
    country co
JOIN 
    city ci ON co.Capital = ci.ID
JOIN 
    city all_cities ON all_cities.CountryCode = co.Code
WHERE 
    ci.Population > (
        SELECT AVG(c.Population)
        FROM city c
        WHERE c.CountryCode = co.Code
    )
GROUP BY 
    co.Code, co.Name, ci.Name, ci.Population
ORDER BY 
    co.Name;