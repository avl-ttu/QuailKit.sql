SELECT        dbo.detection.detection_id, dbo.audio_data.audio_id, dbo.detection.channel, dbo.detection.start, dbo.detection.[end], dbo.detection.low, dbo.detection.high, dbo.detection.algorithm
FROM            dbo.audio_data INNER JOIN
                         dbo.detection ON dbo.audio_data.data_id = dbo.detection.data_id