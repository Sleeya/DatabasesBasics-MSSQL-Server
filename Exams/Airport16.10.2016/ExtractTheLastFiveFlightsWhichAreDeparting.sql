SELECT TOP (5) * FROM
(
	SELECT TOP (5) f.FlightID,
		   f.DepartureTime,
		   f.ArrivalTime,
		   oa.AirportName AS Origin,
		   da.AirportName AS Destination
	FROM Flights AS f
	JOIN Airports AS oa
	ON f.OriginAirportID = oa.AirportID
	JOIN Airports AS da
	ON f.DestinationAirportID = da.AirportID
	WHERE f.Status = 'Departing'
	ORDER BY DepartureTime DESC,FlightID DESC
) AS temp
ORDER BY DepartureTime,FlightID
