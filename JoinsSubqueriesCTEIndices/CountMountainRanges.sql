USE Geography

SELECT mc.CountryCode,COUNT(mc.MountainId)
FROM MountainsCountries AS mc
WHERE mc.CountryCode IN('BG','US','RU')
GROUP BY mc.CountryCode


SELECT mc.CountryCode,COUNT(mc.MountainId)
FROM MountainsCountries AS mc
JOIN Countries AS c
ON mc.CountryCode = c.CountryCode
WHERE c.CountryName IN ('United States','Russia','Bulgaria')
GROUP BY mc.CountryCode
