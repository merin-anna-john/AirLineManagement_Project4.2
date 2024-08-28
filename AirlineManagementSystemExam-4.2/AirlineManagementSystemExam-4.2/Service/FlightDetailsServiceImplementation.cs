using AirlineManagementSystemExam_4._2.Model;
using AirlineManagementSystemExam_4._2.Repository;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Service
{
    public class FlightDetailsServiceImplementation:IFlightDetailsService
    {
        private readonly IFlightDetailsRepository _flightDetailsRepository;
        public FlightDetailsServiceImplementation(IFlightDetailsRepository flightDetailsRepository)
        {
            _flightDetailsRepository=flightDetailsRepository;
        }

        #region GetFlightDetailById
        public async Task<FlightDetail> GetFlightDetailByIdAsync(int id)
        {
            try
            {
                return await _flightDetailsRepository.GetFlightDetailByIdAsync(id);
            }
            catch (SqlException ex)
            {
                Console.WriteLine($"Database error: {ex.Message}");
                return null; // Indicate failure
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
                return null; // Indicate failure
            }
        }


        #endregion


        #region AddFlightDetail
        public async Task<List<Departure>> GetDeparturesAsync()
        {
            try
            {
                // Attempt to fetch the departures from the repository
                return await _flightDetailsRepository.GetDeparturesAsync();
            }
            catch (SqlException ex)
            {
                // Handle SQL specific exceptions
                Console.WriteLine($"Database error: {ex.Message}");
                // Log the exception if needed
                return new List<Departure>(); // Return an empty list or handle as per your requirement
            }
            catch (Exception ex)
            {
                // Handle general exceptions
                Console.WriteLine($"An error occurred: {ex.Message}");
                // Log the exception if needed
                return new List<Departure>(); // Return an empty list or handle as per your requirement
            }
        }


        public async Task<List<Arrival>> GetArrivalsAsync()
        {
            try
            {
                // Attempt to fetch the arrivals from the repository
                return await _flightDetailsRepository.GetArrivalsAsync();
            }
            catch (SqlException ex)
            {
                // Handle SQL specific exceptions
                Console.WriteLine($"Database error: {ex.Message}");
                // Log the exception if needed
                return new List<Arrival>(); // Return an empty list or handle as per your requirement
            }
            catch (Exception ex)
            {
                // Handle general exceptions
                Console.WriteLine($"An error occurred: {ex.Message}");
                // Log the exception if needed
                return new List<Arrival>(); // Return an empty list or handle as per your requirement
            }
        }


        public async Task<List<FlightDetail>> GetFlightDetailsAsync(int departureId, int arrivalId)
        {
            try
            {
                // Attempt to fetch the flight details from the repository
                return await _flightDetailsRepository.GetFlightDetailsAsync(departureId, arrivalId);
            }
            catch (SqlException ex)
            {
                // Handle SQL specific exceptions
                Console.WriteLine($"Database error: {ex.Message}");
                // Log the exception if needed
                return new List<FlightDetail>(); // Return an empty list or handle as per your requirement
            }
            catch (Exception ex)
            {
                // Handle general exceptions
                Console.WriteLine($"An error occurred: {ex.Message}");
                // Log the exception if needed
                return new List<FlightDetail>(); // Return an empty list or handle as per your requirement
            }
        }

        public async Task StoreFlightDetailsAsync(int departureId, int arrivalId)
        {
            try
            {
                await _flightDetailsRepository.StoreFlightDetailsAsync(departureId, arrivalId);
            }
            catch (SqlException ex)
            {
                // Handle SQL specific exceptions
                Console.WriteLine($"Database error: {ex.Message}");
                // Log the exception if needed
            }
            catch (Exception ex)
            {
                // Handle general exceptions
                Console.WriteLine($"An error occurred: {ex.Message}");
                // Log the exception if needed
            }
        }


        #endregion


        #region UpdateFlightDetail
        /*public async Task UpdateFlightDetailAsync(FlightDetail flightDetail)
        {
            try
            {
            await _flightDetailsRepository.UpdateFlightDetailAsync(flightDetail);
            }
            catch (SqlException ex)
            {
                Console.WriteLine($"Database error: {ex.Message}");
                Console.ReadKey();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
                Console.ReadKey();
            }
        }
        */
        #endregion


    }
}
