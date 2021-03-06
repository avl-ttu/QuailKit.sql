USE [QuailKit]
GO
/****** Object:  StoredProcedure [dbo].[detection_family]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[detection_family]
	-- Add the parameters for the stored procedure here
	@detection_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
WITH d1 AS (SELECT        detection_id, [start], latitude, longitude, temperature
FROM            (SELECT        dbo.detection.detection_id, dbo.detection.[start], dbo.node_log.latitude, dbo.node_log.longitude, dbo.node_log.temperature, ROW_NUMBER() 
                                                    OVER (PARTITION BY detection_id
                          ORDER BY abs(DATEDIFF(second, dbo.detection.start, dbo.node_log.datetime))) AS r
FROM            dbo.node_log INNER JOIN
                         dbo.detection INNER JOIN
                         dbo.audio_data ON dbo.detection.data_id = dbo.audio_data.data_id INNER JOIN
                         dbo.audio_node ON dbo.audio_data.audio_id = dbo.audio_node.audio_id ON dbo.node_log.node_id = dbo.audio_node.node_id
						 ) AS sub
WHERE        r = 1
), d2 AS (SELECT * FROM d1 WHERE d1.detection_id = @detection_id)
    SELECT        TOP (100) PERCENT group_id, detection_id
     FROM            (SELECT        d2.detection_id AS group_id, d1.detection_id, ABS(DATEDIFF(millisecond, d1.start, d2.start)) * (331.3 + 0.606 * (d1.temperature + d2.temperature) / 2) / 1000 AS delay_distance, 
                                                         2.0 * 6371000 * ASIN(SQRT(POWER(SIN(RADIANS((d2.latitude - d1.latitude) / 2.0)), 2) + COS(RADIANS(d1.latitude)) * COS(RADIANS(d2.latitude)) * POWER(SIN(RADIANS((d2.longitude - d1.longitude) / 2.0)), 2))) 
                                                         AS actual_distance
                               FROM            d1 INNER JOIN  d2 ON ABS(DATEDIFF(second, d1.start, d2.start)) < 3) AS sub
     WHERE        (delay_distance <= actual_distance)
END
GO
