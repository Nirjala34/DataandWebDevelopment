<%@ Page Title="Ticket Details" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"
    CodeBehind="Ticket Details.aspx.cs" Inherits="Data_and_Web_Development_Final.Ticket_Details" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-ticket-perforated me-2" style="color: var(--primary-accent);"></i>Manage Tickets
            </h2>

            <div class="card glass-card mb-5 overflow-hidden">
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-cpu me-2" style="color: var(--neon-cyan);"></i> Ticket
                        Database Engine</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1"
                        CssClass="table table-borderless table-hover mb-0 text-white" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="TICKETID" HeaderText="TICKETID" ReadOnly="True"
                                SortExpression="TICKETID" />
                            <asp:BoundField DataField="BOOKINGID" HeaderText="BOOKINGID" SortExpression="BOOKINGID" />
                            <asp:BoundField DataField="SEATNO" HeaderText="SEATNO" SortExpression="SEATNO" />
                            <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;TICKETS&quot; WHERE &quot;TICKETID&quot; = :original_TICKETID"
                InsertCommand="INSERT INTO &quot;TICKETS&quot; (&quot;TICKETID&quot;, &quot;BOOKINGID&quot;, &quot;SEATNO&quot;, &quot;STATUS&quot;) VALUES (:TICKETID, :BOOKINGID, :SEATNO, :STATUS)"
                OldValuesParameterFormatString="original_{0}"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;TICKETS&quot;"
                UpdateCommand="UPDATE &quot;TICKETS&quot; SET &quot;BOOKINGID&quot; = :BOOKINGID, &quot;SEATNO&quot; = :SEATNO, &quot;STATUS&quot; = :STATUS WHERE &quot;TICKETID&quot; = :original_TICKETID">
                <DeleteParameters>
                    <asp:Parameter Name="original_TICKETID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                    <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                    <asp:Parameter Name="SEATNO" Type="String" />
                    <asp:Parameter Name="STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                    <asp:Parameter Name="SEATNO" Type="String" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="original_TICKETID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>



            <div class="card glass-card mt-5 overflow-hidden">
                <div class="card-header"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold" style="color: #ffffff;"><i class="bi bi-pencil-square me-2"
                            style="color: var(--primary-accent);"></i> Modify Ticket Information</h5>
                </div>
                <div class="card-body p-4 text-white">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Ticket ID (Read
                                        Only)</label>
                                    <asp:TextBox CssClass="form-control mb-2 bg-dark text-white opacity-50"
                                        ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>'
                                        ReadOnly="true" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Booking ID</label>
                                    <asp:TextBox ID="BOOKINGIDTextBoxEdit" runat="server"
                                        Text='<%# Bind("BOOKINGID") %>' CssClass="form-control mb-2"
                                        placeholder="Booking ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Seat Number</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="SEATNOTextBox" runat="server"
                                        Text='<%# Bind("SEATNO") %>' placeholder="e.g. A1, B12" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Status</label>
                                    <asp:DropDownList ID="StatusDropDownEdit" runat="server"
                                        SelectedValue='<%# Bind("STATUS") %>' CssClass="form-select mb-2"
                                        style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                        <asp:ListItem Value="PAID">PAID</asp:ListItem>
                                        <asp:ListItem Value="RESERVED">RESERVED</asp:ListItem>
                                        <asp:ListItem Value="USED">USED</asp:ListItem>
                                        <asp:ListItem Value="CANCELLED">CANCELLED</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="<i class='bi bi-check-circle me-1'></i> Update Ticket"
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
                                    <label class="form-label fw-bold text-uppercase small">Ticket ID</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="TICKETIDTextBox" runat="server"
                                        Text='<%# Bind("TICKETID") %>' placeholder="New Ticket ID" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Booking ID</label>
                                    <asp:TextBox ID="BOOKINGIDTextBoxInsert" runat="server"
                                        Text='<%# Bind("BOOKINGID") %>' CssClass="form-control mb-2"
                                        placeholder="Booking ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Seat Number</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="SEATNOTextBox" runat="server"
                                        Text='<%# Bind("SEATNO") %>' />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Status</label>
                                    <asp:DropDownList ID="StatusDropDownInsert" runat="server"
                                        SelectedValue='<%# Bind("STATUS") %>' CssClass="form-select mb-2"
                                        style="background: rgba(255,255,255,0.05); color: white; border: 1px solid rgba(255,255,255,0.1);">
                                        <asp:ListItem Value="PAID">PAID</asp:ListItem>
                                        <asp:ListItem Value="RESERVED">RESERVED</asp:ListItem>
                                        <asp:ListItem Value="USED">USED</asp:ListItem>
                                        <asp:ListItem Value="CANCELLED">CANCELLED</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" Text="<i class='bi bi-plus-circle me-1'></i> Issue Ticket"
                                    CssClass="btn btn-primary" />
                                &nbsp;
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="<i class='bi bi-x-circle me-1'></i> Clear"
                                    CssClass="btn btn-outline-primary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="row g-3 mb-4">
                                <div class="col-md-6">
                                    <div class="p-3 rounded"
                                        style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);">
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">Ticket
                                            ID</label>
                                        <span class="fs-4 fw-bold text-white">
                                            <asp:Label ID="TICKETIDLabel" runat="server"
                                                Text='<%# Eval("TICKETID") %>' />
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="p-3 rounded"
                                        style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);">
                                        <label
                                            class="text-uppercase small fw-bold text-info d-block mb-1">Status</label>
                                        <span class="badge bg-success fs-6">
                                            <asp:Label ID="STATUSLabel" runat="server" Text='<%# Bind("STATUS") %>' />
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="text-uppercase x-small opacity-75 d-block">Booking ID</label>
                                    <asp:Label ID="BOOKINGIDLabel" runat="server" Text='<%# Bind("BOOKINGID") %>'
                                        CssClass="fw-bold" />
                                </div>
                                <div class="col-md-6">
                                    <label class="text-uppercase x-small opacity-75 d-block">Seat Number</label>
                                    <asp:Label ID="SEATNOLabel" runat="server" Text='<%# Bind("SEATNO") %>'
                                        CssClass="fw-bold text-warning" />
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
                                    Text="<i class='bi bi-plus me-1'></i> Issue New"
                                    CssClass="btn btn-sm btn-primary" />
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </asp:Content>