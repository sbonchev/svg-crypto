using Dapper;
using System.Data.SqlClient;
using System.Data;
using Vsg.DataModels;


namespace Vsg.CryptoUTests.SqlDapper
{
    internal class BaseDapper<T> where T : CryptoBase
    {
        private protected string _connString;
        internal BaseDapper(string connString)
        {
            _connString = connString;
        }

        protected List<decimal> GetQueryResult(string sql, DynamicParameters parms)
        {
            using (var connection = new SqlConnection(_connString))
            {
                return connection.Query<decimal>(
                        sql,
                        parms,
                        commandType: CommandType.Text
                        ).ToList()!;
            }
        }

    }
}
