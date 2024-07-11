using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YourJob1
{
    public class conexiones
    {

        // Declara la cadena de conexión como una constante de solo lectura.
        // Esto asegura que la cadena de conexión no pueda ser modificada después de su inicialización.
        private static readonly string connectionString = "server=127.0.0.1;database=yourjob_db;Uid=root;pwd=Info2024/*-";

        // Método estático que se utiliza para obtener una conexión a la base de datos MySQL
        public static MySqlConnection ObtenerConexion()
        {

            // Crea una nueva instancia de MySqlConnection utilizando la cadena de conexión especificada
            MySqlConnection datos = new MySqlConnection(connectionString);

            // Abre la conexión a la base de datos.
            datos.Open();

            // Devuelve la conexión abierta para su uso
            return datos;
        }
    }
}