using AirlineManagementSystemExam_4._2.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Service
{
    public interface IFlightDetailsService
    {

        Task<FlightDetail> GetFlightDetailByIdAsync(int id);

        Task<List<Departure>> GetDeparturesAsync();
        Task<List<Arrival>> GetArrivalsAsync();
        Task<List<FlightDetail>> GetFlightDetailsAsync(int departureId, int arrivalId);

        //storing
        Task StoreFlightDetailsAsync(int departureId, int arrivalId);

        //Task UpdateFlightDetailAsync(FlightDetail flightDetail);
    }
}
