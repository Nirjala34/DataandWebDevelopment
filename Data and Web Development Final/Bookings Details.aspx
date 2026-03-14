<%@ Page Title="Booking Details" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"
    CodeBehind="Bookings Details.aspx.cs" Inherits="Data_and_Web_Development_Final.Bookings_Details" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-calendar-check me-2" style="color: var(--primary-accent);"></i>Manage Bookings
            </h2>

            <div class="card glass-card mb-5 overflow-hidden">
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-cpu me-2" style="color: var(--neon-cyan);"></i> Booking
                        Database Engine</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="BOOKINGID" DataSourceID="SqlDataSource1"
                        CssClass="table table-hover table-borderless align-middle text-white mb-0" BorderStyle="None">
                        <HeaderStyle CssClass="text-uppercase small fw-bold" />
                        <RowStyle CssClass="border-bottom border-white border-opacity-10" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                                ControlStyle-CssClass="btn btn-sm btn-outline-light me-2" />
                            <asp:BoundField DataField="BOOKINGID" HeaderText="ID" ReadOnly="True"
                                SortExpression="BOOKINGID" />
                            <asp:BoundField DataField="USERID" HeaderText="USER ID" SortExpression="USERID" />
                            <asp:BoundField DataField="SHOWTIMEID" HeaderText="SHOWTIME ID"
                                SortExpression="SHOWTIMEID" />
                            <asp:BoundField DataField="BOOKINGTIME" HeaderText="TIME" SortExpression="BOOKINGTIME" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                            <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;BOOKINGS&quot; WHERE &quot;BOOKINGID&quot; = :original_BOOKINGID"
                InsertCommand="INSERT INTO &quot;BOOKINGS&quot; (&quot;BOOKINGID&quot;, &quot;USERID&quot;, &quot;SHOWTIMEID&quot;, &quot;BOOKINGTIME&quot;, &quot;STATUS&quot;, &quot;TYPE&quot;) VALUES (:BOOKINGID, :USERID, :SHOWTIMEID, :BOOKINGTIME, :STATUS, :TYPE)"
                OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.OracleClient"
                SelectCommand="SELECT * FROM &quot;BOOKINGS&quot; ORDER BY &quot;BOOKINGID&quot; ASC"
                UpdateCommand="UPDATE &quot;BOOKINGS&quot; SET &quot;USERID&quot; = :USERID, &quot;SHOWTIMEID&quot; = :SHOWTIMEID, &quot;BOOKINGTIME&quot; = :BOOKINGTIME, &quot;STATUS&quot; = :STATUS, &quot;TYPE&quot; = :TYPE WHERE &quot;BOOKINGID&quot; = :original_BOOKINGID">
                <DeleteParameters>
                    <asp:Parameter Name="original_BOOKINGID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="SHOWTIMEID" Type="Decimal" />
                    <asp:Parameter Name="BOOKINGTIME" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="TYPE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="SHOWTIMEID" Type="Decimal" />
                    <asp:Parameter Name="BOOKINGTIME" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="TYPE" Type="String" />
                    <asp:Parameter Name="original_BOOKINGID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="card glass-card mt-5 overflow-hidden">
                <div class="card-header"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold" style="color: #ffffff;"><i class="bi bi-pencil-square me-2"
                            style="color: var(--primary-accent);"></i> Create New Booking</h5>
                </div>
                <div class="card-body p-4 text-white">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="BOOKINGID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%" OnItemCreated="FormView1_ItemCreated">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Booking ID (Read
                                        Only)</label>
                                    <div class="p-2 border border-secondary rounded mb-2">
                                        <asp:Label ID="BOOKINGIDLabel1" runat="server" Text='<%# Eval("BOOKINGID") %>'
                                            CssClass="fw-bold" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">User ID</label>
                                    <asp:TextBox ID="USERIDTextBoxEdit" runat="server" Text='<%# Bind("USERID") %>'
                                        CssClass="form-control mb-2" placeholder="User ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Showtime ID</label>
                                    <asp:TextBox ID="SHOWTIMEIDTextBoxEdit" runat="server"
                                        Text='<%# Bind("SHOWTIMEID") %>' CssClass="form-control mb-2"
                                        placeholder="Showtime ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Booking Time</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="BOOKINGTIMETextBox" runat="server"
                                        Text='<%# Bind("BOOKINGTIME", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Status</label>
                                    <asp:DropDownList ID="StatusDropDownEdit" runat="server"
                                        SelectedValue='<%# Bind("STATUS") %>' CssClass="form-select mb-2"
                                        style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                        <asp:ListItem Value="PAID">PAID</asp:ListItem>
                                        <asp:ListItem Value="BOOKED">BOOKED</asp:ListItem>
                                        <asp:ListItem Value="CANCELLED">CANCELLED</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Type</label>
                                    <asp:DropDownList ID="TypeDropDownEdit" runat="server"
                                        SelectedValue='<%# Bind("TYPE") %>' CssClass="form-select mb-2"
                                        style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                        <asp:ListItem Value="BOOKING">BOOKING</asp:ListItem>
                                        <asp:ListItem Value="PURCHASE">PURCHASE</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="<i class='bi bi-check-circle me-1'></i> Update Booking"
                                    CssClass="btn btn-primary" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="<i class='bi bi-x-circle me-1'></i> Cancel"
                                    CssClass="btn btn-outline-primary" />
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Booking ID</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="BOOKINGIDTextBox" runat="server"
                                        Text='<%# Bind("BOOKINGID") %>' placeholder="New Booking ID" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">User ID</label>
                                    <asp:TextBox ID="USERIDTextBoxInsert" runat="server" Text='<%# Bind("USERID") %>'
                                        CssClass="form-control mb-2" placeholder="User ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Showtime ID</label>
                                    <asp:TextBox ID="SHOWTIMEIDTextBoxInsert" runat="server"
                                        Text='<%# Bind("SHOWTIMEID") %>' CssClass="form-control mb-2"
                                        placeholder="Showtime ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Booking Time</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="BOOKINGTIMETextBox" runat="server"
                                        Text='<%# Bind("BOOKINGTIME", "{0:yyyy-MM-ddTHH:mm}") %>'
                                        TextMode="DateTimeLocal" />
                                    <asp:RequiredFieldValidator ID="rfvTime" runat="server"
                                        ControlToValidate="BOOKINGTIMETextBox" ErrorMessage="Date is required"
                                        CssClass="text-danger small" Display="Dynamic" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Status</label>
                                    <asp:DropDownList ID="StatusDropDown" runat="server"
                                        SelectedValue='<%# Bind("STATUS") %>' CssClass="form-select mb-2"
                                        style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                        <asp:ListItem Value="PAID">PAID</asp:ListItem>
                                        <asp:ListItem Value="BOOKED">BOOKED</asp:ListItem>
                                        <asp:ListItem Value="CANCELLED">CANCELLED</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Type</label>
                                    <asp:DropDownList ID="TypeDropDown" runat="server"
                                        SelectedValue='<%# Bind("TYPE") %>' CssClass="form-select mb-2"
                                        style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                        <asp:ListItem Value="BOOKING">BOOKING</asp:ListItem>
                                        <asp:ListItem Value="PURCHASE">PURCHASE</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" Text="<i class='bi bi-plus-circle me-1'></i> Create Booking"
                                    CssClass="btn btn-primary" />
                                &nbsp;
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="<i class='bi bi-x-circle me-1'></i> Clear"
                                    CssClass="btn btn-outline-primary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="row g-3 mb-4">
                                <div class="col-md-12">
                                    <div class="p-3 rounded"
                                        style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);">
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">Booking
                                            Selected</label>
                                        <span class="fs-4 fw-bold text-white">ID:
                                            <asp:Label ID="BOOKINGIDLabel" runat="server"
                                                Text='<%# Eval("BOOKINGID") %>' />
                                        </span>
                                        <span class="ms-3 badge bg-info">
                                            <asp:Label ID="STATUSLabel" runat="server" Text='<%# Bind("STATUS") %>' />
                                        </span>
                                        <span class="ms-2 badge bg-secondary">
                                            <asp:Label ID="TYPELabelRecord" runat="server" Text='<%# Bind("TYPE") %>' />
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">User ID</label>
                                    <asp:Label ID="USERIDLabel" runat="server" Text='<%# Bind("USERID") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Showtime ID</label>
                                    <asp:Label ID="SHOWTIMEIDLabel" runat="server" Text='<%# Bind("SHOWTIMEID") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Booking Time</label>
                                    <asp:Label ID="BOOKINGTIMELabel" runat="server" Text='<%# Bind("BOOKINGTIME") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Type</label>
                                    <asp:Label ID="TYPELabelInfo" runat="server" Text='<%# Bind("TYPE") %>'
                                        CssClass="fw-semibold" />
                                </div>
                            </div>
                            <div class="pt-3 border-top border-secondary">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False"
                                    CommandName="Edit" Text="<i class='bi bi-pencil me-1'></i> Edit"
                                    CssClass="btn btn-sm btn-outline-primary" />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False"
                                    CommandName="Delete" Text="<i class='bi bi-trash me-1'></i> Delete"
                                    CssClass="btn btn-sm btn-outline-danger" />
                                &nbsp;
                                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                                    Text="<i class='bi bi-plus me-1'></i> Add New" CssClass="btn btn-sm btn-primary" />
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>



        </div>
    </asp:Content>