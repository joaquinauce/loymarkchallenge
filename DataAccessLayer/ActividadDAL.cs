using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class ActividadDAL : EntidadDAL
    {
        public static void Save(Actividad act)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("sp_SaveActividad", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@create_date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@id_usuario", act.Usuario.IdUsuario);
                    cmd.Parameters.AddWithValue("@actividad", act.DescripcionActividad);


                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw (ex);
                }
            }
        }

        public static DataSet GetDataSet()
        {
            DataSet actividades = new DataSet();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"sp_GetActividades", con);
                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(actividades);
                }
            }
            return actividades;
        }
    }
}
