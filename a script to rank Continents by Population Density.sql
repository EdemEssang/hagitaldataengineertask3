SELECT 
    Continent,
    ROUND(SUM(Population) / SUM(SurfaceArea), 2) AS PopulationDensity,
    CONCAT(FORMAT(SUM(Population), 0), ' people / ', 
           FORMAT(SUM(SurfaceArea), 0), ' km²') AS PopulationToAreaRatio,
    RANK() OVER (ORDER BY (SUM(Population) / SUM(SurfaceArea)) DESC) AS DensityRank
FROM 
    country
GROUP BY 
    Continent
ORDER BY 
    PopulationDensity DESC;