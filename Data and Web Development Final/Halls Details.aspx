<%@ Page Title="Halls Details" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"
    CodeFile="Halls Details.aspx.cs" Inherits="Data_and_Web_Development_Final.Halls_Details" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-door-open me-2" style="color: var(--primary-accent);"></i>Manage Cinema Halls
            </h2>

            <div class="card glass-card mb-5 overflow-hidden">
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-cpu me-2" style="color: var(--neon-cyan);"></i> Hall
                        Database Engine</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="HALLID" DataSourceID="SqlDataSource1"
                        CssClass="table table-hover table-borderless align-middle text-white mb-0" BorderStyle="None">
                        <HeaderStyle CssClass="text-uppercase small fw-bold" />
                        <RowStyle CssClass="border-bottom border-white border-opacity-10" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"
                                ControlStyle-CssClass="btn btn-sm btn-outline-light me-2" />
                            <asp:BoundField DataField="HALLID" HeaderText="HALL ID" ReadOnly="True"
                                SortExpression="HALLID" />
                            <asp:BoundField DataField="THEATERID" HeaderText="THEATER ID" SortExpression="THEATERID" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                            <asp:BoundField DataField="CAPACITY" HeaderText="CAPACITY" SortExpression="CAPACITY" />
                            <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;HALLS&quot; WHERE &quot;HALLID&quot; = :original_HALLID"
                InsertCommand="INSERT INTO &quot;HALLS&quot; (&quot;HALLID&quot;, &quot;THEATERID&quot;, &quot;NAME&quot;, &quot;CAPACITY&quot;, &quot;TYPE&quot;) VALUES (:HALLID, :THEATERID, :NAME, :CAPACITY, :TYPE)"
                OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.OracleClient"
                SelectCommand="SELECT * FROM &quot;HALLS&quot;"
                UpdateCommand="UPDATE &quot;HALLS&quot; SET &quot;THEATERID&quot; = :THEATERID, &quot;NAME&quot; = :NAME, &quot;CAPACITY&quot; = :CAPACITY, &quot;TYPE&quot; = :TYPE WHERE &quot;HALLID&quot; = :original_HALLID">
                <DeleteParameters>
                    <asp:Parameter Name="original_HALLID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                    <asp:Parameter Name="THEATERID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="CAPACITY" Type="Decimal" />
                    <asp:Parameter Name="TYPE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="THEATERID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="CAPACITY" Type="Decimal" />
                    <asp:Parameter Name="TYPE" Type="String" />
                    <asp:Parameter Name="original_HALLID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="card glass-card mt-5 overflow-hidden">
                <div class="card-header"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold" style="color: #ffffff;"><i class="bi bi-pencil-square me-2"
                            style="color: var(--primary-accent);"></i> Configuration Console</h5>
                </div>
                <div class="card-body p-4 text-white">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="HALLID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Hall ID (Read Only)</label>
                                    <div class="p-2 border border-secondary rounded mb-2 bg-dark bg-opacity-25">
                                        <asp:Label ID="HALLIDLabel1" runat="server" Text='<%# Eval("HALLID") %>'
                                            CssClass="fw-bold" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Theater ID</label>
                                    <asp:TextBox ID="THEATERIDTextBoxEdit" runat="server"
                                        Text='<%# Bind("THEATERID") %>' CssClass="form-control mb-2"
                                        placeholder="Theater ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Hall Name</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="NAMETextBox" runat="server"
                                        Text='<%# Bind("NAME") %>' />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Capacity</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="CAPACITYTextBox" runat="server"
                                        Text='<%# Bind("CAPACITY") %>' />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Experience Type</label>
                                    <asp:DropDownList ID="TypeDropDownEdit" runat="server"
                                        SelectedValue='<%# Bind("TYPE") %>' CssClass="form-select mb-2">
                                        <asp:ListItem Value="STANDARD">Standard Experience</asp:ListItem>
                                        <asp:ListItem Value="PREMIUM">Premium Cinema</asp:ListItem>
                                        <asp:ListItem Value="VIP">VIP Gold Class</asp:ListItem>
                                        <asp:ListItem Value="IMAX">IMAX Experience</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update"
                                    Text="<i class='bi bi-check-circle me-1'></i> Update Hall"
                                    CssClass="btn btn-primary" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CommandName="Cancel"
                                    Text="Cancel" CssClass="btn btn-outline-primary" />
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Manual Hall ID</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="HALLIDTextBox" runat="server"
                                        Text='<%# Bind("HALLID") %>' placeholder="Unique ID" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Theater ID</label>
                                    <asp:TextBox ID="THEATERIDTextBoxInsert" runat="server"
                                        Text='<%# Bind("THEATERID") %>' CssClass="form-control mb-2"
                                        placeholder="Enter Theater ID Number" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Hall Name</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="NAMETextBox" runat="server"
                                        Text='<%# Bind("NAME") %>' placeholder="e.g. Hall 1" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Capacity</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="CAPACITYTextBox" runat="server"
                                        Text='<%# Bind("CAPACITY") %>' placeholder="Seat Count" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Experience Type</label>
                                    <asp:DropDownList ID="TypeDropDown" runat="server"
                                        SelectedValue='<%# Bind("TYPE") %>' CssClass="form-select mb-2">
                                        <asp:ListItem Value="STANDARD">Standard Experience</asp:ListItem>
                                        <asp:ListItem Value="PREMIUM">Premium Cinema</asp:ListItem>
                                        <asp:ListItem Value="VIP">VIP Gold Class</asp:ListItem>
                                        <asp:ListItem Value="IMAX">IMAX Experience</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert"
                                    Text="<i class='bi bi-plus-circle me-1'></i> Add Hall" CssClass="btn btn-primary" />
                                &nbsp;
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" Text="Clear"
                                    CssClass="btn btn-outline-primary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="row g-3 mb-4">
                                <div class="col-md-12">
                                    <div class="p-3 rounded"
                                        style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);">
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">Hall
                                            Selected</label>
                                        <span class="fs-4 fw-bold text-white">
                                            <asp:Label ID="NAMELabel" runat="server" Text='<%# Bind("NAME") %>' />
                                        </span>
                                        <span class="ms-2 opacity-50">(ID:
                                            <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Eval("HALLID") %>' />)
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Theater ID</label>
                                    <asp:Label ID="THEATERIDLabel" runat="server" Text='<%# Bind("THEATERID") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Capacity</label>
                                    <asp:Label ID="CAPACITYLabel" runat="server" Text='<%# Bind("CAPACITY") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Type</label>
                                    <span class="badge bg-primary px-3 py-2 mt-1">
                                        <asp:Label ID="TYPELabel" runat="server" Text='<%# Bind("TYPE") %>' />
                                    </span>
                                </div>
                            </div>
                            <div class="pt-3 border-top border-secondary">
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit"
                                    Text="<i class='bi bi-pencil me-1'></i> Edit"
                                    CssClass="btn btn-sm btn-outline-primary" />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete"
                                    Text="<i class='bi bi-trash me-1'></i> Delete"
                                    CssClass="btn btn-sm btn-outline-danger" />
                                &nbsp;
                                <asp:LinkButton ID="NewButton" runat="server" CommandName="New"
                                    Text="<i class='bi bi-plus me-1'></i> Add New" CssClass="btn btn-sm btn-primary" />
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>


        </div>
    </asp:Content>