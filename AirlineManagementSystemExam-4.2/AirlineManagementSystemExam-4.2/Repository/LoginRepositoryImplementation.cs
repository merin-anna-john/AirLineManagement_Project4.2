using SqlServerConnectionLibrary;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Repository
{
    public class LoginRepositoryImplementation:ILoginRepository
    {
        //ConnectionString
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["CsWin"].ConnectionString;

        public async Task<int> GetRoleIdAsync(string userName, string password)
        {
            int roleId = 0;
            //SqlConnection
            using (SqlConnection conn = SqlServerConnectionManager.OpenConnection(_connectionString))
            {
                //SqlCommand 
                //Instead of giving the query we are using sp_GetUserNamePassword
                using (SqlCommand command = new SqlCommand("sp_GetUserNamePassword", conn))
                {
                    //CommandType
                    command.CommandType = CommandType.StoredProcedure;

                    //InputParameters---UserName same as in database
                    command.Parameters.AddWithValue("@UserName", userName);
                    command.Parameters.AddWithValue("@Password", password);

                    //OutputParameter 
                    //executing from sql

                    SqlParameter roleIdParam = new SqlParameter("@RoleId", SqlDbType.Int)
                    {
                        Direction = ParameterDirection.Output
                    };

                    command.Parameters.Add(roleIdParam);

                    await command.ExecuteNonQueryAsync();

                    //Checking if the o/p paramter is DBNull before conversion
                    if (command.Parameters["@RoleId"].Value != DBNull.Value)
                    //or if (roleIdParam.Value!=DBNull.Value)
                    {
                        roleId = Convert.ToInt32(roleIdParam.Value);
                    }
                    return roleId;
                }
            }


        }

    }
}
