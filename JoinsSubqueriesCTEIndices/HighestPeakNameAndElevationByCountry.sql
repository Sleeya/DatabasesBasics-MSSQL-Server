USE Geography
SELECT  TOP (5)
	CountryName,
	HighestPeakName,
	HighestPeakElevation,
	CASE
		WHEN m.MountainRange IS NULL THEN '(no mountain)'
		ELSE m.MountainRange
	END AS Mountain
FROM
(
	SELECT 
		CountrysAndHighestPeak.CountryName,
		CASE
			WHEN PeakName IS NULL THEN '(no highest peak)'
			ELSE PeakName
		END AS HighestPeakName,
		CountrysAndHighestPeak.HighestPeakElevation 
		FROM
	(
		SELECT 
			c.CountryName,
			CASE
				WHEN MAX(p.Elevation) IS NULL THEN 0
				ELSE MAX(p.Elevation)
			END AS HighestPeakElevation
		FROM Countries AS c
		LEFT OUTER JOIN MountainsCountries AS mc
		ON c.CountryCode = mc.CountryCode
		LEFT OUTER JOIN Mountains AS m
		ON mc.MountainId = m.Id
		LEFT OUTER JOIN Peaks AS p
		ON m.Id = p.MountainId
		GROUP BY c.CountryName
	) AS CountrysAndHighestPeak
	LEFT OUTER JOIN Peaks AS p
	ON CountrysAndHighestPeak.HighestPeakElevation = p.Elevation
) AS CountryPeakElevation
LEFT OUTER JOIN Peaks AS p
ON CountryPeakElevation.HighestPeakName = p.PeakName
LEFT OUTER JOIN Mountains AS m
ON p.MountainId = m.Id
ORDER BY CountryName,HighestPeakName