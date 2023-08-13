<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.Master" AutoEventWireup="true" CodeBehind="MarkaEkle.aspx.cs" Inherits="TelefonWeb.MarkaEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">Yeni Marka Ekleme Sayfası </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-20 grid-margin-left stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="forms-sample">
                    <div class="form-group" runat="server">
                        <label class="col-sm-6 col-form-label">Marka Adı</label>
                        <asp:TextBox class="form-control" ID="txtmarka" runat="server" Text=""></asp:TextBox>
                        <p></p>
                        <asp:GridView class="form-control" ID="GridView1" AllowPaging="True" runat="server">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Marka_adı">
                                    <ItemTemplate>
                                        <div>
                                            <asp:Label ID="lblID" runat="server" Text="Marka_adı"> </asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <div>
                        </div>
                        <asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Kaydet_Click" Text="Kaydet" />
                        <br />
                        <br />
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FNİLETİŞİMConnectionString %>" 
                        SelectCommand="SELECT ID, Marka_adı FROM [Marka] ORDER BY Marka_adı ASC"
                        DeleteCommand="DELETE FROM [Marka] WHERE [ID] = @ID" 
                        InsertCommand="INSERT INTO [Marka] ([Marka_adı]) VALUES (@Marka_adı)" UpdateCommand="UPDATE [Marka] SET [Marka_adı] = @Marka_adı WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Marka_adı" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Marka_adı" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Marka_adı" HeaderText="Marka_adı" SortExpression="Marka_adı" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

