using DataAccessLayer;
using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class ActividadBLL
    {
        public static void Save(TipoOperacion tipoOperacion, string mensaje, Usuario usuario, string nombreCompletoUsuario)
        {
            ActividadDAL.BeginTransaction();
            try
            {
                Actividad act = new Actividad();
                act.Usuario = usuario;
                act.DescripcionActividad = "[ " + tipoOperacion + " ] " + mensaje + " -> " + nombreCompletoUsuario;

                ActividadDAL.Save(act);
                ActividadDAL.CommitTransaction();
            }
            catch (Exception ex)
            {
                ActividadDAL.RollbackTransaction();
                throw (ex);
            }
        }

        public static DataSet GetDataSet()
        {
            return ActividadDAL.GetDataSet();
        }
    }
}
