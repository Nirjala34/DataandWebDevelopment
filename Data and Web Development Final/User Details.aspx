<%@ Page Title="User Details" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"
    CodeBehind="User Details.aspx.cs" Inherits="Data_and_Web_Development_Final.User_Details" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-person-gear me-2" style="color: var(--primary-accent);"></i>Manage User
            </h2>

            <div class="card glass-card mb-5 overflow-hidden">
                <style>
                    .table-hover tbody tr:hover {
                        background: rgba(255, 255, 255, 0.08) !important;
                        transform: scale(1.005);
                        transition: all 0.3s ease;
                    }
                </style>
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-cpu me-2" style="color: var(--neon-cyan);"></i> User
                        Database Engine</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSource1"
                        CssClass="table table-borderless table-hover mb-0 text-white" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True"
                                SortExpression="USERID" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                            <asp:BoundField DataField="PHONE" HeaderText="PHONE" SortExpression="PHONE" />
                            <asp:BoundField DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;USERID&quot; = :original_USERID AND &quot;NAME&quot; = :original_NAME AND &quot;EMAIL&quot; = :original_EMAIL AND ((&quot;PHONE&quot; = :original_PHONE) OR (&quot;PHONE&quot; IS NULL AND :original_PHONE IS NULL)) AND &quot;TYPE&quot; = :original_TYPE"
                InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;USERID&quot;, &quot;NAME&quot;, &quot;EMAIL&quot;, &quot;PHONE&quot;, &quot;TYPE&quot;) VALUES (:USERID, :NAME, :EMAIL, :PHONE, :TYPE)"
                OldValuesParameterFormatString="original_{0}"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;USERS&quot; ORDER BY &quot;USERID&quot; ASC"
                UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;NAME&quot; = :NAME, &quot;EMAIL&quot; = :EMAIL, &quot;PHONE&quot; = :PHONE, &quot;TYPE&quot; = :TYPE WHERE &quot;USERID&quot; = :original_USERID AND &quot;NAME&quot; = :original_NAME AND &quot;EMAIL&quot; = :original_EMAIL AND ((&quot;PHONE&quot; = :original_PHONE) OR (&quot;PHONE&quot; IS NULL AND :original_PHONE IS NULL)) AND &quot;TYPE&quot; = :original_TYPE">
                <DeleteParameters>
                    <asp:Parameter Name="original_USERID" Type="Decimal" />
                    <asp:Parameter Name="original_NAME" Type="String" />
                    <asp:Parameter Name="original_EMAIL" Type="String" />
                    <asp:Parameter Name="original_PHONE" Type="String" />
                    <asp:Parameter Name="original_TYPE" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PHONE" Type="String" />
                    <asp:Parameter Name="TYPE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PHONE" Type="String" />
                    <asp:Parameter Name="TYPE" Type="String" />
                    <asp:Parameter Name="original_USERID" Type="Decimal" />
                    <asp:Parameter Name="original_NAME" Type="String" />
                    <asp:Parameter Name="original_EMAIL" Type="String" />
                    <asp:Parameter Name="original_PHONE" Type="String" />
                    <asp:Parameter Name="original_TYPE" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="card glass-card mt-5 overflow-hidden">
                <div class="card-header"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold" style="color: #ffffff;"><i class="bi bi-pencil-square me-2"
                            style="color: var(--primary-accent);"></i> Modify Record Information</h5>
                </div>
                <div class="card-body p-4 text-white">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">User ID (Read Only)</label>
                                    <div class="p-2 border border-secondary rounded -subtle mb-2">
                                        <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>'
                                            CssClass="fw-bold" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Full Name</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="NAMETextBox" runat="server"
                                        Text='<%# Bind("NAME") %>' placeholder="Enter name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Email Address</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="EMAILTextBox" runat="server"
                                        Text='<%# Bind("EMAIL") %>' placeholder="email@example.com" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Phone Number</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="PHONETextBox" runat="server"
                                        Text='<%# Bind("PHONE") %>' placeholder="9810000000" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">User Type</label>
                                    <asp:DropDownList ID="TYPEDropDownList" runat="server" CssClass="form-select mb-2"
                                        SelectedValue='<%# Bind("TYPE") %>'>
                                        <asp:ListItem Value="CUSTOMER">CUSTOMER</asp:ListItem>
                                        <asp:ListItem Value="ADMIN">ADMIN</asp:ListItem>
                                        <asp:ListItem Value="STAFF">STAFF</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="<i class='bi bi-check-circle me-1'></i> Update User"
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
                                    <label class="form-label fw-bold text-uppercase small">User ID</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="USERIDTextBox" runat="server"
                                        Text='<%# Bind("USERID") %>' placeholder="Unique numeric ID" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Full Name</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="NAMETextBox" runat="server"
                                        Text='<%# Bind("NAME") %>' placeholder="Enter name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Email Address</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="EMAILTextBox" runat="server"
                                        Text='<%# Bind("EMAIL") %>' placeholder="email@example.com" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Phone Number</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="PHONETextBox" runat="server"
                                        Text='<%# Bind("PHONE") %>' placeholder="9810000000" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">User Type</label>
                                    <asp:DropDownList ID="TYPEDropDownList" runat="server" CssClass="form-select mb-2"
                                        SelectedValue='<%# Bind("TYPE") %>'>
                                        <asp:ListItem Value="CUSTOMER">CUSTOMER</asp:ListItem>
                                        <asp:ListItem Value="ADMIN">ADMIN</asp:ListItem>
                                        <asp:ListItem Value="STAFF">STAFF</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" Text="<i class='bi bi-plus-circle me-1'></i> Create New User"
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
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">User Record
                                            Selected</label>
                                        <span class="fs-4 fw-bold text-white">
                                            <asp:Label ID="NAMELabel" runat="server" Text='<%# Bind("NAME") %>' />
                                        </span>
                                        <span class="ms-2 opacity-50">(ID:
                                            <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />)
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Email</label>
                                    <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Phone</label>
                                    <asp:Label ID="PHONELabel" runat="server" Text='<%# Bind("PHONE") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Type</label>
                                    <span class="badge bg-info">
                                        <asp:Label ID="TYPELabel" runat="server" Text='<%# Bind("TYPE") %>' />
                                    </span>
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