<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.Master" AutoEventWireup="true" CodeBehind="ModelEkle.aspx.cs" Inherits="TelefonWeb.ModelEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">Yeni Model Ekleme Sayfası </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-20 grid-margin-left stretch-card">
        <div class="card">
            <div class="card-body">
                <div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Marka </label>
                        <div class="col-sm-9">
                            <asp:DropDownList class="form-control" ID="Dropdownmarka" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Dropdownmarka_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Model</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtmodel" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Kydet_Click" Text="Kaydet" />
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FNİLETİŞİMConnectionString %>"
                        SelectCommand="SELECT Mo.ID as ID, Mo.Model_adı as Model_adı, Ma.Marka_adı as Marka_adı FROM [Model] as Mo  LEFT JOIN Marka as Ma ON Mo.Marka_id = Ma.ID ORDER BY Ma.Marka_adı ASC"
                        DeleteCommand="DELETE FROM [Model] WHERE [ID] = @ID"
                        InsertCommand="INSERT INTO [Model] ([Model_adı], [Marka_id]) VALUES (@Model_adı, @Marka_id)"
                        UpdateCommand="UPDATE [Model] SET [Model_adı] = @Model_adı, [Marka_id] = @Marka_id WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Model_adı" Type="String" />
                            <asp:Parameter Name="Marka_id" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Model_adı" Type="String" />
                            <asp:Parameter Name="Marka_id" Type="Int32" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="Model_adı" HeaderText="Model Adı" SortExpression="Model_adı" />
                            <asp:BoundField DataField="Marka_adı" HeaderText="Marka Adı" SortExpression="Marka_adı" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
