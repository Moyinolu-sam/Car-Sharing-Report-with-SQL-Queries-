SELECT *
FROM carsharing_df c
JOIN time t
ON c.id = t.id;
#part a
SELECT t.timestamp, c.demand
FROM carsharing_df c
JOIN time t
ON c.id = t.id
ORDER BY c.demand DESC
LIMIT 1;
#gives the highest demand rate 2017

#partb
SELECT t.week_day_name,
       t.month_name,
       t.season,
       AVG(c.demand) AS avg_demand
FROM carsharing_df c
JOIN time t ON c.id = t.id
WHERE YEAR(t.timestamp) = 2017
GROUP BY t.week_day_name, t.month_name, t.season
ORDER BY avg_demand DESC
LIMIT 1;
#HIGHEST

SELECT t.week_day_name,
       t.month_name,
       t.season,
       AVG(c.demand) AS avg_demand
FROM carsharing_df c
JOIN time t ON c.id = t.id
WHERE YEAR(t.timestamp)= 2017
GROUP BY t.week_day_name, t.month_name, t.season
ORDER BY avg_demand ASC
LIMIT 1;
#LOWEST

#part c
SELECT t.hour,
       AVG(c.demand) AS avg_demand
FROM carsharing_df c
JOIN time t ON c.id = t.id
WHERE YEAR(t.timestamp) = 2017
  AND t.week_day_name IN ("MONDAY", "SATURDAY")
GROUP BY t.hour
ORDER BY t.hour;

#part d
SELECT w.weather, COUNT(*) AS frequency
FROM carsharing_df c
JOIN weather w
ON c.weather_code = w.weather_code
JOIN time t ON c.id = t.id
WHERE YEAR(t.timestamp) = 2017
GROUP BY w.weather
ORDER BY frequency DESC;

#part e
SELECT t.month_name,
       AVG(c.demand) AS avg_demand
FROM carsharing_df c
JOIN time t ON c.id = t.id
WHERE YEAR(t.timestamp) = 2017
GROUP BY month_name
ORDER BY avg_demand DESC
LIMIT 1;
