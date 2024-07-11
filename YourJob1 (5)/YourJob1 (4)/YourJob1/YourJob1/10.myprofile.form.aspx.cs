using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI;

namespace YourJob1
{
    public partial class myprofileform : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Redirect("02.user.login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/";
            int userId = Convert.ToInt32(Session["userId"]);

            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = @"
                        SELECT 
                            u.Nombre_Usuario, u.Apellido_Usuario, u.Correo, u.Edad, u.Genero, 
                            r.phone, r.nationality, r.civil_status, r.education, r.field_of_study, 
                            r.sector, r.work_experience, r.skills, r.mastered_languages, r.photo
                        FROM usuarios u
                        JOIN resume r ON u.Id_Usuario = r.user_id
                        WHERE u.Id_Usuario = @UserId";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            fullName.InnerText = $"{reader["Nombre_Usuario"]} {reader["Apellido_Usuario"]}";
                            email.InnerText = reader["Correo"].ToString();
                            age.InnerText = $"Edad: {reader["Edad"]}";
                            gender.InnerText = $"Género: {reader["Genero"]}";
                            nationality.InnerText = $"Nacionalidad: {reader["nationality"]}";
                            civilStatus.InnerText = $"Estado Civil: {reader["civil_status"]}";
                            phone.InnerText = $"Teléfono: {reader["phone"]}";
                            educationDetails.InnerHtml = $"<li>{reader["education"]} - {reader["field_of_study"]}</li>";
                            workExperienceDetails.InnerHtml = $"<li>{reader["work_experience"]}</li>";
                            skillsList.InnerHtml = $"<li>{reader["skills"]}</li>";
                            masteredLanguages.InnerText = reader["mastered_languages"].ToString();
                            profileImage.Src = "data:image/jpeg;base64," + Convert.ToBase64String((byte[])reader["photo"]);
                        }
                        else
                        {
                            // Mostrar un mensaje de error si no se encuentran los datos del usuario
                            errorMessage.InnerText = "No se encontraron los datos del usuario.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de excepciones y mostrar un mensaje de error
                    errorMessage.InnerText = "Error al cargar el perfil: " + ex.Message;
                }
            }
        }
    }
}
