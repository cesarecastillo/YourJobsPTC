using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YourJob1
{
    public partial class _16_ContactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SubmitForm(object sender, EventArgs e)
        {
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string subject = Request.Form["subject"];
            string message = Request.Form["message"];

            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add("yourjobs2420@gmail.com"); // correo electrónico
                mail.From = new MailAddress(email);
                mail.Subject = subject;
                mail.Body = $"Name: {name}\nEmail: {email}\n\nMessage:\n{message}";

                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com"; // host SMTP de tu proveedor de correo
                smtp.Port = 587; // 587 para SMTP con TLS
                smtp.Credentials = new System.Net.NetworkCredential("yourjobs2420@gmail.com", "YourJobsPTC"); // Cambia esto por tus credenciales
                smtp.EnableSsl = true; // Usa SSL si es necesario

                smtp.Send(mail);
                Response.Redirect("thankyou.aspx"); 
            }
            catch (Exception ex)
            {
                // Maneja los errores
                Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
            }
        }
    }
}