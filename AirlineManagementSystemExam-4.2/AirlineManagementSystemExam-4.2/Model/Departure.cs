using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AirlineManagementSystemExam_4._2.Model
{
    public class Departure
    {
        public int DepartureId { get; set; }
        public int FlightId { get; set; }
        public int AirportId { get; set; }
        public DateTime DepartureDate { get; set; }
        public TimeSpan DepartureTime { get; set; }
    }
}
