USE [BDautorepuesto]
GO
/****** Object:  StoredProcedure [dbo].[SiExisteStock]    Script Date: 04/07/2019 2:40:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SiExisteStock]
(
	@ID_Anio int,
	@ID_Tienda int,
	@Codigo nvarchar(12)
)
AS
	SET NOCOUNT ON;
SELECT COUNT(Stock.ID_Existencia) AS total FROM Stock INNER JOIN Anio ON Stock.ID_Anio = Anio.ID_Anio
 INNER JOIN Tienda ON Stock.ID_Tienda = Tienda.ID_Tienda INNER JOIN Producto ON Stock.Codigo = Producto.Codigo 
 WHERE (Stock.ID_Anio = @ID_Anio) AND (Stock.ID_Tienda = @ID_Tienda) AND (Stock.Codigo = @Codigo) AND (Producto.Estado = 1)