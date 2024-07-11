using System;
using System.Data;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace YourJob1
{
    public partial class _12_paneladmin : System.Web.UI.Page
    {
        private const string initVector = "myptcgroupyj2024";
        private const int keysize = 256;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserData();
                LoadJobData();
            }
        }

        private void LoadUserData()
        {
            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT * FROM usuarios";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    UserGridView.DataSource = dt;
                    UserGridView.DataBind();
                }
                catch (Exception ex)
                {
                    ShowAlert("Error", "Failed to load user data.", "error");
                }
            }
        }

        private void LoadJobData()
        {
            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT * FROM joboffers";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    JobGridView.DataSource = dt;
                    JobGridView.DataBind();
                }
                catch (Exception ex)
                {
                    ShowAlert("Error", "Failed to load job data.", "error");
                }
            }
        }

        protected void UserGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            UserGridView.EditIndex = e.NewEditIndex;
            LoadUserData();
        }

        protected void UserGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = UserGridView.Rows[e.RowIndex];
            int userId = Convert.ToInt32(UserGridView.DataKeys[e.RowIndex].Values[0]);
            string nombre = (row.FindControl("txtNombre") as TextBox).Text;
            string apellido = (row.FindControl("txtApellido") as TextBox).Text;
            string genero = (row.FindControl("ddlGenero") as DropDownList).SelectedValue;
            string correo = (row.FindControl("txtCorreo") as TextBox).Text;
            int edad = Convert.ToInt32((row.FindControl("txtEdad") as TextBox).Text);

            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "UPDATE usuarios SET Nombre_Usuario=@Nombre, Apellido_Usuario=@Apellido, Genero=@Genero, Correo=@Correo, Edad=@Edad WHERE Id_Usuario=@Id";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Nombre", nombre);
                    cmd.Parameters.AddWithValue("@Apellido", apellido);
                    cmd.Parameters.AddWithValue("@Genero", genero);
                    cmd.Parameters.AddWithValue("@Correo", correo);
                    cmd.Parameters.AddWithValue("@Edad", edad);
                    cmd.Parameters.AddWithValue("@Id", userId);
                    cmd.ExecuteNonQuery();
                    ShowAlert("Success", "User updated successfully.", "success");
                }
                catch (Exception ex)
                {
                    ShowAlert("Error", "Failed to update user.", "error");
                }
            }

            UserGridView.EditIndex = -1;
            LoadUserData();
        }

        protected void UserGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            UserGridView.EditIndex = -1;
            LoadUserData();
        }

        protected void UserGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(UserGridView.DataKeys[e.RowIndex].Values[0]);

            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "DELETE FROM usuarios WHERE Id_Usuario=@Id";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Id", userId);
                    cmd.ExecuteNonQuery();
                    ShowAlert("Success", "User deleted successfully.", "success");
                }
                catch (Exception ex)
                {
                    ShowAlert("Error", "Failed to delete user.", "error");
                }
            }

            LoadUserData();
        }

        protected void JobGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            JobGridView.EditIndex = e.NewEditIndex;
            LoadJobData();
        }

        protected void JobGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = JobGridView.Rows[e.RowIndex];
            int jobId = Convert.ToInt32(JobGridView.DataKeys[e.RowIndex].Values[0]);
            string position = (row.FindControl("txtPosition") as TextBox).Text;
            int vacancies = Convert.ToInt32((row.FindControl("txtVacancies") as TextBox).Text);
            string experience = (row.FindControl("txtExperience") as TextBox).Text;
            string salary = (row.FindControl("txtSalary") as TextBox).Text;
            string location = (row.FindControl("txtLocation") as TextBox).Text;
            string details = (row.FindControl("txtDetails") as TextBox).Text;

            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "UPDATE joboffers SET PositionAppliedFor=@Position, PositionsVacancies=@Vacancies, ExperienceLevel=@Experience, Salary=@Salary, Location=@Location, OfferDetails=@Details WHERE Id=@Id";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Position", position);
                    cmd.Parameters.AddWithValue("@Vacancies", vacancies);
                    cmd.Parameters.AddWithValue("@Experience", experience);
                    cmd.Parameters.AddWithValue("@Salary", salary);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@Details", details);
                    cmd.Parameters.AddWithValue("@Id", jobId);
                    cmd.ExecuteNonQuery();
                    ShowAlert("Success", "Job updated successfully.", "success");
                }
                catch (Exception ex)
                {
                    ShowAlert("Error", "Failed to update job.", "error");
                }
            }

            JobGridView.EditIndex = -1;
            LoadJobData();
        }

        protected void JobGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            JobGridView.EditIndex = -1;
            LoadJobData();
        }

        protected void JobGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int jobId = Convert.ToInt32(JobGridView.DataKeys[e.RowIndex].Values[0]);

            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "DELETE FROM joboffers WHERE Id=@Id";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Id", jobId);
                    cmd.ExecuteNonQuery();
                    ShowAlert("Success", "Job deleted successfully.", "success");
                }
                catch (Exception ex)
                {
                    ShowAlert("Error", "Failed to delete job.", "error");
                }
            }

            LoadJobData();
        }

        protected void SaveUserButton_Click(object sender, EventArgs e)
        {
            string firstName = txtUserName.Text.Trim();
            string lastName = txtUserLastName.Text.Trim();
            string gender = ddlUserGender.SelectedValue;
            string email = txtUserEmail.Text.Trim();
            string password = txtUserPassword.Text.Trim();
            string confirmPassword = txtUserConfirmPassword.Text.Trim();
            string age = txtUserAge.Text.Trim();

            if (ValidateForm(firstName, lastName, gender, email, password, confirmPassword, age))
            {
                string encryptedPassword = EncryptString(password, initVector);

                if (!EmailExists(email))
                {
                    int userId = RegisterUser(firstName, lastName, gender, email, encryptedPassword, int.Parse(age));
                    if (userId > 0)
                    {
                        ShowAlert("Success", "The user has been registered successfully.", "success");
                        ClearForm();
                        LoadUserData();
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

        protected void SaveJobButton_Click(object sender, EventArgs e)
        {
            string position = txtJobTitle.Text.Trim();
            int vacancies = Convert.ToInt32(txtJobVacancies.Text.Trim());
            string experience = txtJobExperience.Text.Trim();
            string salary = txtJobSalary.Text.Trim();
            string location = txtJobLocation.Text.Trim();
            string details = txtJobDetails.Text.Trim();

            if (ValidateJobForm(position, vacancies, experience, salary, location, details))
            {
                int jobId = RegisterJob(position, vacancies, experience, salary, location, details);
                if (jobId > 0)
                {
                    ShowAlert("Success", "The job has been created successfully.", "success");
                    ClearJobForm();
                    LoadJobData();
                }
                else
                {
                    ShowAlert("Registration Error", "There was a problem creating the job. Please try again.", "error");
                }
            }
        }

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

        private bool ValidateJobForm(string position, int vacancies, string experience, string salary, string location, string details)
        {
            if (position.Length < 4)
            {
                ShowAlert("Error", "The job title must be at least 4 characters long.", "error");
                return false;
            }
            if (vacancies < 1)
            {
                ShowAlert("Error", "The number of vacancies must be at least 1.", "error");
                return false;
            }
            if (experience.Length < 4)
            {
                ShowAlert("Error", "The experience level must be at least 4 characters long.", "error");
                return false;
            }
            if (salary.Length < 1)
            {
                ShowAlert("Error", "The salary must be specified.", "error");
                return false;
            }
            if (location.Length < 4)
            {
                ShowAlert("Error", "The location must be at least 4 characters long.", "error");
                return false;
            }
            if (details.Length < 10)
            {
                ShowAlert("Error", "The job details must be at least 10 characters long.", "error");
                return false;
            }

            return true;
        }

        private bool IsValidEmail(string email)
        {
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, pattern);
        }

        private bool EmailExists(string email)
        {
            bool exists = false;
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";

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
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            int userId = 0;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "INSERT INTO usuarios (Nombre_Usuario, Apellido_Usuario, Genero, Correo, Password, Edad) " +
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

        private int RegisterJob(string position, int vacancies, string experience, string salary, string location, string details)
        {
            string connectionString = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024/*-";
            int jobId = 0;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                string query = "INSERT INTO joboffers (PositionAppliedFor, PositionsVacancies, ExperienceLevel, Salary, Location, OfferDetails) " +
                               "VALUES (@Position, @Vacancies, @Experience, @Salary, @Location, @Details); SELECT LAST_INSERT_ID();";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@Position", position);
                command.Parameters.AddWithValue("@Vacancies", vacancies);
                command.Parameters.AddWithValue("@Experience", experience);
                command.Parameters.AddWithValue("@Salary", salary);
                command.Parameters.AddWithValue("@Location", location);
                command.Parameters.AddWithValue("@Details", details);

                connection.Open();
                jobId = Convert.ToInt32(command.ExecuteScalar());
                connection.Close();
            }
            return jobId;
        }

        private void ShowAlert(string title, string message, string icon)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", $"Swal.fire('{title}', '{message}', '{icon}');", true);
        }

        private void ClearForm()
        {
            txtUserName.Text = string.Empty;
            txtUserLastName.Text = string.Empty;
            ddlUserGender.SelectedIndex = 0;
            txtUserEmail.Text = string.Empty;
            txtUserPassword.Text = string.Empty;
            txtUserConfirmPassword.Text = string.Empty;
            txtUserAge.Text = string.Empty;
        }

        private void ClearJobForm()
        {
            txtJobTitle.Text = string.Empty;
            txtJobVacancies.Text = string.Empty;
            txtJobExperience.Text = string.Empty;
            txtJobSalary.Text = string.Empty;
            txtJobLocation.Text = string.Empty;
            txtJobDetails.Text = string.Empty;
        }
    }
}
