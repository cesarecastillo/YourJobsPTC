using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using static System.Collections.Specialized.BitVector32;

namespace YourJob1
{
    public partial class _08_resume_form : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] == null)
                {
                    Response.Redirect("02.user.login.aspx");
                    return;
                }

                LoadUserData();
            }
        }

        private void LoadUserData()
        {
            int userId = Convert.ToInt32(Session["userId"]);
            string connectionString = "Server=127.0.0.1;Database=yourjob_db;User Id=root;Password=Info2024+-*/";
            string query = "SELECT * FROM resume WHERE user_id = @user_id";

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    conn.Open();
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtelfono.Text = reader["phone"].ToString();
                            txtnacionalidad.SelectedValue = reader["nationality"].ToString();
                            txtestadocivil.SelectedValue = reader["civil_status"].ToString();
                            txteducacion.SelectedValue = reader["education"].ToString();
                            txtcampoEstudio.SelectedValue = reader["field_of_study"].ToString();
                            txtsector.SelectedValue = reader["sector"].ToString();
                            txtexperiencia.Text = reader["work_experience"].ToString();
                            txthabilidades.Text = reader["skills"].ToString();
                            txtidiomas.Text = reader["mastered_languages"].ToString();
                        }
                    }
                }
            }
        }

        private bool IsValidInput()
        {
            if (string.IsNullOrEmpty(txtelfono.Text) || !System.Text.RegularExpressions.Regex.IsMatch(txtelfono.Text, @"^\d{8}$"))
            {
                alerta.Text = "<script>Swal.fire('Error', 'The phone number must contain exactly 8 digits.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txtnacionalidad.SelectedValue))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must select a nationality.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txtestadocivil.SelectedValue))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must select a civil status.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txteducacion.SelectedValue))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must select an education level.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txtcampoEstudio.SelectedValue))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must select a field of study.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txtsector.SelectedValue))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must select a sector.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txtexperiencia.Text))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must enter your work experience.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txthabilidades.Text))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must enter your skills.', 'error');</script>";
                return false;
            }

            if (string.IsNullOrEmpty(txtidiomas.Text))
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must enter the languages you are fluent in.', 'error');</script>";
                return false;
            }

            if (!txtimagen.HasFile)
            {
                alerta.Text = "<script>Swal.fire('Error', 'You must select an image.', 'error');</script>";
                return false;
            }

            string fileExtension = Path.GetExtension(txtimagen.FileName).ToLower();
            if (fileExtension != ".jpg" && fileExtension != ".jpeg")
            {
                alerta.Text = "<script>Swal.fire('Error', 'Only .jpg or .jpeg files are allowed.', 'error');</script>";
                return false;
            }

            return true;
        }

        private string SaveImage(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
            {
                try
                {
                    string filename = Path.GetFileName(fileUpload.FileName);
                    string folderPath = Server.MapPath("~/Images/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    string filepath = Path.Combine(folderPath, filename);
                    fileUpload.SaveAs(filepath);
                    return "~/Images/" + filename;
                }
                catch (Exception ex)
                {
                    alerta.Text = $"<script>Swal.fire('Error', 'Error saving the image: {ex.Message}', 'error');</script>";
                    return null;
                }
            }
            return null;
        }

        protected void btnEnviar_Click1(object sender, EventArgs e)
        {
            if (IsValidInput())
            {
                string phone = txtelfono.Text;
                string nationality = txtnacionalidad.SelectedValue;
                string civilStatus = txtestadocivil.SelectedValue;
                string education = txteducacion.SelectedValue;
                string fieldOfStudy = txtcampoEstudio.SelectedValue;
                string sector = txtsector.SelectedValue;
                string experience = txtexperiencia.Text;
                string skills = txthabilidades.Text;
                string languages = txtidiomas.Text;
                string image = SaveImage(txtimagen);

                if (image == null)
                {
                    return;
                }

                int userId = Convert.ToInt32(Session["userId"]);
                string connectionString = "Server=127.0.0.1;Database=yourjob_db;User Id=root;Password=Info2024+-*/";
                string query = "INSERT INTO resume (user_id, phone, nationality, civil_status, education, field_of_study, sector, work_experience, skills, mastered_languages, photo) " +
                               "VALUES (@user_id, @phone, @nationality, @civil_status, @education, @field_of_study, @sector, @work_experience, @skills, @mastered_languages, @photo) " +
                               "ON DUPLICATE KEY UPDATE phone=@phone, nationality=@nationality, civil_status=@civil_status, education=@education, field_of_study=@field_of_study, sector=@sector, work_experience=@work_experience, skills=@skills, mastered_languages=@mastered_languages, photo=@photo";

                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@user_id", userId);
                        cmd.Parameters.AddWithValue("@phone", phone);
                        cmd.Parameters.AddWithValue("@nationality", nationality);
                        cmd.Parameters.AddWithValue("@civil_status", civilStatus);
                        cmd.Parameters.AddWithValue("@education", education);
                        cmd.Parameters.AddWithValue("@field_of_study", fieldOfStudy);
                        cmd.Parameters.AddWithValue("@sector", sector);
                        cmd.Parameters.AddWithValue("@work_experience", experience);
                        cmd.Parameters.AddWithValue("@skills", skills);
                        cmd.Parameters.AddWithValue("@mastered_languages", languages);
                        cmd.Parameters.AddWithValue("@photo", image);

                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            alerta.Text = "<script>Swal.fire('Success', 'Resume submitted successfully.', 'success');</script>";
                        }
                        catch (Exception ex)
                        {
                            alerta.Text = $"<script>Swal.fire('Error', '{ex.Message}', 'error');</script>";
                        }
                    }
                }
            }
        }
    }
}
