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
    public class UsuarioDAL : EntidadDAL
    {
        private static Usuario CargarObjeto(SqlDataReader dr)
        {
            Usuario User = new Usuario();
            User.IdUsuario = int.Parse(dr["id_usuario"].ToString());
            User.Nombre = dr["nombre"].ToString();
            User.Apellido = dr["apellido"].ToString();
            User.Email = dr["email"].ToString();
            User.FechaNacimiento = DateTime.Parse(dr["fecha_nacimiento"].ToString());
            User.Telefono = dr["telefono"].ToString();
            User.Pais = PaisDAL.SelectById(int.Parse(dr["id_pais"].ToString()));
            User.RecibeInformacion = bool.Parse(dr["recibe_informacion"].ToString());
            
            return User;
        }

        public static int Save(Usuario usuario)
        {
            int IdUsuario = 0;
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                try
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("sp_SaveUsuario", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombre", usuario.Nombre);
                    cmd.Parameters.AddWithValue("@apellido", usuario.Apellido);
                    cmd.Parameters.AddWithValue("@email", usuario.Email);
                    cmd.Parameters.AddWithValue("@fecha_nacimiento", usuario.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@telefono", usuario.Telefono);
                    cmd.Parameters.AddWithValue("@id_pais", usuario.Pais.IdPais);
                    cmd.Parameters.AddWithValue("@pais", usuario.Pais.CodigoInternacional);
                    cmd.Parameters.AddWithValue("@recibe_informacion", usuario.RecibeInformacion);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                            IdUsuario = int.Parse(dr["id_usuario"].ToString());
                    }

                }
                catch (Exception ex)
                {
                    throw (ex);
                }
            }
            return IdUsuario;
        }

        public static DataSet GetDataSetEliminados()
        {
            DataSet usuarios = new DataSet();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"sp_selectAllUsuariosEliminados", con);
                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(usuarios);
                }
            }
            return usuarios;
        }

        public static bool ExisteCorreoElectronicoExistente(int IdUsuario, string email)
        {
            bool existe;

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(@"sp_ExisteEmailExistente", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_usuario", IdUsuario);
                    cmd.Parameters.AddWithValue("@email", email);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        existe = (dr.HasRows);
                    }
                }
            }
            return existe;
        }

        public static DataSet GetDataSet()
        {
            DataSet usuarios = new DataSet();
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"sp_selectAllUsuarios", con);
                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(usuarios);
                }
            }
            return usuarios;
        }

        public static List<Usuario> SelectAll()
        {
            List<Usuario> usuarios = new List<Usuario>();

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"sp_selectAllUsuarios", con);
                cmd.CommandType = CommandType.StoredProcedure;
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while (dr.Read())
                        {
                            usuarios.Add(CargarObjeto(dr));
                        }
                    }
                }
            }
            return usuarios;
        }

        public static bool ExisteCorreoElectronico(string email)
        {
            bool existe;

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(@"sp_ExisteEmail", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        existe = (dr.HasRows);
                    }
                }
            }
            return existe;
        }

        public static void Update(Usuario usuario)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_UpdateUsuario", con);
                    cmd.CommandType = CommandType.StoredProcedure;
   
                    cmd.Parameters.AddWithValue("@id_usuario", usuario.IdUsuario);
                    cmd.Parameters.AddWithValue("@nombre", usuario.Nombre);
                    cmd.Parameters.AddWithValue("@apellido", usuario.Apellido);
                    cmd.Parameters.AddWithValue("@email", usuario.Email);
                    cmd.Parameters.AddWithValue("@fecha_nacimiento", usuario.FechaNacimiento);
                    cmd.Parameters.AddWithValue("@telefono", usuario.Telefono);
                    cmd.Parameters.AddWithValue("@id_pais", usuario.Pais.IdPais);
                    cmd.Parameters.AddWithValue("@pais", usuario.Pais.CodigoInternacional);
                    cmd.Parameters.AddWithValue("@recibe_informacion", usuario.RecibeInformacion);

                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw (ex);
                }
            }
        }

        public static Usuario SelectById(int Id)
        {
            Usuario usuario = null;

            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(@"sp_SelectUsuarioByID", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_usuario", Id);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            usuario = CargarObjeto(dr);
                        }
                    }
                }
            }
            return usuario;
        }

        public static void Delete(int id)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(@"sp_EliminarUsuario", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@IdUsuario", id);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
