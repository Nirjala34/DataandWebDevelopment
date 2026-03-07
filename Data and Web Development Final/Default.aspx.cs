using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Data_and_Web_Development_Final
{
    public partial class _Default : Page
    {
        public string UserCount = "0";
        public string TheaterCount = "0";
        public string MovieCount = "0";
        public string TicketCount = "0";
        public List<string> RecentActivities = new List<string>();

        public string GetDensityStyle()
        {
            var rnd = new Random();
            double randVal = rnd.NextDouble();
            string opacity = (randVal * 0.8 + 0.1).ToString("F2", System.Globalization.CultureInfo.InvariantCulture);
            return $"background: rgba(241, 16, 117, {opacity});";
        }

        public string GetDensityPercentage()
        {
            var rnd = new Random();
            return (rnd.NextDouble() * 90 + 10).ToString("F0");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FetchRealTimeStats();
                FetchRecentActivity();
            }
        }

        private void FetchRecentActivity()
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(connString))
            {
                try
                {
                    conn.Open();
                    // Fetch last 5 ticket IDs as activity
                    using (OracleCommand cmd = new OracleCommand("SELECT TICKETID, STATUS FROM (SELECT TICKETID, STATUS FROM TICKETS ORDER BY TICKETID DESC) WHERE ROWNUM <= 5", conn))
                    {
                        OracleDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            RecentActivities.Add($"Ticket #{reader["TICKETID"]} status updated to {reader["STATUS"]}.");
                        }
                    }
                    if(RecentActivities.Count == 0) {
                        RecentActivities.Add("System idle. No recent transactions recorded.");
                    }
                }
                catch { RecentActivities.Add("Telemetry link offline."); }
            }
        }

        private void FetchRealTimeStats()
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(connString))
            {
                try
                {
                    conn.Open();
                    
                    // Fetch User Count
                    using (OracleCommand cmd = new OracleCommand("SELECT COUNT(*) FROM USERS", conn))
                    {
                        UserCount = cmd.ExecuteScalar()?.ToString() ?? "0";
                    }

                    // Fetch Theater Count
                    using (OracleCommand cmd = new OracleCommand("SELECT COUNT(*) FROM THEATERS", conn))
                    {
                        TheaterCount = cmd.ExecuteScalar()?.ToString() ?? "0";
                    }

                    // Fetch Movie Count
                    using (OracleCommand cmd = new OracleCommand("SELECT COUNT(*) FROM MOVIES", conn))
                    {
                        MovieCount = cmd.ExecuteScalar()?.ToString() ?? "0";
                    }

                    // Fetch Ticket Count (for total screenings or bookings)
                    using (OracleCommand cmd = new OracleCommand("SELECT COUNT(*) FROM TICKETS", conn))
                    {
                        TicketCount = cmd.ExecuteScalar()?.ToString() ?? "0";
                    }
                }
                catch (Exception ex)
                {
                    // Fallback to defaults or show error if needed
                    System.Diagnostics.Debug.WriteLine("Error fetching stats: " + ex.Message);
                }
            }
        }
    }
}