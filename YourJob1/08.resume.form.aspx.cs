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
                int userId = Convert.ToInt32(Session["userId"]);
                LoadResumeData(userId);
            }
        }

        private bool IsValidInput()
        {
            // Validar que el teléfono contenga exactamente 8 dígitos
            if (!System.Text.RegularExpressions.Regex.IsMatch(txtelfono.Text, @"^\d{8}$"))
            {
                alerta.Text = "<script>Swal.fire('Error', 'El teléfono debe contener exactamente 8 dígitos.', 'error');</script>";
                return false;
            }

            // Validar que se haya seleccionado una imagen
            if (!txtimagen.HasFile)
            {
                alerta.Text = "<script>Swal.fire('Error', 'Debe seleccionar una imagen.', 'error');</script>";
                return false;
            }

            // Validar que la imagen tenga una extensión válida
            string fileExtension = Path.GetExtension(txtimagen.FileName).ToLower();
            if (fileExtension != ".jpg" && fileExtension != ".jpeg")
            {
                alerta.Text = "<script>Swal.fire('Error', 'Solo se permiten archivos .jpg o .jpeg.', 'error');</script>";
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
                    alerta.Text = $"<script>Swal.fire('Error', 'Error al guardar la imagen: {ex.Message}', 'error');</script>";
                    return null;
                }
            }
            return null;
        }

        protected void btnEnviar_Click1(object sender, EventArgs e)
        {
            if (IsValidInput())
            {
                string telefono = txtelfono.Text;
                string experiencia = txtexperiencia.Text;
                string educacion = txteducacion.SelectedValue;
                string campoEstudio = txtcampoEstudio.SelectedValue;
                string sector = txtsector.SelectedValue;
                string habilidades = txthabilidades.Text;
                string nacionalidad = txtnacionalidad.SelectedValue;
                string estadoCivil = txtestadocivil.SelectedValue;
                string imagen = SaveImage(txtimagen);

                if (imagen == null)
                {
                    return; // Error al guardar la imagen, detener la ejecución
                }

                int userId = Convert.ToInt32(Session["userId"]);

                string connectionString = "Server=127.0.0.1;Database=yourjob_db;User Id=root;Password=Info2024+-*/";

                string query = "INSERT INTO resume (user_id, phone, work_experience, education, field_of_study, sector, skills, nationality, civil_status, photo) " +
                               "VALUES (@user_id, @phone, @work_experience, @education, @field_of_study, @sector, @skills, @nationality, @civil_status, @photo) " +
                               "ON DUPLICATE KEY UPDATE phone=@phone, work_experience=@work_experience, education=@education, field_of_study=@field_of_study, sector=@sector, skills=@skills, nationality=@nationality, civil_status=@civil_status, photo=@photo";

                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@user_id", userId);
                        cmd.Parameters.AddWithValue("@phone", telefono);
                        cmd.Parameters.AddWithValue("@work_experience", experiencia);
                        cmd.Parameters.AddWithValue("@education", educacion);
                        cmd.Parameters.AddWithValue("@field_of_study", campoEstudio);
                        cmd.Parameters.AddWithValue("@sector", sector);
                        cmd.Parameters.AddWithValue("@skills", habilidades);
                        cmd.Parameters.AddWithValue("@nationality", nacionalidad);
                        cmd.Parameters.AddWithValue("@civil_status", estadoCivil);
                        cmd.Parameters.AddWithValue("@photo", imagen);

                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            alerta.Text = "<script>Swal.fire('Éxito', 'Currículum enviado con éxito.', 'success');</script>";
                            Response.Redirect ("07.index.profile.aspx");
                        }
                        catch (Exception ex)
                        {
                            alerta.Text = $"<script>Swal.fire('Error', '{ex.Message}', 'error');</script>";
                        }
                    }
                }
            }
        }

        private void LoadResumeData(int userId)
        {
            string connectionString = "Server=127.0.0.1;Database=yourjob_db;User Id=root;Password=Info2024+-*/";

            string query = "SELECT * FROM resume WHERE user_id = @user_id";

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@user_id", userId);

                    try
                    {
                        conn.Open();
                        MySqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            txtelfono.Text = reader["phone"].ToString();
                            txtexperiencia.Text = reader["work_experience"].ToString();
                            txteducacion.SelectedValue = reader["education"].ToString();
                            txtcampoEstudio.SelectedValue = reader["field_of_study"].ToString();
                            txtsector.SelectedValue = reader["sector"].ToString();
                            txthabilidades.Text = reader["skills"].ToString();
                            txtnacionalidad.SelectedValue = reader["nationality"].ToString();
                            txtestadocivil.SelectedValue = reader["civil_status"].ToString();
                            // La imagen no se puede cargar directamente, ya que es un FileUpload. Se podría mostrar una vista previa de la imagen en otro control.
                        }
                    }
                    catch (Exception ex)
                    {
                        alerta.Text = $"<script>Swal.fire('Error', 'Error al cargar datos del currículum: {ex.Message}', 'error');</script>";
                    }
                }
            }
        }
    }
}
