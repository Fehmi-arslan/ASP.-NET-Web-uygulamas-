<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.Master" AutoEventWireup="true" CodeBehind="Siparis.aspx.cs" Inherits="TelefonWeb.Siparis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">Sipariş Oluştur </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="col-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="forms-sample">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Ad Soyad </label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtadsoyad" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">TC.NO</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtTC" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Adres</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txtadres" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Telefon</label>
                        <div class="col-sm-9">
                            <asp:TextBox class="form-control" ID="txttelno" runat="server" Text=""></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Marka</label>
                        <div class="col-sm-9">
                            <asp:DropDownList class="form-control" ID="dropmarka" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Dropdownmarka_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Model</label>
                        <div class="col-sm-9">
                            <asp:DropDownList class="form-control" ID="dropmodel" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Dropdownmodel_SelectedIndexChanged">
                                <asp:ListItem Enabled="true" Text="" Value="-1"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:GridView ID="GridView2" CssClass="table" runat="server"></asp:GridView>
                </div>
                <div>
                    <asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Kaydet_Click" Text="Kaydet" />
                </div>

            </div>
        </div>
    </div>
    <div class="col-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FNİLETİŞİMConnectionString %>" 
                    SelectCommand=" SELECT S.ad_soyad, S.tc ,S.adres,S.tel_no,Ma.Marka_adı as marka,Mo.Model_adı as model, (T.fıyat- So.alis_fıyatı ) as KarZarar
                                    FROM  [Siparis] as S 
                                    LEFT JOIN Model as Mo ON Mo.ID = S.model
                                    LEFT JOIN Telefon as T ON S.model =T.model 
                                    LEFT JOIN Marka as Ma ON Ma.ID = S.marka
                                    LEFT JOIN Stok as So ON  So.model = S.model"
                    >
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ad_soyad" HeaderText="ad_soyad" SortExpression="ad_soyad" />
                        <asp:BoundField DataField="tc" HeaderText="tc" SortExpression="tc" />
                        <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
                        <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" />
                        <asp:BoundField DataField="model" HeaderText="model" SortExpression="model" />
                        <asp:BoundField DataField="tel_no" HeaderText="tel_no" SortExpression="tel_no" />
                        <asp:BoundField DataField="KarZarar" HeaderText="Kar/Zarar" SortExpression="KarZarar" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

