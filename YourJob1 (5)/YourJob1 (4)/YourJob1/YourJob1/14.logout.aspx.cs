using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourJob1
{
    public partial class _14_logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear(); // Elimina todos los datos de la sesión.
            Session.Abandon(); // Termina la sesión del usuario.
            Response.Redirect("02.user.login.aspx"); // Redirige a la página de login.

        }
    }
}