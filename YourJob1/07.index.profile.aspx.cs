using System;
using System.Data;
using System.Text;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace YourJob1
{
    public partial class _07_index_profile : Page
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
                LoadJobOffers();
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
                    string sql = "SELECT Nombre_Usuario, Apellido_Usuario FROM usuarios WHERE Id_Usuario = @UserId";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["userName"] = reader["Nombre_Usuario"].ToString();
                            Session["userLastName"] = reader["Apellido_Usuario"].ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                }
            }
        }

        private void LoadJobOffers()
        {
            string connStr = "server=127.0.0.1; database=yourjob_db; Uid=root; pwd=Info2024+-*/";
            DataTable dt = new DataTable();

            using (MySqlConnection conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "SELECT * FROM joboffers";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                    da.Fill(dt);

                    StringBuilder sb = new StringBuilder();
                    int index = 1;
                    foreach (DataRow row in dt.Rows)
                    {
                        sb.Append($@"
                            <div class='single-popular-post d-flex flex-row'>
                                <div class='thumb'>
                                    <img class='img-fluid' src='img/p{index}.png' alt='' style='width: 150px; height: auto;'>
                                    <a class='btns text-uppercase' href='#'>view job post</a>
                                </div>
                                <div class='details'>
                                    <a href='#'><h4>{row["PositionAppliedFor"]}</h4></a>
                                    <h6>{row["Location"]}</h6>
                                    <p>{row["OfferDetails"]}</p>
                                </div>
                            </div>");
                        index = (index % 6) + 1; // Cycle through 1 to 6
                    }

                    JobOffersLiteral.Text = sb.ToString();
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                }
            }
        }
    }
}
