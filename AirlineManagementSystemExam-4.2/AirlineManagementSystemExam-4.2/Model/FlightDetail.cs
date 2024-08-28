using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Model
{
    public class FlightDetail
    {
        public int FlightId { get; set; }
        public int DepAirport { get; set; }        // Departure Airport ID
        public string DepAirportName { get; set; } // Departure Airport Name
        public DateTime DepDate { get; set; }
        public TimeSpan DepTime { get; set; }
        public int ArrAirport { get; set; }        // Arrival Airport ID
        public string ArrAirportName { get; set; } // Arrival Airport Name
        public DateTime ArrDate { get; set; }
        public TimeSpan ArrTime { get; set; }
        public int Id { get; set; }//Autogenerate for travel id
    }
}
