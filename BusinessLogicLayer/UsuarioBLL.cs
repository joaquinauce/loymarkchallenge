using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Data;

namespace BusinessLogicLayer
{
    public class UsuarioBLL
    {
        public static int Save(Usuario usuario)
        {
            UsuarioDAL.BeginTransaction();
            try
            {
                if (usuario.IdUsuario == 0)
                {
                    if (UsuarioDAL.ExisteCorreoElectronico(usuario.Email))
                        throw new ExisteCorreoElectronico();

                   usuario.IdUsuario = UsuarioDAL.Save(usuario);
                }
                else
                {
                    if (UsuarioDAL.ExisteCorreoElectronicoExistente(usuario.IdUsuario, usuario.Email))
                        throw new ExisteCorreoElectronico();

                    UsuarioDAL.Update(usuario);
                }
            }
            catch (Exception exception)
            {
                UsuarioDAL.RollbackTransaction();
                throw (exception);
            }

            UsuarioDAL.CommitTransaction();
            return usuario.IdUsuario;
        }

        public static DataSet GetDataSet()
        {
            return UsuarioDAL.GetDataSet();
        }

        public static List<Usuario> SelectAll()
        {
            return UsuarioDAL.SelectAll();
        }

        public static Usuario SelectById(int Id)
        {
            return UsuarioDAL.SelectById(Id);
        }
        public static void Delete(int Id)
        {
            UsuarioDAL.BeginTransaction();
            try
            {
                UsuarioDAL.Delete(Id);
            }
            catch (Exception exception)
            {
                UsuarioDAL.RollbackTransaction();
                throw (exception);
            }
            UsuarioDAL.CommitTransaction();
        }

        public static DataSet GetDataSetEliminados()
        {
            return UsuarioDAL.GetDataSetEliminados();
        }
    }
}
