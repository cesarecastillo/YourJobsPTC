using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web;

namespace YourJob1
{
    public partial class myprofileform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar si el usuario ha iniciado sesión
                if (Session["userId"] == null)
                {
                    Response.Redirect("02.user.login.aspx");
                    return;
                }

                // Obtener el Id_Usuario desde la sesión
                int userId = Convert.ToInt32(Session["userId"]);
                LoadUserProfile(userId);
            }
        }

        private void LoadUserProfile(int userId)
        {
            string connectionString = "server=localhost;database=yourjob_db;user=root;password=Info2024/*-;";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = @"
                        SELECT 
                            u.Nombre_Usuario, u.Apellido_Usuario, u.Correo, u.Edad, u.Genero, 
                            r.phone, r.nationality, r.civil_status, r.education, r.field_of_study, r.sector, r.work_experience, r.skills, r.mastered_languages, r.photo
                        FROM 
                            usuarios u
                        LEFT JOIN 
                            resume r ON u.Id_Usuario = r.user_id
                        WHERE 
                            u.Id_Usuario = @UserId";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                fullName.InnerText = reader["Nombre_Usuario"].ToString() + " " + reader["Apellido_Usuario"].ToString();
                                email.InnerText = reader["Correo"].ToString();
                                age.InnerText = "Edad: " + reader["Edad"].ToString();
                                gender.InnerText = "Género: " + reader["Genero"].ToString();
                                nationality.InnerText = "Nacionalidad: " + reader["nationality"].ToString();
                                civilStatus.InnerText = "Estado Civil: " + reader["civil_status"].ToString();
                                phone.InnerText = "Teléfono: " + reader["phone"].ToString();
                                // biography.InnerText = "Una breve biografía del usuario."; // Comentado por ahora

                                // Información educativa
                                educationDetails.InnerHtml = "<li>" + reader["education"].ToString() + " - " + reader["field_of_study"].ToString() + " - " + reader["sector"].ToString() + "</li>";

                                // Experiencia laboral
                                workExperienceDetails.InnerHtml = "<li>" + reader["work_experience"].ToString() + "</li>";

                                // Habilidades
                                skillsList.InnerHtml = "<li>" + reader["skills"].ToString().Replace(", ", "</li><li>") + "</li>";

                                // Idiomas dominados
                                masteredLanguages.InnerText = reader["mastered_languages"].ToString();

                                // Foto de perfil
                                if (reader["photo"] != DBNull.Value)
                                {
                                    byte[] photoBytes = (byte[])reader["photo"];
                                    string base64String = Convert.ToBase64String(photoBytes, 0, photoBytes.Length);
                                    profileImage.Src = "data:image/jpeg;base64," + base64String;
                                }
                                else
                                {
                                    profileImage.Src = "img/profile-placeholder.png";
                                }
                            }
                            else
                            {
                                errorMessage.InnerText = "No se encontró la información del usuario.";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    errorMessage.InnerText = "Error al cargar la información del perfil: " + ex.Message;
                }
            }
        }
    }
}
