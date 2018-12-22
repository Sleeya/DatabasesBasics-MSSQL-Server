
WITH CTE_CountryPeakMountain (CountryName,PeakName,Elevation,MountainRange) AS 
(
	SELECT c.CountryName,p.PeakName,MAX(p.Elevation) AS MaxElevation,m.MountainRange
	FROM Countries AS c
	LEFT OUTER JOIN MountainsCountries AS mc
	ON c.CountryCode = mc.CountryCode
	LEFT OUTER JOIN Mountains AS m
	ON mc.MountainId = m.Id
	LEFT OUTER JOIN Peaks AS p
	ON m.Id = p.MountainId
	GROUP BY c.CountryName,p.PeakName,m.MountainRange
)

SELECT  TOP (5)
	CountryPeak.CountryName,
	ISNULL(FullInfo.PeakName,'(no highest peak)') AS 'HighestPeakName',
	ISNULL(CountryPeak.MaxElevation,0) AS 'HighestPeakElevation',
	ISNULL(FullInfo.MountainRange,'(no mountain)') AS 'Mountain'
	FROM
(
	SELECT CountryName,MAX(Elevation) AS MaxElevation
	FROM CTE_CountryPeakMountain
	GROUP BY CountryName
) AS CountryPeak
LEFT OUTER JOIN CTE_CountryPeakMountain AS FullInfo
ON CountryPeak.CountryName = FullInfo.CountryName AND CountryPeak.MaxElevation = FullInfo.Elevation
ORDER BY CountryPeak.CountryName
