/*
================================================================================
SCRIPT MAESTRO DE MIGRACI�N
================================================================================
INSTRUCCIONES:
1. Aseg�rate de que SSMS est� en "Modo SQLCMD" (Men� Query -> SQLCMD Mode).
2. Modifica los valores de las variables DB_DESTINO y DB_ORIGEN seg�n sea necesario.
3. Aseg�rate de que la ruta en los comandos ':r' sea correcta.
4. Ejecuta este script.
================================================================================
*/

-- PASO 1: Definir las variables.
-- Aqu� es el �NICO lugar donde necesitas cambiar los nombres de las BBDD.
:setvar DB_DESTINO "SEA_Abir2025DB"
:setvar DB_ORIGEN  "SEASecundariaDB"

-- Tambi�n podemos definir una ruta base para los scripts
:setvar RutaScripts "C:\Users\Wilson\Documents\SQL Server Management Studio\Saint\"

PRINT '============================================================';
PRINT 'INICIANDO PROCESO DE MIGRACI�N';
PRINT 'Base de Datos Origen:  ' + '$(DB_ORIGEN)';
PRINT 'Base de Datos Destino: ' + '$(DB_DESTINO)';
PRINT '============================================================';
GO

-- PASO 2: Ejecutar el primer script modularizado.
PRINT 'Ejecutando: 1_Migracion_Base.sql...';
:r $(RutaScripts)1_Importacion_data_a_nueva_DB.sql
GO

PRINT 'OK. Script de migraci�n base finalizado.';
GO

-- PASO 3: Ejecutar el segundo script modularizado.
PRINT 'Ejecutando: 2_Procesar_Inventario.sql...';
:r $(RutaScripts)2_Cargo_Inventario_de_otra_DB.sql
GO

PRINT '============================================================';
PRINT 'PROCESO DE MIGRACI�N FINALIZADO EXITOSAMENTE.';
PRINT '============================================================';
GO