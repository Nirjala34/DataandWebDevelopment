<%@ Page Title="Theaters Details" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"
    CodeBehind="Theaters Details.aspx.cs" Inherits="Data_and_Web_Development_Final.Theaters_Details" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-building me-2" style="color: var(--primary-accent);"></i>Manage Theaters
            </h2>

            <div class="card glass-card mb-5 overflow-hidden">
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-cpu me-2" style="color: var(--neon-cyan);"></i> Theater
                        Database Engine</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="THEATERID" DataSourceID="SqlDataSource1"
                        CssClass="table table-borderless table-hover mb-0 text-white" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="THEATERID" HeaderText="THEATERID" ReadOnly="True"
                                SortExpression="THEATERID" />
                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                            <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                            <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                            <asp:BoundField DataField="PHONE" HeaderText="PHONE" SortExpression="PHONE" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;THEATERS&quot; WHERE &quot;THEATERID&quot; = :original_THEATERID AND &quot;NAME&quot; = :original_NAME AND &quot;CITY&quot; = :original_CITY AND &quot;ADDRESS&quot; = :original_ADDRESS AND ((&quot;PHONE&quot; = :original_PHONE) OR (&quot;PHONE&quot; IS NULL AND :original_PHONE IS NULL))"
                InsertCommand="INSERT INTO &quot;THEATERS&quot; (&quot;THEATERID&quot;, &quot;NAME&quot;, &quot;CITY&quot;, &quot;ADDRESS&quot;, &quot;PHONE&quot;) VALUES (:THEATERID, :NAME, :CITY, :ADDRESS, :PHONE)"
                OldValuesParameterFormatString="original_{0}"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;THEATERS&quot;"
                UpdateCommand="UPDATE &quot;THEATERS&quot; SET &quot;NAME&quot; = :NAME, &quot;CITY&quot; = :CITY, &quot;ADDRESS&quot; = :ADDRESS, &quot;PHONE&quot; = :PHONE WHERE &quot;THEATERID&quot; = :original_THEATERID AND &quot;NAME&quot; = :original_NAME AND &quot;CITY&quot; = :original_CITY AND &quot;ADDRESS&quot; = :original_ADDRESS AND ((&quot;PHONE&quot; = :original_PHONE) OR (&quot;PHONE&quot; IS NULL AND :original_PHONE IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_THEATERID" Type="Decimal" />
                    <asp:Parameter Name="original_NAME" Type="String" />
                    <asp:Parameter Name="original_CITY" Type="String" />
                    <asp:Parameter Name="original_ADDRESS" Type="String" />
                    <asp:Parameter Name="original_PHONE" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="THEATERID" Type="Decimal" />
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="ADDRESS" Type="String" />
                    <asp:Parameter Name="PHONE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NAME" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="ADDRESS" Type="String" />
                    <asp:Parameter Name="PHONE" Type="String" />
                    <asp:Parameter Name="original_THEATERID" Type="Decimal" />
                    <asp:Parameter Name="original_NAME" Type="String" />
                    <asp:Parameter Name="original_CITY" Type="String" />
                    <asp:Parameter Name="original_ADDRESS" Type="String" />
                    <asp:Parameter Name="original_PHONE" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="card glass-card mt-5 overflow-hidden">
                <div class="card-header"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold" style="color: #ffffff;"><i class="bi bi-pencil-square me-2"
                            style="color: var(--primary-accent);"></i> Modify Theater Information</h5>
                </div>
                <div class="card-body p-4 text-white">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="THEATERID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Theater ID (Read
                                        Only)</label>
                                    <div class="p-2 border border-secondary rounded -subtle mb-2">
                                        <asp:Label ID="THEATERIDLabel1" runat="server" Text='<%# Eval("THEATERID") %>'
                                            CssClass="fw-bold" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Theater Name</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="NAMETextBox" runat="server"
                                        Text='<%# Bind("NAME") %>' placeholder="Cinema Name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">City</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="CITYTextBox" runat="server"
                                        Text='<%# Bind("CITY") %>' placeholder="City" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Address</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="ADDRESSTextBox" runat="server"
                                        Text='<%# Bind("ADDRESS") %>' placeholder="Full Address" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Phone</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="PHONETextBox" runat="server"
                                        Text='<%# Bind("PHONE") %>' placeholder="Contact Number" />
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="<i class='bi bi-check-circle me-1'></i> Update Theater"
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
                                    <label class="form-label fw-bold text-uppercase small">Theater ID</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="THEATERIDTextBox" runat="server"
                                        Text='<%# Bind("THEATERID") %>' placeholder="Unique ID" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Theater Name</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="NAMETextBox" runat="server"
                                        Text='<%# Bind("NAME") %>' placeholder="Cinema Name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">City</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="CITYTextBox" runat="server"
                                        Text='<%# Bind("CITY") %>' placeholder="City" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Address</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="ADDRESSTextBox" runat="server"
                                        Text='<%# Bind("ADDRESS") %>' placeholder="Full Address" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Phone</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="PHONETextBox" runat="server"
                                        Text='<%# Bind("PHONE") %>' placeholder="Contact Number" />
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" Text="<i class='bi bi-plus-circle me-1'></i> Add Theater"
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
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">Theater
                                            Record Selected</label>
                                        <span class="fs-4 fw-bold text-white">
                                            <asp:Label ID="NAMELabel" runat="server" Text='<%# Bind("NAME") %>' />
                                        </span>
                                        <span class="ms-2 opacity-50">(ID:
                                            <asp:Label ID="THEATERIDLabel" runat="server"
                                                Text='<%# Eval("THEATERID") %>' />)
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">City</label>
                                    <asp:Label ID="CITYLabel" runat="server" Text='<%# Bind("CITY") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-4">
                                    <label class="text-uppercase x-small opacity-75 d-block">Phone</label>
                                    <asp:Label ID="PHONELabel" runat="server" Text='<%# Bind("PHONE") %>'
                                        CssClass="fw-semibold" />
                                </div>
                                <div class="col-md-12">
                                    <label class="text-uppercase x-small opacity-75 d-block">Address</label>
                                    <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
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