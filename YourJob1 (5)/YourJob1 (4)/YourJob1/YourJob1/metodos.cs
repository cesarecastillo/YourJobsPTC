using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YourJob1
{
    public class metodos
    {
        //**************************** Método para verificar si se repiten los usuario ****************************
        public static int UsuariosRepetidos(string contra, string nombre, string apellido, string genero, string correo)
        {
            int valor = 0;
            MySqlConnection conexion1 = conexiones.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("SELECT Id_Usuario FROM usuarios WHERE correo=@correo", conexion1);
            cmd.Parameters.AddWithValue("@correo", correo);
            valor = Convert.ToInt32(cmd.ExecuteScalar());
            if (valor == 0)
            {
                AgregarUsuario(nombre, apellido, genero, contra, correo);
            }
            conexion1.Close();
            return valor;
        }

        private static void AgregarUsuario(string nombre, string apellido, string genero, string contra, string correo)
        {
            MySqlConnection conexion1 = conexiones.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO usuarios (Nombre_Usuario, Apellido_Usuario, Genero, Password, correo) VALUES (@nombre, @apellido, @genero, @contra, @correo)", conexion1);
            cmd.Parameters.AddWithValue("@nombre", nombre);
            cmd.Parameters.AddWithValue("@apellido", apellido);
            cmd.Parameters.AddWithValue("@genero", genero);
            cmd.Parameters.AddWithValue("@contra", contra);
            cmd.Parameters.AddWithValue("@correo", correo);
            cmd.ExecuteNonQuery();
            conexion1.Close();
        }
        private static void AgregarEmpresa(string nombre, string email, string telefono, string contra, string act, string pais)
        {
            MySqlConnection conexion1 = conexiones.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO empresas (Nombre, Email, Telefono, Contraseña, ActividadEconomica, Pais) VALUES (@nombre, @email, @telefono, @contra, @act, @pais)", conexion1);
            cmd.Parameters.AddWithValue("@nombre", nombre);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@telefono", telefono);
            cmd.Parameters.AddWithValue("@contra", contra);
            cmd.Parameters.AddWithValue("@act", act);
            cmd.Parameters.AddWithValue("@pais", pais);
            cmd.ExecuteNonQuery();
            conexion1.Close();
        }
        public static int EmpresasRepetidos(string nombre, string email, string telefono, string contra, string act, string pais)
        {
            int valor = 0;
            MySqlConnection conexion1 = conexiones.ObtenerConexion();
            MySqlCommand cmd = new MySqlCommand("SELECT Id_Empresa FROM empresas WHERE Email = @Email", conexion1);
            cmd.Parameters.AddWithValue("@Email", email);
            valor = Convert.ToInt32(cmd.ExecuteScalar());
            if (valor == 0)
            {
                AgregarEmpresa(nombre, email, telefono, contra, act, pais);
            }
            conexion1.Close();
            return valor;
        }
    }
}