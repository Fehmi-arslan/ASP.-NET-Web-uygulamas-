<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.Master" AutoEventWireup="true" CodeBehind="StokDuzenle.aspx.cs" Inherits="TelefonWeb.StokDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">Stok Düzenleme Sayfası </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-20 grid-margin-left stretch-card">
        <div class="card">
            <div class="card-body">
                <div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Marka </label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtmarka" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Model</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtmodel" runat="server" Text=""></asp:TextBox>
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
                    <asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Guncelle_Click" Text="Güncelle" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FNİLETİŞİMConnectionString %>"
                        SelectCommand="SELECT * FROM [Stok]">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView1" CssClass="table" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="telefon_ıd" DataSourceID="SqlDataSource1">
                        <Columns>

                            <asp:BoundField DataField="telefon_ıd" HeaderText="telefon_ıd" InsertVisible="False" ReadOnly="True" SortExpression="telefon_ıd" />
                            <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" />
                            <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                            <asp:BoundField DataField="stok_adedi" HeaderText="stok_adedi" SortExpression="stok_adedi" />
                            <asp:BoundField DataField="giris_tarihi" HeaderText="giris_tarihi" SortExpression="giris_tarihi" />
                            <asp:BoundField DataField="alis_fıyatı" HeaderText="alis_fıyatı" SortExpression="alis_fıyatı" />
                        </Columns>

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
