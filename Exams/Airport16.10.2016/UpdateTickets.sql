UPDATE Tickets
SET Price *= 1.5
WHERE FlightID IN
(
	SELECT f.FlightID
	FROM Flights AS f
	JOIN Airlines AS a
	ON f.AirlineID = a.AirlineID
	WHERE Rating = (SELECT MAX(Rating) AS MaxRating FROM Airlines)
) 