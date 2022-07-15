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
    public class PaisDAL : EntidadDAL
    {
        private static Pais CargarObjeto(SqlDataReader dr)
        {
            Pais pais = new Pais();
            pais.IdPais = int.Parse(dr["id_pais"].ToString());
            pais.Nombre = dr["nombre"].ToString();
            pais.CodigoInternacional = dr["codigo_internacional"].ToString();

            return pais;
        }

        public static List<Pais> SelectAll()
        {
            List<Pais> TipoParam = new List<Pais>();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"sp_SelectAllPaises", con);
                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataReader dr = cmd.ExecuteReader())
                {

                    while (dr.Read())
                    {
                        TipoParam.Add(CargarObjeto(dr));
                    }
                }
            }
            return TipoParam;
        }

        public static Pais SelectById(int IdPais)
        {
            Pais pais = null;

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(@"sp_SelectPaisByID", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_pais", IdPais);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            pais = CargarObjeto(dr);
                        }
                    }
                }
            }
            return pais;
        }
    }
}
