using AirlineManagementSystemExam_4._2.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Service
{
    public class LoginServiceImplementation:ILoginService
    {
        //field
        private readonly ILoginRepository _loginRepository;

        //Constructor Injection
        public LoginServiceImplementation(ILoginRepository loginRepository)
        {
            _loginRepository = loginRepository;
        }
        public async Task<int> AuthenticationAsync(string userName, string password)
        {
            //Check business rules for validation
            return await _loginRepository.GetRoleIdAsync(userName, password);
        }
    }
}
