USE [QuailKit]
GO
/****** Object:  View [dbo].[detection_group]    Script Date: 4/11/2019 2:12:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[detection_group]
AS
WITH dd AS (SELECT        d1.detection_id AS id1, d2.detection_id AS id2, d1.start AS t1, d2.start AS t2
                            FROM            dbo.detection_summary AS d1 INNER JOIN
                                                     dbo.detection_summary AS d2 ON ABS(DATEDIFF(day, d1.start, d2.start)) = 0), hd AS
    (SELECT        id1, id2, t1, t2
      FROM            dd AS dd_1
      WHERE        (ABS(DATEDIFF(hour, t1, t2)) = 0)), md AS
    (SELECT        id1, id2, t1, t2
      FROM            hd AS hd_1
      WHERE        (ABS(DATEDIFF(minute, t1, t2)) = 0)), sd AS
    (SELECT        id1, id2, t1, t2
      FROM            md AS md_1
      WHERE        (ABS(DATEDIFF(second, t1, t2)) < 3)), ld AS
    (SELECT        d1.detection_id AS id_1, d1.start AS start_1, d1.[end] AS end_1, d1.low AS low_1, d1.high AS high_1, d1.latitude AS latitude_1, d1.longitude AS longitude_1, d1.temperature AS temperature_1, d2.detection_id AS id_2, 
                                d2.start AS start_2, d2.[end] AS end_2, d2.low AS low_2, d2.high AS high_2, d2.latitude AS latitude_2, d2.longitude AS longitude_2, d2.temperature AS temperature_2
      FROM            sd AS sd_1 INNER JOIN
                                dbo.detection_summary AS d1 ON sd_1.id1 = d1.detection_id INNER JOIN
                                dbo.detection_summary AS d2 ON sd_1.id2 = d2.detection_id), g AS
    (SELECT        id_2 AS group_id, id_1 AS detection_id, ABS(DATEDIFF(millisecond, start_2, start_1)) * (331.3 + 0.606 * (temperature_1 + temperature_2) / 2) / 1000 AS delay_distance, 6371000 * ACOS(SIN(RADIANS(latitude_1)) 
                                * SIN(RADIANS(latitude_2)) + COS(RADIANS(latitude_1)) * COS(RADIANS(latitude_2)) * COS(RADIANS(longitude_2 - longitude_1))) AS actual_distance
      FROM            ld AS ld_1)
    SELECT        group_id, detection_id, delay_distance, actual_distance
     FROM            g AS g_1
     WHERE        (actual_distance >= delay_distance)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "g_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'detection_group'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'detection_group'
GO
