using DataAccessLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class PaisBLL
    {
        public static List<Pais> SelectAll()
        {
            return PaisDAL.SelectAll();
        }
    }
}
