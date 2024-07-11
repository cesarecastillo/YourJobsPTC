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
    public partial class _05_company_register : System.Web.UI.Page
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
            string companyName = TxtName2.Text.Trim();
            string email = TxtEmail2.Text.Trim();
            string phoneNumber = TxtPhoneNumber.Text.Trim();
            string password = TxtContra2.Text.Trim();
            string confirmPassword = TxtConfirm2.Text.Trim();
            string economicActivity = economic_act.SelectedValue;
            string country = DropDownList1.SelectedValue;

            if (ValidateForm(companyName, email, phoneNumber, password, confirmPassword, economicActivity, country))
            {
                string encryptedPassword = EncryptString(password, initVector);

                if (RegisterCompany(companyName, email, phoneNumber, encryptedPassword, economicActivity, country))
                {
                    ShowSuccessAlertAndRedirect();
                }
                else
                {
                    ShowAlert("Registration Failed", "There was an error while registering the company. Please try again.", "error");
                }
            }
        }

        private bool ValidateForm(string companyName, string email, string phoneNumber, string password, string confirmPassword, string economicActivity, string country)
        {
            if (string.IsNullOrEmpty(companyName) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(phoneNumber) ||
                string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword) || string.IsNullOrEmpty(economicActivity) ||
                string.IsNullOrEmpty(country))
            {
                ShowAlert("Validation Error", "All fields are required.", "warning");
                return false;
            }

            if (companyName.Length < 4)
            {
                ShowAlert("Error", "The company name must be at least 4 characters long.", "error");
                return false;
            }
            if (phoneNumber.Length < 4)
            {
                ShowAlert("Error", "The phoneNumber must be at least 9 characters long.", "error");
                return false;
            }

            if (email.Length < 10 || !IsValidEmail(email))
            {
                ShowAlert("Error", "Please enter a valid email address.", "error");
                return false;
            }

            if (password != confirmPassword)
            {
                ShowAlert("Validation Error", "Passwords do not match.", "warning");
                return false;
            }

            if (CompanyExists(email))
            {
                ShowAlert("Validation Error", "The email is already used by another user or company.", "error");
                return false;
            }

            return true;
        }

        private bool IsValidEmail(string email)
        {
            var regex = new System.Text.RegularExpressions.Regex(@"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
            return regex.IsMatch(email);
        }

        private void ShowAlert(string title, string message, string icon)
        {
            alerta.Text = $"<script>Swal.fire('{title}', '{message}', '{icon}');</script>";
        }

        private void ShowSuccessAlertAndRedirect()
        {
            string script = @"
                <script>
                    Swal.fire({
                        title: 'Registration Successful',
                        text: 'The company has been registered successfully.',
                        icon: 'success',
                        timer: 3000,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.href = '02.login.aspx';
                    });
                </script>";
            alerta.Text = script;
        }

        private bool CompanyExists(string email)
        {
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Empresas WHERE Email = @Email UNION SELECT COUNT(*) FROM Usuarios WHERE Correo = @Email";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);

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

        private bool RegisterCompany(string companyName, string email, string phoneNumber, string encryptedPassword, string economicActivity, string country)
        {
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "INSERT INTO Empresas (Nombre, Email, Telefono, Contraseña, ActividadEconomica, Pais) " +
                               "VALUES (@Nombre, @Email, @Telefono, @Contraseña, @ActividadEconomica, @Pais)";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Nombre", companyName);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Telefono", phoneNumber);
                command.Parameters.AddWithValue("@Contraseña", encryptedPassword);
                command.Parameters.AddWithValue("@ActividadEconomica", economicActivity);
                command.Parameters.AddWithValue("@Pais", country);

                connection.Open();
                int result = command.ExecuteNonQuery();
                connection.Close();

                return result > 0;
            }
        }
    }
}