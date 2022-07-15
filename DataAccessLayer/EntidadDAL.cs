using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class EntidadDAL
    {
        private static SqlConnection _connection;
        private static SqlTransaction _transaction;

        protected static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
            }
        }

        protected static SqlConnection Connection
        {
            get { return _connection; }
            set { _connection = value; }
        }

        protected static SqlTransaction Transaction
        {
            get { return _transaction; }
            set { _transaction = value; }
        }

        public static void BeginTransaction()
        {
            int TimeOut = 36; // 36x250ms = 9 segundos.
            while (_connection != null)
            {
                Thread.Sleep(250);
                TimeOut--;

                if (TimeOut == 0)
                {
                    RollbackTransaction();
                }
            }

            _connection = new SqlConnection(ConnectionString);
            _connection.Open();
            _transaction = _connection.BeginTransaction();
        }

        public static void CommitTransaction()
        {
            _transaction.Commit();
            _transaction.Dispose();
            _connection.Dispose();
            _connection = null;
        }

        public static void RollbackTransaction()
        {
            _transaction.Rollback();
            _transaction.Dispose();
            _connection.Dispose();
            _connection = null;
        }
    }
}
