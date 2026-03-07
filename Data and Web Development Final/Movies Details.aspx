<%@ Page Title="Movies Details" MasterPageFile="~/Site.Master" Language="C#" AutoEventWireup="true"
    CodeBehind="Movies Details.aspx.cs" Inherits="Data_and_Web_Development_Final.Movies_Details" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <h2 class="fw-bold mb-4"
                style="color: #ffffff; border-bottom: 3px solid var(--primary-accent); padding-bottom: 10px; display: inline-block; letter-spacing: 1px;">
                <i class="bi bi-film me-2" style="color: var(--primary-accent);"></i>Manage Movies
            </h2>

            <div class="card glass-card mb-5 overflow-hidden">
                <div class="card-header text-white"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold"><i class="bi bi-cpu me-2" style="color: var(--neon-cyan);"></i> Movie
                        Database Engine</h5>
                </div>
                <div class="card-body p-0 table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1"
                        CssClass="table table-borderless table-hover mb-0 text-white" GridLines="None">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" ReadOnly="True"
                                SortExpression="MOVIEID" />
                            <asp:BoundField DataField="TITLE" HeaderText="TITLE" SortExpression="TITLE" />
                            <asp:BoundField DataField="DURATION" HeaderText="DURATION" SortExpression="DURATION" />
                            <asp:BoundField DataField="LANGUAGE" HeaderText="LANGUAGE" SortExpression="LANGUAGE" />
                            <asp:BoundField DataField="GENRE" HeaderText="GENRE" SortExpression="GENRE" />
                            <asp:BoundField DataField="RELEASEDATE" HeaderText="RELEASEDATE"
                                SortExpression="RELEASEDATE" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM &quot;MOVIES&quot; WHERE &quot;MOVIEID&quot; = :original_MOVIEID AND &quot;TITLE&quot; = :original_TITLE AND &quot;DURATION&quot; = :original_DURATION AND &quot;LANGUAGE&quot; = :original_LANGUAGE AND &quot;GENRE&quot; = :original_GENRE AND &quot;RELEASEDATE&quot; = :original_RELEASEDATE"
                InsertCommand="INSERT INTO &quot;MOVIES&quot; (&quot;MOVIEID&quot;, &quot;TITLE&quot;, &quot;DURATION&quot;, &quot;LANGUAGE&quot;, &quot;GENRE&quot;, &quot;RELEASEDATE&quot;) VALUES (:MOVIEID, :TITLE, :DURATION, :LANGUAGE, :GENRE, :RELEASEDATE)"
                OldValuesParameterFormatString="original_{0}"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT * FROM &quot;MOVIES&quot;"
                UpdateCommand="UPDATE &quot;MOVIES&quot; SET &quot;TITLE&quot; = :TITLE, &quot;DURATION&quot; = :DURATION, &quot;LANGUAGE&quot; = :LANGUAGE, &quot;GENRE&quot; = :GENRE, &quot;RELEASEDATE&quot; = :RELEASEDATE WHERE &quot;MOVIEID&quot; = :original_MOVIEID AND &quot;TITLE&quot; = :original_TITLE AND &quot;DURATION&quot; = :original_DURATION AND &quot;LANGUAGE&quot; = :original_LANGUAGE AND &quot;GENRE&quot; = :original_GENRE AND &quot;RELEASEDATE&quot; = :original_RELEASEDATE">
                <DeleteParameters>
                    <asp:Parameter Name="original_MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="original_TITLE" Type="String" />
                    <asp:Parameter Name="original_DURATION" Type="Decimal" />
                    <asp:Parameter Name="original_LANGUAGE" Type="String" />
                    <asp:Parameter Name="original_GENRE" Type="String" />
                    <asp:Parameter Name="original_RELEASEDATE" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="TITLE" Type="String" />
                    <asp:Parameter Name="DURATION" Type="Decimal" />
                    <asp:Parameter Name="LANGUAGE" Type="String" />
                    <asp:Parameter Name="GENRE" Type="String" />
                    <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TITLE" Type="String" />
                    <asp:Parameter Name="DURATION" Type="Decimal" />
                    <asp:Parameter Name="LANGUAGE" Type="String" />
                    <asp:Parameter Name="GENRE" Type="String" />
                    <asp:Parameter Name="RELEASEDATE" Type="DateTime" />
                    <asp:Parameter Name="original_MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="original_TITLE" Type="String" />
                    <asp:Parameter Name="original_DURATION" Type="Decimal" />
                    <asp:Parameter Name="original_LANGUAGE" Type="String" />
                    <asp:Parameter Name="original_GENRE" Type="String" />
                    <asp:Parameter Name="original_RELEASEDATE" Type="DateTime" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="card glass-card mt-5 overflow-hidden">
                <div class="card-header"
                    style="background: rgba(255, 255, 255, 0.05); border-bottom: 1px solid rgba(255, 255, 255, 0.1);">
                    <h5 class="mb-0 fw-semibold" style="color: #ffffff;"><i class="bi bi-pencil-square me-2"
                            style="color: var(--primary-accent);"></i> Modify Movie Information</h5>
                </div>
                <div class="card-body p-4 text-white">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MOVIEID" DataSourceID="SqlDataSource1"
                        DefaultMode="Insert" Width="100%">
                        <EditItemTemplate>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Movie ID (Read Only)</label>
                                    <div class="p-2 border border-secondary rounded -subtle mb-2">
                                        <asp:Label ID="MOVIEIDLabel1" runat="server" Text='<%# Eval("MOVIEID") %>'
                                            CssClass="fw-bold" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Title</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="TITLETextBox" runat="server"
                                        Text='<%# Bind("TITLE") %>' placeholder="Enter movie title" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Duration (Mins)</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="DURATIONTextBox" runat="server"
                                        Text='<%# Bind("DURATION") %>' placeholder="e.g. 120" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Language</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="LANGUAGETextBox" runat="server"
                                        Text='<%# Bind("LANGUAGE") %>' placeholder="e.g. English" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Genre</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="GENRETextBox" runat="server"
                                        Text='<%# Bind("GENRE") %>' placeholder="e.g. Action" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Release Date</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="RELEASEDATETextBox" runat="server"
                                        Text='<%# Bind("RELEASEDATE") %>' TextMode="Date" />
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True"
                                    CommandName="Update" Text="<i class='bi bi-check-circle me-1'></i> Update Record"
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
                                    <label class="form-label fw-bold text-uppercase small">Movie ID</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="MOVIEIDTextBox" runat="server"
                                        Text='<%# Bind("MOVIEID") %>' placeholder="Unique ID" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Title</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="TITLETextBox" runat="server"
                                        Text='<%# Bind("TITLE") %>' placeholder="Enter movie title" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Duration (Mins)</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="DURATIONTextBox" runat="server"
                                        Text='<%# Bind("DURATION") %>' placeholder="e.g. 120" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Language</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="LANGUAGETextBox" runat="server"
                                        Text='<%# Bind("LANGUAGE") %>' placeholder="e.g. English" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Genre</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="GENRETextBox" runat="server"
                                        Text='<%# Bind("GENRE") %>' placeholder="e.g. Action" />
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-uppercase small">Release Date</label>
                                    <asp:TextBox CssClass="form-control mb-2" ID="RELEASEDATETextBox" runat="server"
                                        Text='<%# Bind("RELEASEDATE") %>' TextMode="Date" />
                                </div>
                            </div>
                            <div class="mt-4 pt-3 border-top border-secondary">
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                                    CommandName="Insert" Text="<i class='bi bi-plus-circle me-1'></i> Add New Movie"
                                    CssClass="btn btn-primary" />
                                &nbsp;
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="<i class='bi bi-x-circle me-1'></i> Clear"
                                    CssClass="btn btn-outline-primary" />
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="row g-3 mb-4">
                                <div class="col-md-4">
                                    <div class="p-3 rounded"
                                        style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);">
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">Movie
                                            ID</label>
                                        <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Eval("MOVIEID") %>'
                                            CssClass="fs-5" />
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="p-3 rounded"
                                        style="background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1);">
                                        <label class="text-uppercase small fw-bold text-info d-block mb-1">Movie
                                            Title</label>
                                        <asp:Label ID="TITLELabel" runat="server" Text='<%# Bind("TITLE") %>'
                                            CssClass="fs-5 fw-bold" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Duration</label>
                                    <asp:Label ID="DURATIONLabel" runat="server" Text='<%# Bind("DURATION") %>' /> mins
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Language</label>
                                    <asp:Label ID="LANGUAGELabel" runat="server" Text='<%# Bind("LANGUAGE") %>' />
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Genre</label>
                                    <asp:Label ID="GENRELabel" runat="server" Text='<%# Bind("GENRE") %>' />
                                </div>
                                <div class="col-md-3">
                                    <label class="text-uppercase x-small opacity-75 d-block">Release Date</label>
                                    <asp:Label ID="RELEASEDATELabel" runat="server"
                                        Text='<%# Bind("RELEASEDATE", "{0:MMM dd, yyyy}") %>' />
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
                                    Text="<i class='bi bi-plus me-1'></i> Create New"
                                    CssClass="btn btn-sm btn-primary" />
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>
    </asp:Content>