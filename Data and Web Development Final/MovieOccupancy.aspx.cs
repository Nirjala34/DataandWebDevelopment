using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OracleClient;
using System.Web.UI.WebControls;

namespace Data_and_Web_Development_Final
{
    public partial class MovieOccupancy : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.DropDownList DropDownListMovie;
        public class MoviePerformance
        {
            public string MovieID { get; set; }
            public string Title { get; set; }
            public string Genre { get; set; }
            public string Language { get; set; }
            public string Duration { get; set; }
            public string ReleaseDate { get; set; }
            public string ChartLabels { get; set; }
            public string ChartData { get; set; }
            public DataTable TopPerformers { get; set; }
        }

        public List<MoviePerformance> PerformanceResults = new List<MoviePerformance>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack && DropDownListMovie.SelectedValue != "-1")
            {
                FetchOccupancyData(DropDownListMovie.SelectedValue);
            }
        }

        private void FetchOccupancyData(string movieId)
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OracleConnection conn = new OracleConnection(connString))
            {
                conn.Open();

                // 1. Fetch Movie Details with Metadata
                string movieSql = "SELECT TITLE, GENRE, LANGUAGE, DURATION, RELEASEDATE FROM MOVIES WHERE MOVIEID = :MID";
                OracleCommand mCmd = new OracleCommand(movieSql, conn);
                mCmd.Parameters.Add(new OracleParameter("MID", movieId));

                using (OracleDataReader reader = mCmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        MoviePerformance currentMovie = new MoviePerformance
                        {
                            MovieID = movieId,
                            Title = reader["TITLE"].ToString(),
                            Genre = reader["GENRE"].ToString(),
                            Language = reader["LANGUAGE"].ToString(),
                            Duration = reader["DURATION"].ToString(),
                            ReleaseDate = reader["RELEASEDATE"] != DBNull.Value ? Convert.ToDateTime(reader["RELEASEDATE"]).ToString("dd MMM yyyy") : "N/A"
                        };

                        // 2. Fetch Top 3 Occupancy
                        string occSql = @"
                            SELECT * FROM (
                                SELECT th.NAME || ' (' || h.NAME || ')' AS LABEL,
                                       th.NAME AS THEATER, th.CITY, h.NAME AS HALL,
                                       NVL(ROUND((COUNT(t.TICKETID) / NULLIF((COUNT(DISTINCT s.SHOWTIMEID) * MAX(h.CAPACITY)), 0)) * 100, 2), 0) AS PCT 
                                FROM ""SHOWTIMES"" s 
                                INNER JOIN ""HALLS"" h ON s.HALLID = h.HALLID 
                                INNER JOIN ""THEATERS"" th ON h.THEATERID = th.THEATERID 
                                LEFT JOIN ""BOOKINGS"" b ON s.SHOWTIMEID = b.SHOWTIMEID 
                                LEFT JOIN ""TICKETS"" t ON b.BOOKINGID = t.BOOKINGID AND UPPER(t.STATUS) = 'PAID' 
                                WHERE s.MOVIEID = :MID
                                GROUP BY th.NAME, h.NAME, th.CITY, h.HALLID 
                                ORDER BY PCT DESC
                            ) WHERE ROWNUM <= 3";

                        OracleCommand oCmd = new OracleCommand(occSql, conn);
                        oCmd.Parameters.Add(new OracleParameter("MID", movieId));

                        DataTable dt = new DataTable();
                        dt.Columns.Add("THEATER");
                        dt.Columns.Add("CITY");
                        dt.Columns.Add("HALL");
                        dt.Columns.Add("PCT");

                        List<string> lbls = new List<string>();
                        List<string> vals = new List<string>();

                        using (OracleDataReader reader2 = oCmd.ExecuteReader())
                        {
                            while (reader2.Read())
                            {
                                string label = reader2["LABEL"].ToString();
                                string pct = reader2["PCT"].ToString();
                                lbls.Add("\"" + label.Replace("\"", "\\\"") + "\"");
                                vals.Add(pct);
                                dt.Rows.Add(reader2["THEATER"], reader2["CITY"], reader2["HALL"], pct);
                            }
                        }
                        currentMovie.ChartLabels = "[" + string.Join(",", lbls) + "]";
                        currentMovie.ChartData = "[" + string.Join(",", vals) + "]";
                        currentMovie.TopPerformers = dt;
                        PerformanceResults.Add(currentMovie);
                    }
                }
            }
        }

        protected void RenderProgressBars(MoviePerformance movie)
        {
            string[] barColors = { "#ff007f", "#7210f1", "#00d2ff" };
            string[] rankLabels = { "#1", "#2", "#3" };

            double maxPct = 0;
            foreach (DataRow r in movie.TopPerformers.Rows)
            {
                double v = 0;
                double.TryParse(r["PCT"].ToString(), out v);
                if (v > maxPct) maxPct = v;
            }
            if (maxPct == 0) maxPct = 1;

            int i = 0;
            foreach (DataRow row in movie.TopPerformers.Rows)
            {
                double pct = 0;
                double.TryParse(row["PCT"].ToString(), out pct);
                string width = ((pct / maxPct) * 100).ToString("F1");
                string color = barColors[i % barColors.Length];
                string label = rankLabels[i % rankLabels.Length];
                string theater = row["THEATER"].ToString();
                string hall = row["HALL"].ToString();
                string pctVal = row["PCT"].ToString();

                Response.Write("<div style=\"margin-bottom:1.6rem;\">");
                Response.Write("<div style=\"display:flex;justify-content:space-between;align-items:center;margin-bottom:0.5rem;\">");
                Response.Write("<span style=\"color:#ddd;font-size:0.92rem;font-weight:600;\">" + label + " " + theater + " (" + hall + ")</span>");
                Response.Write("<span style=\"font-weight:700;color:" + color + ";font-size:0.95rem;\">" + pctVal + "%</span>");
                Response.Write("</div>");
                Response.Write("<div style=\"background:rgba(255,255,255,0.07);border-radius:50px;height:13px;overflow:hidden;\">");
                Response.Write("<div style=\"width:" + width + "%;height:100%;border-radius:50px;background:" + color + ";\"></div>");
                Response.Write("</div>");
                Response.Write("</div>");
                i++;
            }
        }
    }
}
