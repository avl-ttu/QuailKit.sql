SELECT        detection_id, [start], [end], [low], [high], latitude, longitude, temperature
FROM            (SELECT        dbo.detection.detection_id, dbo.detection.[start], dbo.detection.[end], dbo.detection.[low], dbo.detection.[high], dbo.node_log.latitude, dbo.node_log.longitude, dbo.node_log.temperature, ROW_NUMBER() 
                                                    OVER (PARTITION BY detection_id
                          ORDER BY abs(DATEDIFF(second, dbo.detection.start, dbo.node_log.datetime))) AS r
FROM            dbo.node_log INNER JOIN
                         dbo.detection INNER JOIN
                         dbo.audio_data ON dbo.detection.data_id = dbo.audio_data.data_id INNER JOIN
                         dbo.audio_node ON dbo.audio_data.audio_id = dbo.audio_node.audio_id ON dbo.node_log.node_id = dbo.audio_node.node_id) AS sub
WHERE        r = 1