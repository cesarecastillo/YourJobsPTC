using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YourJob1
{
    public class conexiones
    {
        public static MySqlConnection ObtenerConexion()
        {
            MySqlConnection datos = new MySqlConnection("server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/");
            datos.Open();
            return datos;
        }
    }
}