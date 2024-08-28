using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Service
{
    public interface ILoginService
    {
        //Authentication
        Task<int> AuthenticationAsync(string userName, string password);
    }
}
