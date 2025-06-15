SELECT 
    co.Name AS Country,
    cap.Name AS Capital,
    cap.Population AS CapitalPopulation
FROM 
    country co
JOIN 
    city cap ON co.Capital = cap.ID
WHERE 
    (
        SELECT COUNT(*) 
        FROM city c 
        WHERE c.CountryCode = co.Code AND c.Population > cap.Population
    ) >= 3
ORDER BY 
    co.Name;