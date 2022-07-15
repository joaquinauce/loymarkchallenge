using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Actividad
    {
        public int IdActividad { get; set; }
        public DateTime CreateDate { get; set; }
        public Usuario Usuario { get; set; }
        public string DescripcionActividad { get; set; }
    }
}
