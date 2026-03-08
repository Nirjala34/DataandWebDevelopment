<%@ Page Title="Theater Movies" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="TheaterMovie.aspx.cs" Inherits="Data_and_Web_Development_Final.TheaterMovie" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-map me-2" style="color: var(--primary-accent);"></i>Theater Movies & Showtimes
            </h2>
            <div class="card glass-card mb-4">
                <style>
                    .filter-label {
                        font-size: 0.85rem;
                        text-transform: uppercase;
                        letter-spacing: 0.5px;
                        margin-bottom: 0.5rem;
                        display: block;
                        color: var(--neon-cyan);
                        opacity: 0.9;
                    }
                </style>
                <div class="card-body p-4">
                    <div class="row g-3 text-white align-items-end">
                        <div class="col-md-4">
                            <label class="filter-label fw-bold"><i class="bi bi-building me-1"></i>Select
                                Theater:</label>
                            <asp:DropDownList ID="DropDownListTheater" runat="server" AutoPostBack="False"
                                DataSourceID="SqlDataSourceTheaters" DataTextField="NAME" DataValueField="THEATERID"
                                CssClass="form-select" AppendDataBoundItems="True"
                                style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                <asp:ListItem Value="-1">Select Theater</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <label class="filter-label fw-bold"><i class="bi bi-film me-1"></i>Movie:</label>
                            <asp:DropDownList ID="DropDownListMovie" runat="server" AutoPostBack="False"
                                DataSourceID="SqlDataSourceMovie" DataTextField="TITLE" DataValueField="MOVIEID"
                                CssClass="form-select" AppendDataBoundItems="True"
                                style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                <asp:ListItem Value="-1">All Movies</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-auto">
                            <label class="filter-label" style="visibility: hidden;">&nbsp;</label>
                            <asp:Button ID="ButtonSearch" runat="server" Text="SEARCH" OnClick="ButtonSearch_Click"
                                CssClass="btn btn-primary px-4" />
                        </div>
                    </div>
                </div>
            </div>

            <asp:Panel ID="PanelResults" runat="server" Visible="false">


                <asp:SqlDataSource ID="SqlDataSourceTheaters" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.OracleClient"
                    SelectCommand="SELECT THEATERID, NAME || ' (' || CITY || ')' AS NAME FROM &quot;THEATERS&quot; ORDER BY NAME">
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSourceMovie" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.OracleClient"
                    SelectCommand="SELECT MOVIEID, TITLE FROM &quot;MOVIES&quot; ORDER BY TITLE">
                </asp:SqlDataSource>

                <div class="card glass-card overflow-hidden transition-all hover-scale"
                    style="background: rgba(25, 25, 45, 0.4) !important; border: 1px solid rgba(255, 0, 127, 0.1) !important;">
                    <div class="card-header text-white"
                        style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                        <h5 class="mb-0 fw-semibold"><i class="bi bi-calendar3 me-2"
                                style="color: var(--neon-cyan);"></i>
                            Filtered Results Grid</h5>
                    </div>
                    <div class="card-body p-0 table-responsive">
                        <asp:GridView ID="GridViewMovies" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSourceMoviesGrid"
                            CssClass="table table-hover table-borderless align-middle text-white mb-0"
                            EmptyDataText="No showtimes match the selected criteria." BorderStyle="None">
                            <EmptyDataRowStyle CssClass="fw-bold py-4 text-center text-neon-cyan" />
                            <Columns>
                                <asp:BoundField DataField="CITY" HeaderText="City" SortExpression="CITY" />
                                <asp:BoundField DataField="THEATER_NAME" HeaderText="Theater"
                                    SortExpression="THEATER_NAME" />
                                <asp:BoundField DataField="HALL_NAME" HeaderText="Hall" SortExpression="HALL_NAME" />
                                <asp:BoundField DataField="MOVIE_TITLE" HeaderText="Movie Title"
                                    SortExpression="MOVIE_TITLE" />
                                <asp:BoundField DataField="LANGUAGE" HeaderText="Language" SortExpression="LANGUAGE" />
                                <asp:BoundField DataField="SHOWDATE" HeaderText="Date" SortExpression="SHOWDATE"
                                    DataFormatString="{0:dd-MMM-yyyy}" />
                                <asp:BoundField DataField="SHOWTIME" HeaderText="Time" SortExpression="SHOWTIME" />
                                <asp:BoundField DataField="PRICE" HeaderText="Price" SortExpression="PRICE"
                                    DataFormatString="Rs. {0:F2}" />
                                <asp:BoundField DataField="OCCUPANCY_PCT" HeaderText="Paid Occupancy (%)"
                                    SortExpression="OCCUPANCY_PCT" DataFormatString="{0:F2}%" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSourceMoviesGrid" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.OracleClient"
                    SelectCommand="SELECT th.CITY, th.NAME AS THEATER_NAME, h.NAME AS HALL_NAME, m.TITLE as MOVIE_TITLE, m.DURATION, m.LANGUAGE, m.GENRE, s.SHOWDATE, s.SHOWTIME, s.PRICE, NVL((SELECT ROUND((COUNT(t.TICKETID) / NULLIF(h.CAPACITY, 0)) * 100, 2) FROM &quot;TICKETS&quot; t INNER JOIN &quot;BOOKINGS&quot; b ON t.BOOKINGID = b.BOOKINGID WHERE b.SHOWTIMEID = s.SHOWTIMEID AND UPPER(t.STATUS) = 'PAID'), 0) AS OCCUPANCY_PCT FROM &quot;THEATERS&quot; th INNER JOIN &quot;HALLS&quot; h ON th.THEATERID = h.THEATERID INNER JOIN &quot;SHOWTIMES&quot; s ON h.HALLID = s.HALLID INNER JOIN &quot;MOVIES&quot; m ON s.MOVIEID = m.MOVIEID WHERE (:THEATERID = -1 OR th.THEATERID = :THEATERID) AND (:MOVIEID = -1 OR m.MOVIEID = :MOVIEID) ORDER BY s.SHOWDATE DESC, s.SHOWTIME DESC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownListTheater" Name="THEATERID"
                            PropertyName="SelectedValue" Type="Decimal" DefaultValue="-1" />
                        <asp:ControlParameter ControlID="DropDownListMovie" Name="MOVIEID" PropertyName="SelectedValue"
                            Type="Decimal" DefaultValue="-1" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
        </div>
    </asp:Content>