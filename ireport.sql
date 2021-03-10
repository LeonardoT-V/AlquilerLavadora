SELECT
  count(v.id_venta) as cantidadVentas,
  lav.codigo_lavadoras as lavadorass,
  ROUND(SUM(lav.agua_lavadora)::numeric,2) as consumo,
  ROUND(SUM(lav.electricidad_lavadora)::numeric,2) as energia,
  sum(precio_ventadetalle) as precio
FROM
ventadetalle
INNER JOIN venta AS v ON v.id_venta = ventaDetalle.id_venta_ventaDetalle
INNER JOIN lavadoras AS lav ON lav.id_lavadora = ventaDetalle.id_lavadora_ventaDetalle
GROUP BY
lav.codigo_lavadora
ORDER BY
lav.codigo_lavadora
ASC
