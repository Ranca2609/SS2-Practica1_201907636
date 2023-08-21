import os
from conexion import ConexionDB
conn = ConexionDB()
seleccion = 0
while seleccion != 6:
    print("""       Menu Principal
                1. Borrar Modelo
                2. Crear Modelo
                3. Extraer Informacion
                4. Cargar Informacion
                5. Realizar Consultas
                6. Salida
            """)
    seleccion = input()
    if seleccion == "1":
        conn.BorrarModelo()
    elif seleccion == "2":
        conn.CrearModelo()
    elif seleccion == "3":
        ruta = input("Ingrese la ruta del archivo: ")
        conn.ExtraerInformacion(ruta)
    elif seleccion == "4":
        conn.CargarInformacion()
    elif seleccion == "5":
        print("Realizar Consultas")
    elif seleccion == "6":
        print("Salida")
        break
    else:
        print("Opcion no valida")

        
