using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace YourJob1
{
    public partial class _04_user_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private const string initVector = "emmanuelinfo2022";
        private const int keysize = 256;

        public static string EncryptString(string plainText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
            cryptoStream.FlushFinalBlock();
            byte[] cipherTextBytes = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            return Convert.ToBase64String(cipherTextBytes);
        }


        protected void RegisterButton_Click(object sender, EventArgs e)
        {

            string firstName = TxtName.Text.Trim();
            string lastName = TxtLastname.Text.Trim();
            string gender = Gender.SelectedValue;
            string email = TxtMail.Text.Trim();
            string password = TxtContra.Text.Trim();
            string confirmPassword = TxtConfirm.Text.Trim();
            string age = TxtAge.Text.Trim();

            if (ValidateForm(firstName, lastName, gender, email, password, confirmPassword, age))
            {
                string encryptedPassword = EncryptString(password, initVector);

                if (!EmailExists(email))
                {
                    int userId = RegisterUser(firstName, lastName, gender, email, encryptedPassword, int.Parse(age));
                    if (userId > 0)
                    {
                        Session["UserId"] = userId;
                        ShowSuccessAlert();
                        ClearForm();
                    }
                    else
                    {
                        ShowAlert("Registration Error", "There was a problem registering the user. Please try again.", "error");
                    }
                }
                else
                {
                    ShowAlert("User Already Exists", "The email is already in use. Please use another one.", "error");
                }
            }
        }


        private bool ValidateForm(string firstName, string lastName, string gender, string email, string password, string confirmPassword, string age)
            {
                if (firstName.Length < 4)
                {
                    ShowAlert("Error", "The first name must be at least 4 characters long.", "error");
                    return false;
                }
                if (lastName.Length < 4)
                {
                    ShowAlert("Error", "The last name must be at least 4 characters long.", "error");
                    return false;
                }
                if (string.IsNullOrEmpty(gender))
                {
                    ShowAlert("Error", "Please select a gender.", "error");
                    return false;
                }
                if (email.Length < 10 || !IsValidEmail(email))
                {
                    ShowAlert("Error", "Please enter a valid email address.", "error");
                    return false;
                }
                if (password.Length < 4)
                {
                    ShowAlert("Error", "The password must be at least 4 characters long.", "error");
                    return false;
                }
                if (password != confirmPassword)
                {
                    ShowAlert("Error", "The passwords do not match.", "error");
                    return false;
                }
                if (!int.TryParse(age, out int ageInt) || ageInt < 18 || ageInt > 65)
                {
                    ShowAlert("Error", "The age must be a number between 18 and 65.", "error");
                    return false;
                }

                return true;
            }

            private bool IsValidEmail(string email)
            {
                // Verifica si el email tiene un formato válido usando una expresión regular
                string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
                return Regex.IsMatch(email, pattern);
            }

            private bool EmailExists(string email)
            {
                // Comprueba si el email ya está registrado en la base de datos
                bool exists = false;
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MySQLConnStr"].ConnectionString;

                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT COUNT(*) FROM usuarios WHERE Correo = @Correo";
                    using (MySqlCommand cmd = new MySqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@Correo", email);
                        exists = Convert.ToInt32(cmd.ExecuteScalar()) > 0;
                    }
                }

                return exists;
            }

        private int RegisterUser(string firstName, string lastName, string gender, string email, string encryptedPassword, int age)
        {
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/";
            int userId = 0;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "INSERT INTO Usuarios (Nombre_Usuario, Apellido_Usuario, Genero, Correo, Password, Edad) " +
                               "VALUES (@Nombre, @Apellido, @Genero, @Correo, @Contraseña, @Edad); SELECT LAST_INSERT_ID();";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Nombre", firstName);
                command.Parameters.AddWithValue("@Apellido", lastName);
                command.Parameters.AddWithValue("@Genero", gender);
                command.Parameters.AddWithValue("@Correo", email);
                command.Parameters.AddWithValue("@Contraseña", encryptedPassword);
                command.Parameters.AddWithValue("@Edad", age);

                connection.Open();
                userId = Convert.ToInt32(command.ExecuteScalar());
                connection.Close();
            }
            return userId;
        }

        private void ShowAlert(string title, string message, string icon)
            {
                // Muestra un mensaje de alerta usando SweetAlert
                alerta.Text = $"<script>Swal.fire('{title}', '{message}', '{icon}');</script>";
            }

            private void ShowSuccessAlert()
            {
                // Muestra un mensaje de éxito
                //ShowAlert("Registration Successful", "The user has been successfully registered.", "success");

            string script = @"
                <script>
                    Swal.fire({
                        title: 'Registration Successful',
                        text: 'The user has been registered successfully.',
                        icon: 'success',
                        timer: 3000,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.href = '08.resume.form.aspx';
                    });
                </script>";
            alerta.Text = script;
        }

            private void ClearForm()
            {
                // Limpia los campos del formulario
                TxtName.Text = string.Empty;
                TxtLastname.Text = string.Empty;
                Gender.SelectedIndex = 0;
                TxtMail.Text = string.Empty;
                TxtAge.Text = string.Empty;
                TxtContra.Text = string.Empty;
                TxtConfirm.Text = string.Empty;
            }

        
    }

}