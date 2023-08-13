<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.Master" AutoEventWireup="true" CodeBehind="Stok.aspx.cs" Inherits="TelefonWeb.Stok" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">Stok Kontrolleri Sayfasına Hoş Geldiniz.. </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="col-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="forms-sample">

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Marka</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="Dropdownmarka" class="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Dropdownmarka_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Model</label>
                        <div class="col-sm-9">
                            <asp:DropDownList ID="Dropdownmodel" class="form-control" runat="server">
                                <asp:ListItem Enabled="true" Text="" Value="-1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Stok Adedi :</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtstok" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Giriş Tarihi :</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtgiris" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Alış Fiyatı :</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtalıs" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Kydet_Click" Text="Kaydet" />

                </div>
                <br />
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Guncelle_Click" Text="Güncelle" />
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FNİLETİŞİMConnectionString %>"
        SelectCommand="SELECT 
               telefon_ıd,
               Ma.Marka_adı as marka
	          ,Mo.Model_adı as model
              ,[stok_adedi]
              ,[girıs_tarihi]
              ,[alis_fıyatı]
          FROM [Stok] as S
          LEFT  JOIN [Marka] as Ma ON Ma.ID= S.Marka
          LEFT JOIN [Model] as Mo ON Mo.ID =S.model"
        DeleteCommand="DELETE FROM [Stok] WHERE [telefon_ıd] = @telefon_ıd"
        InsertCommand="INSERT INTO [Stok] ([marka], [model], [stok_adedi], [girıs_tarihi], [alis_fıyatı]) VALUES (@marka, @model, @stok_adedi, @girıs_tarihi, @alis_fıyatı)"
        UpdateCommand="UPDATE [Stok] SET [marka] = @marka, [model] = @model, [stok_adedi] = @stok_adedi, [girıs_tarihi] = @girıs_tarihi, [alis_fıyatı] = @alis_fıyatı WHERE [telefon_ıd] = @telefon_ıd">
        <DeleteParameters>
            <asp:Parameter Name="telefon_ıd" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="marka" Type="String" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="stok_adedi" Type="String" />
            <asp:Parameter Name="girıs_tarihi" Type="String" />
            <asp:Parameter Name="alis_fıyatı" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="marka" Type="String" />
            <asp:Parameter Name="model" Type="String" />
            <asp:Parameter Name="stok_adedi" Type="String" />
            <asp:Parameter Name="girıs_tarihi" Type="String" />
            <asp:Parameter Name="alis_fıyatı" Type="String" />
            <asp:Parameter Name="telefon_ıd" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="telefon_ıd" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>


            <asp:BoundField DataField="telefon_ıd" HeaderText="telefon_ıd" SortExpression="telefon_ıd" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" />
            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
            <asp:BoundField DataField="stok_adedi" HeaderText="stok_adedi" SortExpression="stok_adedi" />
            <asp:BoundField DataField="girıs_tarihi" HeaderText="girıs_tarihi" SortExpression="girıs_tarihi" />
            <asp:BoundField DataField="alis_fıyatı" HeaderText="alis_fıyatı" SortExpression="alis_fıyatı" />
        </Columns>
    </asp:GridView>
</asp:Content>
