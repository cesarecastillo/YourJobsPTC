using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YourJob1
{
    public class UsuarioCurriculum
    {
        public int Id_Usuario { get; set; }
        public string Nombre_Usuario { get; set; }
        public string Apellido_Usuario { get; set; }
        public string Genero { get; set; }
        public string Correo { get; set; }
        public int Edad { get; set; }

        public string Phone { get; set; }
        public string Nationality { get; set; }
        public string Civil_Status { get; set; }
        public string Education { get; set; }
        public string Field_Of_Study { get; set; }
        public string Sector { get; set; }
        public string Work_Experience { get; set; }
        public string Skills { get; set; }
        public string Mastered_Languages { get; set; }
        public byte[] Photo { get; set; }
    }
}