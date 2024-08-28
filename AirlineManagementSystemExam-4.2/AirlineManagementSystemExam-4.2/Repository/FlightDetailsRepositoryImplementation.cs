using AirlineManagementSystemExam_4._2.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Repository
{
    public class FlightDetailsRepositoryImplementation:IFlightDetailsRepository
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["CsWin"].ConnectionString;


        #region ListallFlights
        #endregion


        //Search by ID
        #region GetFlightDetailById
        public async Task<FlightDetail> GetFlightDetailByIdAsync(int id)
        {
            FlightDetail flightDetail = null;
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (var command = new SqlCommand("sp_GetFlightDetailById", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Id", id);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            flightDetail = new FlightDetail
                            {
                                FlightId = reader.GetInt32(reader.GetOrdinal("FlightId")),
                                DepAirport = reader.GetInt32(reader.GetOrdinal("DepAirport")),
                                DepAirportName = reader.GetString(reader.GetOrdinal("DepAirportName")),
                                DepDate = reader.GetDateTime(reader.GetOrdinal("DepDate")),
                                DepTime = reader.GetTimeSpan(reader.GetOrdinal("DepTime")),
                                ArrAirport = reader.GetInt32(reader.GetOrdinal("ArrAirport")),
                                ArrAirportName = reader.GetString(reader.GetOrdinal("ArrAirportName")),
                                ArrDate = reader.GetDateTime(reader.GetOrdinal("ArrDate")),
                                ArrTime = reader.GetTimeSpan(reader.GetOrdinal("ArrTime")),
                                Id = reader.GetInt32(reader.GetOrdinal("Id")) // Assuming 'Id' is the primary key
                            };
                        }
                    }
                }
            }
            return flightDetail;
        }


        #endregion


        //Add Flight
        #region AddFlightDetail

        // Method to get departures
        public async Task<List<Departure>> GetDeparturesAsync()
        {
            var departures = new List<Departure>();
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (var command = new SqlCommand("sp_GetAllDepartures", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            departures.Add(new Departure
                            {
                                DepartureId = reader.GetInt32(0),
                                FlightId = reader.GetInt32(1),
                                AirportId = reader.GetInt32(2),
                                DepartureDate = reader.GetDateTime(3),
                                DepartureTime = reader.GetTimeSpan(4)
                            });
                        }
                    }
                }
            }
            return departures;
        }


        // Method to get arrivals
        public async Task<List<Arrival>> GetArrivalsAsync()
        {
            var arrivals = new List<Arrival>();
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (var command = new SqlCommand("sp_GetAllArrivals", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            arrivals.Add(new Arrival
                            {
                                ArrivalId = reader.GetInt32(0),
                                FlightId = reader.GetInt32(1),
                                AirportId = reader.GetInt32(2),
                                ArrivalDate = reader.GetDateTime(3),
                                ArrivalTime = reader.GetTimeSpan(4)
                            });
                        }
                    }
                }
            }
            return arrivals;
        }


        // Method to get flight details based on departure and arrival selections
        public async Task<List<FlightDetail>> GetFlightDetailsAsync(int departureId, int arrivalId)
        {
            var flightDetails = new List<FlightDetail>();
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (var command = new SqlCommand("sp_GetFlightDetails", connection))
                {
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@DepartureId", departureId);
                    command.Parameters.AddWithValue("@ArrivalId", arrivalId);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            try
                            {
                                flightDetails.Add(new FlightDetail
                                {
                                    FlightId = reader.GetInt32(reader.GetOrdinal("FlightId")),
                                    DepAirport = reader.GetInt32(reader.GetOrdinal("DepAirport")),
                                    DepAirportName = reader.GetString(reader.GetOrdinal("DepAirportName")),
                                    DepDate = reader.GetDateTime(reader.GetOrdinal("DepDate")),
                                    DepTime = reader.GetTimeSpan(reader.GetOrdinal("DepTime")),
                                    ArrAirport = reader.GetInt32(reader.GetOrdinal("ArrAirport")),
                                    ArrAirportName = reader.GetString(reader.GetOrdinal("ArrAirportName")),
                                    ArrDate = reader.GetDateTime(reader.GetOrdinal("ArrDate")),
                                    ArrTime = reader.GetTimeSpan(reader.GetOrdinal("ArrTime"))
                                });
                            }
                            catch (InvalidCastException ex)
                            {
                                Console.WriteLine($"Casting error: {ex.Message}");
                            }
                        }
                    }
                }
            }
            return flightDetails;
        }
        //storing
        public async Task StoreFlightDetailsAsync(int departureId, int arrivalId)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    using (var command = new SqlCommand("sp_GetAndStoreFlightDetails", connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@DepartureId", departureId);
                        command.Parameters.AddWithValue("@ArrivalId", arrivalId);

                        // Execute the stored procedure
                        await command.ExecuteNonQueryAsync();
                    }
                }
            }
            catch (SqlException ex)
            {
                // Handle SQL specific exceptions
                Console.WriteLine($"Database error: {ex.Message}");
                // Log the exception if needed
                throw; // Re-throw to let the service layer handle it
            }
            catch (Exception ex)
            {
                // Handle general exceptions
                Console.WriteLine($"An error occurred: {ex.Message}");
                // Log the exception if needed
                throw; // Re-throw to let the service layer handle it
            }
        }





        #endregion


        //Update Flight
        #region UpdateFlightDetail
        /*public async Task UpdateFlightDetailAsync(FlightDetail flightDetail)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (var command = new SqlCommand("sp_UpdateFlightDetail", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FlightDetailId", flightDetail.FlightId);
                    command.Parameters.AddWithValue("@DepartureId", flightDetail.DepartureId);
                    command.Parameters.AddWithValue("@ArrivalId", flightDetail.ArrivalId);

                    // Execute the stored procedure
                    await command.ExecuteNonQueryAsync();
                }
            }
        }
        */
        #endregion


    }
}
