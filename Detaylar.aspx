<%@ Page Title="" Language="C#" MasterPageFile="~/Uygulama.Master" AutoEventWireup="true" CodeBehind="Detaylar.aspx.cs" Inherits="TelefonWeb.Detaylar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPL" runat="server">
    <form class="forms-sample" runat="server">

        <div class="col-xl-4 col-lg-4 col-md-6">
            <div class="row">
                <div class="single-place mb-30">
                    <div class="place-img">
                        <img src="assets/img/service/ıphone13.jpg" alt="">
                    </div>
                    <div class="place-cap">
                        <div class="place-cap-right">
                            <h3><a href="Detaylar.aspx">Iphone 13 (128GB) MAVİ</a></h3>
                            <p class="TL">27.000 ₺ <span></span></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <br />
        <br />
        <div class="col-18 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="form-group">
                                <label for="exampleInputName1">Ad-Soyad : </label>
                                <input class="form-control valid" name="adsoyad" id="adsoyad" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">İşlem Tarihi</label>
                                <input class="form-control valid" name="islem" id="islemtarih" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Fiyat: </label>
                                <input class="form-control valid" name="fıyat" id="fiyat" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Adres:</label>
                                <input class="form-control valid" name="adres" id="adres" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">E-posta : </label>
                                <input class="form-control valid" name="posta" id="mail" onfocus="this.placeholder = ''" onblur="this.placeholder = 'E-mail'" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputName1">Numara</label>
                                <input class="form-control valid" name="numara" id="numara" onfocus="this.placeholder = ''" onblur="this.placeholder = ''" placeholder="">
                            </div>
                            <div class="form-group mt-3">
                                <%--<asp:Button ID="btnSave" runat="server" Type="Submit" class="btn btn-gradient-primary mr-2" OnClick="Btn_Kydet_Click" Text="Kaydet" />--%>
                                <button id="btnSave" runat="server" type="submit" class="btn btn-gradient-primary mr-2">SATIN AL</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%-- </div>
        </div>--%>
    </form>
</asp:Content>
