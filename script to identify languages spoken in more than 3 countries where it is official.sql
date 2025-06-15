SELECT 
    cl.Language,
    COUNT(cl.CountryCode) AS NumberOfCountries
FROM 
    countrylanguage cl
WHERE 
    cl.IsOfficial = 'T'
GROUP BY 
    cl.Language
HAVING 
    COUNT(cl.CountryCode) > 3
ORDER BY 
    NumberOfCountries DESC, cl.Language;