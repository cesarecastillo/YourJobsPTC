using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourJob1
{
    public partial class _05_company_register_ESP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private const string initVector = "myptcgroupyj2024";
        private const int keysize = 256;

        public static string EncryptString(string plainText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged
            {
                Mode = CipherMode.CBC
            };
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
            using (MemoryStream memoryStream = new MemoryStream())
            {
                using (CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write))
                {
                    cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
                    cryptoStream.FlushFinalBlock();
                    byte[] cipherTextBytes = memoryStream.ToArray();
                    return Convert.ToBase64String(cipherTextBytes);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nombreEmpresa = TxtName2.Text.Trim();
            string correo = TxtEmail2.Text.Trim();
            string telefono = TxtPhoneNumber.Text.Trim();
            string contraseña = TxtContra2.Text.Trim();
            string confirmarContraseña = TxtConfirm2.Text.Trim();
            string actividadEconomica = economic_act.SelectedValue;
            string pais = DropDownList1.SelectedValue;

            if (ValidarFormulario(nombreEmpresa, correo, telefono, contraseña, confirmarContraseña, actividadEconomica, pais))
            {
                string contraseñaEncriptada = EncryptString(contraseña, initVector);

                if (RegistrarEmpresa(nombreEmpresa, correo, telefono, contraseñaEncriptada, actividadEconomica, pais))
                {
                    MostrarAlertaExitoYRedirigir();
                }
                else
                {
                    MostrarAlerta("Error en el Registro", "Hubo un error al registrar la empresa. Por favor, inténtelo de nuevo.", "error");
                }
            }
        }

        private bool ValidarFormulario(string nombreEmpresa, string correo, string telefono, string contraseña, string confirmarContraseña, string actividadEconomica, string pais)
        {
            if (string.IsNullOrEmpty(nombreEmpresa) || string.IsNullOrEmpty(correo) || string.IsNullOrEmpty(telefono) ||
                string.IsNullOrEmpty(contraseña) || string.IsNullOrEmpty(confirmarContraseña) || string.IsNullOrEmpty(actividadEconomica) ||
                string.IsNullOrEmpty(pais))
            {
                MostrarAlerta("Error de Validación", "Todos los campos son obligatorios.", "warning");
                return false;
            }

            if (nombreEmpresa.Length < 4)
            {
                MostrarAlerta("Error", "El nombre de la empresa debe tener al menos 4 caracteres.", "error");
                return false;
            }
            if (telefono.Length < 9)
            {
                MostrarAlerta("Error", "El número de teléfono debe tener al menos 9 caracteres.", "error");
                return false;
            }

            if (correo.Length < 10 || !EsCorreoValido(correo))
            {
                MostrarAlerta("Error", "Por favor, ingrese una dirección de correo válida.", "error");
                return false;
            }

            if (contraseña != confirmarContraseña)
            {
                MostrarAlerta("Error de Validación", "Las contraseñas no coinciden.", "warning");
                return false;
            }

            if (EmpresaExiste(correo))
            {
                MostrarAlerta("Error de Validación", "El correo ya está en uso por otro usuario o empresa.", "error");
                return false;
            }

            return true;
        }

        private bool EsCorreoValido(string correo)
        {
            var regex = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
            return regex.IsMatch(correo);
        }

        private void MostrarAlerta(string titulo, string mensaje, string icono)
        {
            alerta.Text = $"<script>Swal.fire('{titulo}', '{mensaje}', '{icono}');</script>";
        }

        private void MostrarAlertaExitoYRedirigir()
        {
            string script = @"
        <script>
            Swal.fire({
                title: 'Registro Exitoso',
                text: 'La empresa ha sido registrada exitosamente.',
                icon: 'success',
                timer: 3000,
                showConfirmButton: false
            }).then(() => {
                window.location.href = '02.login.aspx';
            });
        </script>";
            alerta.Text = script;
        }

        private bool EmpresaExiste(string correo)
        {
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Empresas WHERE Email = @Email UNION SELECT COUNT(*) FROM Usuarios WHERE Correo = @Email";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", correo);

                connection.Open();
                int count = 0;
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        count += reader.GetInt32(0);
                    }
                }
                connection.Close();

                return count > 0;
            }
        }

        private bool RegistrarEmpresa(string nombreEmpresa, string correo, string telefono, string contraseñaEncriptada, string actividadEconomica, string pais)
        {
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "INSERT INTO Empresas (Nombre, Email, Telefono, Contraseña, ActividadEconomica, Pais) " +
                               "VALUES (@Nombre, @Email, @Telefono, @Contraseña, @ActividadEconomica, @Pais)";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Nombre", nombreEmpresa);
                command.Parameters.AddWithValue("@Email", correo);
                command.Parameters.AddWithValue("@Telefono", telefono);
                command.Parameters.AddWithValue("@Contraseña", contraseñaEncriptada);
                command.Parameters.AddWithValue("@ActividadEconomica", actividadEconomica);
                command.Parameters.AddWithValue("@Pais", pais);

                connection.Open();
                int result = command.ExecuteNonQuery();
                connection.Close();

                return result > 0;
            }
        }
    }
}