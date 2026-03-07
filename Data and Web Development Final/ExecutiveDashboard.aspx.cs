using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Data_and_Web_Development_Final
{
    public partial class ExecutiveDashboard : System.Web.UI.Page
    {
        public string RevenueDisplay = "$0";
        public string TotalTickets = "0";
        public string UserTotal = "0";
        public string OccupancyRate = "0%";
        public DataTable TopTheaters = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(connString))
            {
                try
                {
                    conn.Open();

                    // 1. Total Users
                    OracleCommand cmdUsers = new OracleCommand("SELECT COUNT(*) FROM USERS", conn);
                    UserTotal = cmdUsers.ExecuteScalar()?.ToString() ?? "0";

                    // 2. Total Tickets
                    OracleCommand cmdTickets = new OracleCommand("SELECT COUNT(*) FROM TICKETS", conn);
                    TotalTickets = cmdTickets.ExecuteScalar()?.ToString() ?? "0";

                    // 3. Simulated Revenue (Based on tickets, assuming $10 per ticket for now)
                    long ticketCount = long.Parse(TotalTickets);
                    RevenueDisplay = "$" + (ticketCount * 10).ToString("N0");

                    // 4. Simulated Occupancy (Random for flavor or calculate if SHOWTIMES exists)
                    OccupancyRate = "87%";

                    // 5. Real Theaters for the table
                    OracleCommand cmdTheaters = new OracleCommand("SELECT NAME, THEATERID FROM THEATERS WHERE ROWNUM <= 5", conn);
                    OracleDataAdapter da = new OracleDataAdapter(cmdTheaters);
                    da.Fill(TopTheaters);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                }
            }
        }
    }
}
