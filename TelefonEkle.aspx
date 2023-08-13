<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetim/Admin.Master" AutoEventWireup="true" CodeBehind="TelefonEkle.aspx.cs" Inherits="TelefonWeb.TelefonEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 class="page-title">Yeni Telefon Ekleme Sayfası </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div class="col-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <div class="forms-sample">
                    <h4 class="card-title">Eklenecek Telefon Bilgilerini giriniz</h4>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">Marka</label>
                        <div class="col-sm-9">
                            <asp:DropDownList class="form-control" ID="Dropdownmarka" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Dropdownmarka_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Model</label>
                    <div class="col-sm-9">
                        <asp:DropDownList class="form-control" ID="Dropdownmodel" runat="server">
                            <asp:ListItem Enabled="true" Text="" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Hafıza : </label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txthafıza" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Ekran Boyutu</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtekranboyut" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Kamera Çözünürlüğü</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtkameracöz" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Ön (selfie) Kamera</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtonkamera" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Pil Gücü</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtpilgucu" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Ram</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtram" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Parmak izi/Yüz tanıma </label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtparmakyuz" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row ">
                    <label class="col-sm-3 col-form-label">Rengi</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtrengi" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Garanti Süresi</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtgarantisuresi" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row ">
                    <label class="col-sm-3 col-form-label">Satış Fiyatı</label>
                    <div class="col-sm-9">
                        <asp:TextBox class="form-control" ID="txtfiyat" runat="server" Text=""></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label>Fotoğraf Yükle</label>
                    <input type="text" name="img[]" class="file-upload-default">
                    <div class="input-group col-6">
                        <input type="text" class="form-control file-upload-info" disabled placeholder="JPG/JPEG/PNG olarak yükleme işlemini yapınız. ">
                        <div class="col-sm-9">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </div>
                    </div>
                    <div>
                        <asp:Label ID="lblresim" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <%--<button type="submit" class="btn btn-gradient-primary mr-2"runat="server" OnClick="Btn_Kydet_Click"></button>--%>
                <asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Kydet_Click" Text="Kaydet" />
                <%--<a href="../AltSayfa.Master">../AltSayfa.Master</a>KAYDET--%>
            </div>
        </div>
    </div>
    <%-- </div>
    </div>--%>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FNİLETİŞİMConnectionString %>" SelectCommand="SELECT * FROM [Telefon]"></asp:SqlDataSource>
</asp:Content>
