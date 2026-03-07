<%@ Page Title="Showtimes Details" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"
    CodeBehind="Showtimes Details.aspx.cs" Inherits="Data_and_Web_Development_Final.Showtimes_Details" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-clock me-2" style="color: var(--primary-accent);"></i>Manage Showtimes
            </h2>

            <div class="card glass-card mb-5 overflow-hidden">
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-cpu me-2" style="color: var(--neon-cyan);"></i>
                        Showtime Database Engine</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="SHOWTIMEID" DataSourceID="SqlDataSource1"
                        CssClass="table table-borderless table-hover mb-0 text-white" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="SHOWTIMEID" HeaderText="SHOWTIMEID" ReadOnly="True"
                                SortExpression="SHOWTIMEID" />
                            <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" SortExpression="MOVIEID" />
                            <asp:BoundField DataField="HALLID" HeaderText="HALLID" SortExpression="HALLID" />
                            <asp:BoundField DataField="SHOWDATE" HeaderText="SHOWDATE" SortExpression="SHOWDATE" />
                            <asp:BoundField DataField="SHOWTIME" HeaderText="SHOWTIME" SortExpression="SHOWTIME" />
                            <asp:BoundField DataField="PRICE" HeaderText="PRICE" SortExpression="PRICE"
                                DataFormatString="Rs. {0:F2}" />
                            <asp:BoundField DataField="ISHOLIDAY" HeaderText="ISHOLIDAY" SortExpression="ISHOLIDAY" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;SHOWTIMES&quot; WHERE &quot;SHOWTIMEID&quot; = :original_SHOWTIMEID"
                InsertCommand="INSERT INTO &quot;SHOWTIMES&quot; (&quot;SHOWTIMEID&quot;, &quot;MOVIEID&quot;, &quot;HALLID&quot;, &quot;SHOWDATE&quot;, &quot;SHOWTIME&quot;, &quot;PRICE&quot;, &quot;ISHOLIDAY&quot;) VALUES (:SHOWTIMEID, :MOVIEID, :HALLID, :SHOWDATE, :SHOWTIME, :PRICE, :ISHOLIDAY)"
                OldValuesParameterFormatString="original_{0}"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;SHOWTIMES&quot;"
                UpdateCommand="UPDATE &quot;SHOWTIMES&quot; SET &quot;MOVIEID&quot; = :MOVIEID, &quot;HALLID&quot; = :HALLID, &quot;SHOWDATE&quot; = :SHOWDATE, &quot;SHOWTIME&quot; = :SHOWTIME, &quot;PRICE&quot; = :PRICE, &quot;ISHOLIDAY&quot; = :ISHOLIDAY WHERE &quot;SHOWTIMEID&quot; = :original_SHOWTIMEID">
                <DeleteParameters>
                    <asp:Parameter Name="original_SHOWTIMEID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SHOWTIMEID" Type="Decimal" />
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                    <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                    <asp:Parameter Name="SHOWTIME" Type="String" />
                    <asp:Parameter Name="PRICE" Type="Decimal" />
                    <asp:Parameter Name="ISHOLIDAY" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                    <asp:Parameter Name="SHOWDATE" Type="DateTime" />
                    <asp:Parameter Name="SHOWTIME" Type="String" />
                    <asp:Parameter Name="PRICE" Type="Decimal" />
                    <asp:Parameter Name="ISHOLIDAY" Type="String" />
                    <asp:Parameter Name="original_SHOWTIMEID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="card glass-card mt-5 overflow-hidden">
                <div class="card-header"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold" style="color: #ffffff;"><i class="bi bi-pencil-square me-2"
                            style="color: var(--primary-accent);"></i> Modify Showtime Information</h5>
                </div>
                <div class="card-body p-4 text-white">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="SHOWTIMEID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Showtime ID (Read
                                        Only)</label>
                                    <div class="p-2 border border-secondary rounded -subtle mb-2">
                                        <asp:Label ID="SHOWTIMEIDLabel1" runat="server" Text='<%# Eval("SHOWTIMEID") %>'
                                            CssClass="fw-bold" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Movie ID</label>
                                    <asp:TextBox ID="MOVIEIDTextBoxEdit" runat="server" Text='<%# Bind("MOVIEID") %>'
                                        CssClass="form-control mb-2" placeholder="Movie ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Cinema Hall ID</label>
                                    <asp:TextBox ID="HALLIDTextBoxEdit" runat="server" Text='<%# Bind("HALLID") %>'
                                        CssClass="form-control mb-2" placeholder="Hall ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Show Date</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="SHOWDATETextBox" runat="server"
                                        Text='<%# Bind("SHOWDATE") %>' TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Show Time</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="SHOWTIMETextBox" runat="server"
                                        Text='<%# Bind("SHOWTIME") %>' placeholder="e.g. 18:30" />
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label fw-bold text-uppercase small">Price (NPR)</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="PRICETextBox" runat="server"
                                        Text='<%# Bind("PRICE") %>' />
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label fw-bold text-uppercase small">Is Holiday?</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="ISHOLIDAYTextBox" runat="server"
                                        Text='<%# Bind("ISHOLIDAY") %>' placeholder="Y/N" />
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="<i class='bi bi-check-circle me-1'></i> Update Showtime"
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
                                    <label class="form-label fw-bold text-uppercase small">Showtime ID</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="SHOWTIMEIDTextBox" runat="server"
                                        Text='<%# Bind("SHOWTIMEID") %>' placeholder="Unique ID" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Movie ID</label>
                                    <asp:TextBox ID="MOVIEIDTextBoxInsert" runat="server" Text='<%# Bind("MOVIEID") %>'
                                        CssClass="form-control mb-2" placeholder="Movie ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Cinema Hall ID</label>
                                    <asp:TextBox ID="HALLIDTextBoxInsert" runat="server" Text='<%# Bind("HALLID") %>'
                                        CssClass="form-control mb-2" placeholder="Hall ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Show Date</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="SHOWDATETextBox" runat="server"
                                        Text='<%# Bind("SHOWDATE") %>' TextMode="Date" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Show Time</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="SHOWTIMETextBox" runat="server"
                                        Text='<%# Bind("SHOWTIME") %>' placeholder="e.g. 18:30" />
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label fw-bold text-uppercase small">Price</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="PRICETextBox" runat="server"
                                        Text='<%# Bind("PRICE") %>' />
                                </div>
                                <div class="col-md-3">
                                    <label class="form-label fw-bold text-uppercase small">Holiday</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="ISHOLIDAYTextBox" runat="server"
                                        Text='<%# Bind("ISHOLIDAY") %>' placeholder="Y/N" />
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" Text="<i class='bi bi-plus-circle me-1'></i> Add Showtime"
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
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">Showtime
                                            Selected</label>
                                        <span class="fs-4 fw-bold text-white">Date:
                                            <asp:Label ID="SHOWDATELabel" runat="server"
                                                Text='<%# Bind("SHOWDATE", "{0:MMM dd, yyyy}") %>' />
                                        </span>
                                        <span class="ms-2 fs-4" style="color: var(--primary-accent);">@
                                            <asp:Label ID="SHOWTIMELabel" runat="server"
                                                Text='<%# Bind("SHOWTIME") %>' />
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Movie ID</label>
                                    <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Bind("MOVIEID") %>'
                                        CssClass="fw-bold" />
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Hall ID</label>
                                    <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Bind("HALLID") %>'
                                        CssClass="fw-bold" />
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Price</label>
                                    <span class="text-success fw-bold">NPR
                                        <asp:Label ID="PRICELabel" runat="server" Text='<%# Bind("PRICE") %>' />
                                    </span>
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Holiday</label>
                                    <asp:Label ID="ISHOLIDAYLabel" runat="server" Text='<%# Bind("ISHOLIDAY") %>' />
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