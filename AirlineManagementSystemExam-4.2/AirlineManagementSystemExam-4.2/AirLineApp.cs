using AirlineManagementSystemExam_4._2.Repository;
using AirlineManagementSystemExam_4._2.Service;
using AirlineManagementSystemExam_4._2.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2
{
    internal class AirLineApp
    {

        //Entry point
        static async Task Main(string[] args)
        {
            IFlightDetailsService flightDetailsService = new FlightDetailsServiceImplementation(new FlightDetailsRepositoryImplementation());

            while (true)
            {
                Console.Clear();
                Console.WriteLine("-----------------------------------------------------------------------------------");
                Console.WriteLine("  W E L C O M E   T O    A I R L I N E     M A N A G E M E N T     S Y S T E M   ");
                Console.WriteLine("-----------------------------------------------------------------------------------");

                string username = GetValidUsername();
                string password = GetValidPassword();

                ILoginService loginService = new LoginServiceImplementation(new LoginRepositoryImplementation());
                int roleId = await loginService.AuthenticationAsync(username, password);
                if (roleId >= 1)
                {
                    switch (roleId)
                    {
                        case 1:
                            AdminMenu(flightDetailsService);
                            break;
                        default:
                            Console.WriteLine("Invalid role: ACCESS DENIED!");
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("Invalid credentials");
                }

                Console.WriteLine("Press any key to continue...");
                Console.ReadKey();
            }
        }


        static string GetValidUsername()
        {
            while (true)
            {
                Console.Write("Enter Username:");
                string usernameString = Console.ReadLine();

                if (CustomValidation.IsValidUserName(usernameString))
                {
                    return usernameString;
                }
                else
                {
                    Console.WriteLine("Invalid Login, Try again");
                }
            }
        }

        static string GetValidPassword()
        {
            while (true)
            {
                Console.Write("Enter password:");
                string password = CustomValidation.ReadPassword();

                if (CustomValidation.IsValidPassword(password))
                {
                    return password;
                }
                else
                {
                    Console.WriteLine("Invalid Password, Try again");
                }
            }
        }



        #region Admin Menu
       
        static async Task AdminMenu(IFlightDetailsService service)
        {
            bool exit = false;

            while (!exit)
            {
                Console.Clear();
                Console.WriteLine("Welcome to Admin Panel");
                Console.WriteLine("1. Search Flight by ID");
                Console.WriteLine("2. Add Flight Details");
                Console.WriteLine("3. Update Flight Details");
                Console.WriteLine("4. Exit");
                Console.WriteLine("Enter your choice:");

                string choice = Console.ReadLine();
                switch (choice)
                {
                    case "1":
                        await GetFlightById(service);
                        break;
                    case "2":
                        await AddFlight(service);
                        break;
                    case "3":
                        await UpdateFlight(service);
                        break;
                    case "4":
                        exit = true;
                        break;
                    default:
                        Console.WriteLine("Wrong choice! Please enter again...");
                        break;
                }
            }
        }

        //Update Flight
        #region UpdateFlight
        private static async Task UpdateFlight(IFlightDetailsService service)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region AddFlight
        private static async Task AddFlight(IFlightDetailsService service)
        {
            // Step 1: Show Departure Table and ask for selection
            var departures = await service.GetDeparturesAsync();
            Console.WriteLine("Departures:");
            foreach (var dep in departures)
            {
                Console.WriteLine($"ID: {dep.DepartureId}, FlightId: {dep.FlightId}, AirportId: {dep.AirportId}, Date: {dep.DepartureDate}, Time: {dep.DepartureTime}");
            }
            Console.Write("Select DepartureId: ");
            int selectedDepartureId = int.Parse(Console.ReadLine());

            // Step 2: Show Arrival Table and ask for selection
            var arrivals = await service.GetArrivalsAsync();
            Console.WriteLine("Arrivals:");
            foreach (var arr in arrivals)
            {
                Console.WriteLine($"ID: {arr.ArrivalId}, FlightId: {arr.FlightId}, AirportId: {arr.AirportId}, Date: {arr.ArrivalDate}, Time: {arr.ArrivalTime}");
            }
            Console.Write("Select ArrivalId: ");
            int selectedArrivalId = int.Parse(Console.ReadLine());

            // Step 3: Store Flight Details
            await service.StoreFlightDetailsAsync(selectedDepartureId, selectedArrivalId);

            // Step 4: Show Flight Details based on selections
            var flightDetails = await service.GetFlightDetailsAsync(selectedDepartureId, selectedArrivalId);

            Console.WriteLine("Flight Details:");
            foreach (var detail in flightDetails)
            {
                Console.WriteLine($"Travel ID: {detail.Id},FlightId: {detail.FlightId}, \nDepAirport (ID): {detail.DepAirport}, \nDepAirport (Name): {detail.DepAirportName}, \nDepDate: {detail.DepDate}, \nDepTime: {detail.DepTime}, " +
                                  $"\nArrAirport (ID): {detail.ArrAirport}, \nArrAirport (Name): {detail.ArrAirportName}, \nArrDate: {detail.ArrDate}, \nArrTime: {detail.ArrTime}");
            }
            Console.ReadKey();
        }
        #endregion

        #region GetFlightById
        private static async Task GetFlightById(IFlightDetailsService service)
        {
            throw new NotImplementedException();
        }
        #endregion

        #endregion




    }
}
