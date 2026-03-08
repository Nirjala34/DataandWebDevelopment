<%@ Page Title="Top 3 Theaters by Occupancy" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="MovieOccupancy.aspx.cs" Inherits="Data_and_Web_Development_Final.MovieOccupancy" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
            .occ-page {
                color: #fff;
                padding-bottom: 3rem;
            }

            /* Page Title */
            .occ-title {
                font-size: 2rem;
                font-weight: 800;
                color: #fff;
                margin-bottom: 0.3rem;
            }

            .occ-subtitle {
                color: #b4b4d8;
                font-size: 0.95rem;
                margin-bottom: 2rem;
            }

            /* Search Card */
            .search-card {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(255, 255, 255, 0.08);
                border-radius: 14px;
                padding: 1.5rem 2rem;
                margin-bottom: 1.5rem;
            }

            .search-card label {
                font-weight: 600;
                font-size: 0.85rem;
                color: #ccc;
                text-transform: uppercase;
                letter-spacing: 1px;
                display: block;
                margin-bottom: 0.5rem;
            }

            .search-card .form-select {
                background: rgba(255, 255, 255, 0.05) !important;
                border: 1px solid rgba(255, 0, 127, 0.35) !important;
                color: #fff !important;
                border-radius: 8px !important;
                padding: 10px 14px !important;
                max-width: 380px;
            }

            /* Movie Info Card */
            .movie-info-card {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(255, 0, 127, 0.2);
                border-radius: 14px;
                padding: 1.4rem 1.8rem;
                display: flex;
                align-items: center;
                gap: 1.4rem;
                margin-bottom: 1.5rem;
            }

            .movie-badge-box {
                background-color: #ff007f;
                color: white;
                border-radius: 10px;
                width: 80px;
                height: 80px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                font-weight: 800;
                font-size: 0.7rem;
                letter-spacing: 2px;
                flex-shrink: 0;
                box-shadow: 0 4px 10px rgba(255, 0, 127, 0.3);
            }

            .movie-badge-box i {
                font-size: 1.4rem;
                margin-bottom: 3px;
            }

            .movie-info-title {
                font-size: 1.6rem;
                font-weight: 800;
                color: #fff;
                margin-bottom: 0.5rem;
            }

            .meta-badge {
                display: inline-block;
                padding: 0.3rem 0.8rem;
                background: rgba(114, 16, 241, 0.15);
                border: 1px solid rgba(114, 16, 241, 0.3);
                color: #d4aaff;
                border-radius: 50px;
                font-size: 0.8rem;
                font-weight: 600;
                margin-right: 0.4rem;
                margin-bottom: 0.4rem;
            }

            /* Chart Card */
            .chart-card {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(255, 255, 255, 0.08);
                border-radius: 14px;
                padding: 1.5rem 2rem;
                margin-bottom: 1.5rem;
            }

            .chart-card-title {
                font-size: 1rem;
                font-weight: 700;
                color: #ddd;
                margin-bottom: 1.2rem;
            }

            /* Table */
            .analysis-title {
                font-size: 1.1rem;
                font-weight: 700;
                color: #fff;
                margin: 2rem 0 1rem;
            }

            .occ-table-wrap {
                background: rgba(255, 255, 255, 0.03);
                border: 1px solid rgba(255, 255, 255, 0.08);
                border-radius: 14px;
                overflow: hidden;
            }

            .occ-table {
                width: 100%;
                border-collapse: collapse;
                color: #fff;
            }

            .occ-table th {
                text-transform: uppercase;
                font-size: 0.72rem;
                font-weight: 700;
                padding: 1rem 1.2rem;
                color: #ff007f;
                letter-spacing: 1.5px;
                text-align: left;
                border-bottom: 1px solid rgba(255, 255, 255, 0.08);
            }

            .occ-table td {
                padding: 0.9rem 1.2rem;
                font-size: 0.92rem;
                color: #ccc;
                border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            }

            .occ-table td.pct {
                font-weight: 700;
                color: #fff;
            }

            .occ-table tr:last-child td {
                border-bottom: none;
            }

            .occ-table tbody tr:hover td {
                color: #ff007f;
                background: rgba(255, 0, 127, 0.03);
            }

            /* Placeholder when no movie selected */
            .no-data-box {
                background: rgba(255, 255, 255, 0.02);
                border: 1px dashed rgba(255, 255, 255, 0.1);
                border-radius: 14px;
                padding: 3rem;
                text-align: center;
                color: #666;
            }

            .no-data-box i {
                font-size: 2.5rem;
                display: block;
                margin-bottom: 1rem;
            }
        </style>

        <div class="occ-page">

            <!-- Page Header -->
            <h1 class="occ-title">Top 3 Theaters by Occupancy</h1>
            <p class="occ-subtitle">Top 3 Theater-City-Hall performers by seat occupancy for any movie (paid tickets
                only)</p>

            <!-- Search Card -->
            <div class="search-card">
                <div class="row align-items-end">
                    <div class="col-md-6">
                        <label>Select Movie</label>
                        <asp:DropDownList ID="DropDownListMovie" runat="server" DataSourceID="SqlDataSourceMovies"
                            DataTextField="TITLE" DataValueField="MOVIEID" CssClass="form-select w-100"
                            AppendDataBoundItems="true" AutoPostBack="false" style="max-width: none !important;">
                            <asp:ListItem Value="-1">Select a Movie</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-auto">
                        <label class="form-label d-block" style="visibility: hidden;">&nbsp;</label>
                        <asp:Button ID="ButtonSearch" runat="server" Text="SEARCH" OnClick="ButtonSearch_Click"
                            CssClass="btn btn-primary px-4" />
                    </div>
                </div>
            </div>

            <asp:Panel ID="PanelResults" runat="server" Visible="false">


                <% if (PerformanceResults.Count> 0) {
                    foreach (var movie in PerformanceResults) { %>

                    <!-- Movie Info Card -->
                    <div class="movie-info-card">
                        <div class="movie-badge-box">
                            <i class="bi bi-film"></i>
                            MOVIE
                        </div>
                        <div>
                            <div class="movie-info-title">
                                <%= movie.Title %>
                            </div>
                            <div>
                                <span class="meta-badge">ID: <%= movie.MovieID %></span>
                                <span class="meta-badge">Genre: <%= movie.Genre %></span>
                                <span class="meta-badge">Language: <%= movie.Language %></span>
                                <span class="meta-badge">Duration: <%= movie.Duration %> min</span>
                                <span class="meta-badge">Release: <%= movie.ReleaseDate %></span>
                            </div>
                        </div>
                    </div>

                    <!-- Visual Performance: CSS Progress Bars -->
                    <div class="chart-card">
                        <div class="chart-card-title">Visual Performance Overview</div>
                        <% RenderProgressBars(movie); %>
                    </div>


                    <!-- Analysis Table -->
                    <h3 class="analysis-title">MovieTheaterCityHallOccupancy - Top 3 Analysis</h3>
                    <div class="occ-table-wrap">
                        <table class="occ-table">
                            <thead>
                                <tr>
                                    <th>Theater</th>
                                    <th>City</th>
                                    <th>Hall</th>
                                    <th>Occupancy (%)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach (System.Data.DataRow row in movie.TopPerformers.Rows) { %>
                                    <tr>
                                        <td>
                                            <%= row["THEATER"] %>
                                        </td>
                                        <td>
                                            <%= row["CITY"] %>
                                        </td>
                                        <td>
                                            <%= row["HALL"] %>
                                        </td>
                                        <td class="pct">
                                            <%= row["PCT"] %>%
                                        </td>
                                    </tr>
                                    <% } %>
                            </tbody>
                        </table>
                    </div>

                    <% } } else { %>
                        <div class="no-data-box">
                            <i class="bi bi-graph-up-arrow"></i>
                            Select a movie from the dropdown above to view its Top 3 occupancy analysis.
                        </div>
                        <% } %>

                            <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                ProviderName="System.Data.OracleClient"
                                SelectCommand="SELECT DISTINCT m.MOVIEID, m.TITLE FROM MOVIES m INNER JOIN SHOWTIMES s ON m.MOVIEID = s.MOVIEID ORDER BY m.TITLE">
                            </asp:SqlDataSource>
            </asp:Panel>
        </div>
    </asp:Content>