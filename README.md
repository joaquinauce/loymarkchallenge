## Contenido de la solucion
1. [General Info](#generalinfo)
Se ha solicitado un CRUD de Usuarios completo, con sus datos obligatorios.
Se solicita además un listado de actividades (como una auditoria) de todo lo que se ha hecho dentro de la solucion web.
2. [Technologies](#technologies)
ASP.NET C# (.NET Framework 4.7.2)
SQL Server 2019
3. [Installation](#installation)
Ejecutar en SQL Server los scripts que se encuentran en la raíz del repositorio => ScriptsLoymark.sql
Dentro de la solución, encontrarás un archivo llamado Web.config, ahi dentro deberás completar con los datos correspondientes a tu base de datos, dentro de la etiqueta connectionStrings.
Ejecutar la solucion con Visual Studio 2019.
6. [Considerations](#Considerations)
En base de datos, en vez de eliminar de manera física un usuario, se le agrega una columna fecha_baja y se realiza un update sobre la tabla usuarios, seteandole la fecha. Se agrega en listado de usuarios, un check que permite ver aquellos usuarios que han sido eliminados
