WITH d AS (SELECT        detection_id, start, [end], latitude, longitude, temperature
                         FROM            dbo.detection_summary)
    SELECT        TOP (100) PERCENT group_id, detection_id
     FROM            (SELECT        d1.detection_id AS group_id, d2.detection_id, ABS(DATEDIFF(millisecond, d1.start, d2.start)) * (331.3 + 0.606 * (d1.temperature + d2.temperature) / 2) / 1000 AS delay_distance, 
                                                         2.0 * 6371000 * ASIN(SQRT(POWER(SIN(RADIANS((d2.latitude - d1.latitude) / 2.0)), 2) + COS(RADIANS(d1.latitude)) * COS(RADIANS(d2.latitude)) * POWER(SIN(RADIANS((d2.longitude - d1.longitude) / 2.0)), 2))) 
                                                         AS actual_distance
                               FROM            d AS d1 INNER JOIN
                                                         d AS d2 ON ABS(DATEDIFF(second, d1.start, d2.start)) < 3) AS sub
     WHERE        (delay_distance <= actual_distance)