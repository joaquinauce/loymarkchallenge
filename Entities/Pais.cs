using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Pais
    {

        public int IdPais { get; set; }
        public string Nombre { get; set; }
        public string CodigoInternacional { get; set; }

        public Pais(int idPais, string codigoInternacional)
        {
            this.IdPais = idPais;
            this.CodigoInternacional = codigoInternacional; 
        }

        public Pais()
        {
        }
    }
}
