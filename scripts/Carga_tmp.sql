USE BDP1_SEMI2;

BULK INSERT temporal
FROM 'C:\Scripts\EntregasUSAC-Delivery.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = 'UTF-8',
    DATAFILETYPE = 'Char',
    TABLOCK
);


;WITH Duplicates AS (
    SELECT id_entrega,
           ROW_NUMBER() OVER(PARTITION BY id_entrega ORDER BY (SELECT NULL)) AS RowNum
    FROM temporal
)
DELETE FROM Duplicates
WHERE RowNum > 1;


DELETE FROM temporal
WHERE anio IS NULL
    OR nombre_producto IS NULL
    OR estado_entrega IS NULL
    OR precio_producto IS NULL;USE BDP1_SEMI2;

BULK INSERT temporal
FROM 'C:\Scripts\EntregasUSAC-Delivery.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = 'UTF-8',
    DATAFILETYPE = 'Char',
    TABLOCK
);


;WITH Duplicates AS (
    SELECT id_entrega,
           ROW_NUMBER() OVER(PARTITION BY id_entrega ORDER BY (SELECT NULL)) AS RowNum
    FROM temporal
)
DELETE FROM Duplicates
WHERE RowNum > 1;


DELETE FROM temporal
WHERE anio IS NULL
    OR nombre_producto IS NULL
    OR estado_entrega IS NULL
    OR precio_producto IS NULL;