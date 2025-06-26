/*
================================================================================
SCRIPT MAESTRO DE MIGRACIÓN
================================================================================
INSTRUCCIONES:
1. Asegúrate de que SSMS está en "Modo SQLCMD" (Menú Query -> SQLCMD Mode).
2. Modifica los valores de las variables DB_DESTINO y DB_ORIGEN según sea necesario.
3. Asegúrate de que la ruta en los comandos ':r' sea correcta.
4. Ejecuta este script.
================================================================================
*/

-- PASO 1: Definir las variables.
-- Aquí es el ÚNICO lugar donde necesitas cambiar los nombres de las BBDD.
:setvar DB_DESTINO "SEA_Abir2025DB"
:setvar DB_ORIGEN  "SEASecundariaDB"

-- También podemos definir una ruta base para los scripts
:setvar RutaScripts "C:\Users\Wilson\Documents\SQL Server Management Studio\Saint\"

PRINT '============================================================';
PRINT 'INICIANDO PROCESO DE MIGRACIÓN';
PRINT 'Base de Datos Origen:  ' + '$(DB_ORIGEN)';
PRINT 'Base de Datos Destino: ' + '$(DB_DESTINO)';
PRINT '============================================================';
GO

-- PASO 2: Ejecutar el primer script modularizado.
PRINT 'Ejecutando: 1_Migracion_Base.sql...';
:r $(RutaScripts)1_Importacion_data_a_nueva_DB.sql
GO

PRINT 'OK. Script de migración base finalizado.';
GO

-- PASO 3: Ejecutar el segundo script modularizado.
PRINT 'Ejecutando: 2_Procesar_Inventario.sql...';
:r $(RutaScripts)2_Cargo_Inventario_de_otra_DB.sql
GO

PRINT '============================================================';
PRINT 'PROCESO DE MIGRACIÓN FINALIZADO EXITOSAMENTE.';
PRINT '============================================================';
GO