import pyodbc
import logging
import subprocess
import os
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

driver = 'ODBC Driver 17 for SQL Server'
server = 'LAPTOP-EQKV72FJ\\SQLEXPRESS'
user = 'MyLogin'
password = '123'
database = 'BDP1_SEMI2'

connection_string = (
    f"DRIVER={driver};"
    f"SERVER={server};"
    f"DATABASE={database};"
    f"UID={user};"
    f"PWD={password};"
)

class ConexionDB:

    def ExtraerInformacion(self, ruta_archivo):
        try:
            with open('C:\\Scripts\\Carga.sql', 'r+') as sql_file:
                sql_query = sql_file.read()
                sql_query = sql_query.replace('ruta_entrante', ruta_archivo)
                if os.path.exists('C:\\Scripts\\Carga_tmp.sql'):
                    os.remove('C:\\Scripts\\Carga_tmp.sql')
                    input("Archivo temporal borrado")
                with open('C:\\Scripts\\Carga_tmp.sql', 'w') as sql_file_tmp:
                    sql_file_tmp.write(sql_query)
                sql_file_tmp.close()
            sql_file.close()
            print("Información extraida exitosamente")
        except pyodbc.Error as error:
            print("Error: No se pudo extraer la informacion {}".format(error))


    def CargarInformacion(self):
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()
            subprocess.run(['sqlcmd', '-S', server, '-d', database, '-U', user, '-P', password, '-i', 'C:\\Scripts\\Carga_tmp.sql'])
            conn.commit()
            print("Información cargada exitosamente")
            conn.close()
        except pyodbc.Error as error:
            print("Error: No se pudo cargar la informacion. {}".format(error))

    def BorrarModelo(self):
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()
            subprocess.run(['sqlcmd', '-S', server, '-d', database, '-U', user, '-P', password, '-i', 'C:\\Scripts\\Eliminacion.sql'])
            conn.commit()
            print("Modelo borrado exitosamente")
            conn.close()
        except pyodbc.Error as error:
            print("Error: No se pudo eliminar el modelo. {}".format(error))

    def CrearModelo(self):
        try:
            conn = pyodbc.connect(connection_string)
            cursor = conn.cursor()
            subprocess.run(['sqlcmd', '-S', server, '-d', database, '-U', user, '-P', password, '-i', 'C:\\Scripts\\Creacion.sql'])
            conn.commit()
            print("Modelo creado exitosamente")
            conn.close()
        except pyodbc.Error as error:
            print("Error: No se pudo crear el modelo. {}".format(error))
