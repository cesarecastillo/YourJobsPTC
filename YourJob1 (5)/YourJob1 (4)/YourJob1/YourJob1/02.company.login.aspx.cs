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
    public partial class _02_company_login : System.Web.UI.Page
    {
        private const string initVector = "myptcgroupyj2024";
        private const int keysize = 256;

        protected void Page_Load(object sender, EventArgs e)
        {
            string loginType = Request.QueryString["type"];
            if (!string.IsNullOrEmpty(loginType))
            {
                Session["LoginType"] = loginType;
            }

            if (!IsPostBack)
            {
                SetRegisterLink();
            }
        }

        protected void RegisterLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TxtContra1.Text) || string.IsNullOrEmpty(TxtUsuario.Text))
            {
                alerta1.Text = "<script>Swal.fire('OOPS', 'Do not leave blank spaces', 'error')</script>";
                return;
            }

            string password = EncryptString(TxtContra1.Text, initVector);
            string email = TxtUsuario.Text;

            datos1.valorGlobal = email;

            int userId = GetUserId(email, password);
            if (userId > 0)
            {
                Session["username"] = email;
                Session["userId"] = userId;
                ShowSuccessAlertAndRedirect("07.index.profile.aspx");
            }
            else if (IsAdmin(email, password))
            {
                Session["username"] = email;
                ShowSuccessAlertAndRedirect("11.admin.form.aspx");
            }
            else if (IsCompany(email, password))
            {
                Session["username"] = email;
                ShowSuccessAlertAndRedirect("05.inicioempresa.aspx");
            }
            else
            {
                alerta1.Text = "<script>Swal.fire('Something went wrong', 'Your username or password is incorrect', 'error')</script>";
                TxtContra1.Text = "";
                TxtUsuario.Text = "";
            }
        }

        private void ShowSuccessAlertAndRedirect(string redirectUrl)
        {
            string script = $@"
        <script>
            Swal.fire({{
                title: 'Success!',
                text: 'You have successfully logged in',
                icon: 'success',
                confirmButtonText: 'Accept'
            }}).then((result) => {{
                if (result.isConfirmed) {{
                    window.location.href = '{redirectUrl}';
                }}
            }});
        </script>";
            alerta1.Text = script;
        }

        private bool IsAdmin(string username, string password)
        {
            using (MySqlConnection connection = new MySqlConnection("server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/"))
            {
                string query = "SELECT COUNT(*) FROM administradores WHERE Usuario = @Usuario AND Password = @Password";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Usuario", username);
                command.Parameters.AddWithValue("@Password", password);

                connection.Open();
                int count = Convert.ToInt32(command.ExecuteScalar());
                return count > 0;
            }
        }

        private int GetUserId(string email, string password)
        {
            using (MySqlConnection connection = new MySqlConnection("Server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/"))
            {
                string query = "SELECT Id_Usuario FROM usuarios WHERE Correo = @Correo AND Password = @Password";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Correo", email);
                command.Parameters.AddWithValue("@Password", password);

                connection.Open();
                object result = command.ExecuteScalar();
                return result != null ? Convert.ToInt32(result) : -1;
            }
        }

        private bool IsCompany(string email, string password)
        {
            using (MySqlConnection connection = new MySqlConnection("server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/"))
            {
                string query = "SELECT COUNT(*) FROM empresas WHERE Email = @Email AND Contraseña = @Contraseña";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", email);
                command.Parameters.AddWithValue("@Contraseña", password);

                connection.Open();
                int count = Convert.ToInt32(command.ExecuteScalar());
                return count > 0;
            }
        }

        public static string EncryptString(string plainText, string passPhrase)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            using (RijndaelManaged symmetricKey = new RijndaelManaged())
            {
                symmetricKey.Mode = CipherMode.CBC;
                using (ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes))
                {
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
            }
        }

        private void SetRegisterLink()
        {
            string loginType = Session["LoginType"] as string;
            RegisterLink.NavigateUrl = "05.company.register.aspx";
        }
    }
}