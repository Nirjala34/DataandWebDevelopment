<%@ Page Title="User Tickets" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="UserTicket.aspx.cs" Inherits="Data_and_Web_Development_Final.UserTicket" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
            .text-neon-pink {
                color: var(--primary-accent) !important;
            }
        </style>
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-person-badge me-2" style="color: var(--primary-accent);"></i>User Ticket History
            </h2>

            <div class="card glass-card mb-4">
                <div class="card-body p-4">
                    <div class="row align-items-center text-white">
                        <div class="col-md-5 mb-3 mb-md-0">
                            <label for="userDropDown" class="form-label fw-bold"><i class="bi bi-person me-2"></i>Select
                                Active User:</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                                DataSourceID="SqlDataSourceUsers" DataTextField="NAME" DataValueField="USERID"
                                CssClass="form-select dropdown-highlight"
                                style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-5 ms-md-auto">
                            <label for="periodDropDown" class="form-label fw-bold"><i
                                    class="bi bi-calendar-event me-2"></i>Filter by Period:</label>
                            <asp:DropDownList ID="DropDownListPeriod" runat="server" AutoPostBack="True"
                                CssClass="form-select dropdown-highlight"
                                style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                <asp:ListItem Value="-1">All Historical Records</asp:ListItem>
                                <asp:ListItem Value="6">Last 6 Months Only</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.OracleClient"
                SelectCommand="SELECT USERID, NAME FROM &quot;USERS&quot; ORDER BY NAME"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceUserDetails" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.OracleClient"
                SelectCommand="SELECT NAME, EMAIL, PHONE FROM &quot;USERS&quot; WHERE USERID = :USERID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="USERID" PropertyName="SelectedValue"
                        Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceUserDetails" CssClass="w-100 mb-4">
                <ItemTemplate>
                    <div class="card glass-card border-0 shadow-lg"
                        style="background: rgba(30,30,60,0.4) !important; border-left: 6px solid var(--primary-accent) !important; border-radius: 24px !important;">
                        <div class="card-body p-4 d-flex align-items-center">
                            <div>
                                <h2 class="text-white fw-bold mb-1" style="font-size: 2.2rem; letter-spacing: -0.5px;">
                                    <%# Eval("NAME") %>
                                </h2>
                                <div class="d-flex text-dim flex-wrap gap-5 mt-2"
                                    style="font-size: 1.1rem; opacity: 0.8;">
                                    <span>
                                        <%# Eval("EMAIL") %>
                                    </span>
                                    <span>
                                        <%# Eval("PHONE") %>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>

            <div class="card glass-card overflow-hidden transition-all hover-scale">
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.02); border-bottom: 1px solid rgba(255, 255, 255, 0.05);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-ticket-perforated me-2"
                            style="color: var(--primary-accent);"></i>
                        Ticket Purchase History</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSourceTickets"
                        CssClass="table table-hover table-borderless align-middle text-white mb-0"
                        EmptyDataText="No ticket records found for this user in the selected time period."
                        BorderStyle="None">
                        <EmptyDataRowStyle CssClass="fw-bold py-4 text-center text-neon-pink" />
                        <Columns>
                            <asp:BoundField DataField="BOOKINGTIME" HeaderText="Booking Date & Time"
                                SortExpression="BOOKINGTIME" HeaderStyle-CssClass="ps-4" ItemStyle-CssClass="ps-4" />
                            <asp:BoundField DataField="SEATNO" HeaderText="Seat Number" SortExpression="SEATNO" />
                            <asp:TemplateField HeaderText="Ticket Status" SortExpression="STATUS">
                                <ItemTemplate>
                                    <span
                                        class='<%# Eval("STATUS").ToString().ToLower() == "paid" ? "badge bg-success" : "badge bg-warning text-dark" %>'>
                                        <%# Eval("STATUS") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSourceTickets" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="System.Data.OracleClient"
                SelectCommand="SELECT b.BOOKINGTIME, t.SEATNO, t.STATUS FROM &quot;BOOKINGS&quot; b INNER JOIN &quot;TICKETS&quot; t ON b.BOOKINGID = t.BOOKINGID WHERE b.USERID = :USERID AND (:PERIOD = -1 OR b.BOOKINGTIME >= ADD_MONTHS(SYSDATE, -:PERIOD)) ORDER BY b.BOOKINGTIME DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="USERID" PropertyName="SelectedValue"
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="DropDownListPeriod" Name="PERIOD" PropertyName="SelectedValue"
                        Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </asp:Content>