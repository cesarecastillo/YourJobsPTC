using MySql.Data.MySqlClient;
using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace YourJob1
{
    public partial class _06_forget_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterLogin3_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtcuenta.Text))
            {
                alerta3.Text = "<script>Swal.fire('Error', 'Please do not leave any fields blank.', 'error');</script>";
                return;
            }

            string userEmail = txtcuenta.Text;
            try
            {
                using (MySqlConnection conexion = new MySqlConnection("server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/"))
                {
                    conexion.Open();

                    // Check if email exists in 'usuarios' table
                    var cmdUser = new MySqlCommand("SELECT Nombre_Usuario, Password FROM usuarios WHERE Correo = @Email", conexion);
                    cmdUser.Parameters.AddWithValue("@Email", userEmail);
                    MySqlDataReader readerUser = cmdUser.ExecuteReader();

                    if (readerUser.Read())
                    {
                        string nombreUsuario = readerUser.GetString("Nombre_Usuario");
                        string encryptedPassword = readerUser.GetString("Password");
                        string decryptedPassword = DecryptString(encryptedPassword, initVector);
                        SendRecoveryEmail(userEmail, nombreUsuario, decryptedPassword);
                        readerUser.Close();
                        alerta3.Text = "<script>Swal.fire('Success', 'An email with your password has been sent.', 'success');</script>";
                        return;
                    }
                    readerUser.Close();

                    // Check if email exists in 'empresas' table
                    var cmdEmpresa = new MySqlCommand("SELECT Nombre, Contraseña FROM empresas WHERE Email = @Email", conexion);
                    cmdEmpresa.Parameters.AddWithValue("@Email", userEmail);
                    MySqlDataReader readerEmpresa = cmdEmpresa.ExecuteReader();

                    if (readerEmpresa.Read())
                    {
                        string nombreEmpresa = readerEmpresa.GetString("Nombre");
                        string encryptedPassword = readerEmpresa.GetString("Contraseña");
                        string decryptedPassword = DecryptString(encryptedPassword, initVector);
                        SendRecoveryEmail(userEmail, nombreEmpresa, decryptedPassword);
                        readerEmpresa.Close();
                        alerta3.Text = "<script>Swal.fire('Success', 'An email with your password has been sent.', 'success');</script>";
                        return;
                    }
                    readerEmpresa.Close();

                    alerta3.Text = "<script>Swal.fire('Error', 'The email is not registered.', 'error');</script>";
                }
            }
            catch (Exception ex)
            {
                alerta3.Text = $"<script>Swal.fire('Something went wrong', 'Error: {ex.Message}', 'error');</script>";
            }
        }

        private void SendRecoveryEmail(string email, string name, string password)
        {
            string fromEmail = "yourjobs2420@gmail.com";
            string fromPassword = "fdwrlhhdnhqznpmo"; // Consider using a secure method to store and retrieve passwords
            string subject = "Password Recovery";
            string body = $"Dear {name},<br><br>Thank you for choosing us and trusting us. We are pleased to have you as our customer, and we do not want you to experience any inconvenience. In this email, we are sending you the password you requested.<br><br>Password: {password}<br><br>Thank you very much for being our customer.";

            var fromAddress = new MailAddress(fromEmail, "YourJobs");
            var toAddress = new MailAddress(email, name);

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };

            using (var message = new MailMessage(fromAddress, toAddress)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
            {
                smtp.Send(message);
            }
        }

        private const string initVector = "myptcgroupyj2024";
        private const int keysize = 256;

        public static string DecryptString(string cipherText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            using (RijndaelManaged symmetricKey = new RijndaelManaged())
            {
                symmetricKey.Mode = CipherMode.CBC;
                using (ICryptoTransform decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes))
                {
                    using (MemoryStream memoryStream = new MemoryStream(cipherTextBytes))
                    {
                        using (CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read))
                        {
                            byte[] plainTextBytes = new byte[cipherTextBytes.Length];
                            int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
                            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
                        }
                    }
                }
            }
        }
    }
}
