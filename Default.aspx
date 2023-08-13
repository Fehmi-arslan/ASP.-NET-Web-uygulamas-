<%@ Page Title="" Language="C#" MasterPageFile="~/Uygulama.Master" 
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TelefonWeb.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPL" runat="server">
    <form runat="server">
        <div class="slider-area ">
            <div class="slider-active">
                <div class="single-slider hero-overly  slider-height d-flex align-items-center" 
                    data-background="assets/img/hero/fnanasayfa.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-9 col-lg-9 col-md-9">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Slider Area End-->

        <!-- Our Services Start -->
        <div class="our-services servic-padding">
            <div class="container">
                <div class="row d-flex justify-contnet-center">
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-tour"></span>
                            </div>
                            <div class="services-cap">
                                <h5>20 Aktif<br>
                                    Personel</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-pay"></span>
                            </div>
                            <div class="services-cap">
                                <h5>Güvenilir Alışveriş<br>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-experience"></span>
                            </div>
                            <div class="services-cap">
                                <h5>40 Yıllık Hizmet<br>
                                    Deneyimi</h5>

                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-6">
                        <div class="single-services text-center mb-30">
                            <div class="services-ion">
                                <span class="flaticon-good"></span>
                            </div>
                            <div class="services-cap">
                                <h5>100% Müşteri<br>
                                    Memnuniyeti</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Our Services End -->

        <!-- Favourite Places Start -->
        <div class="favourite-place place-padding">
            <div class="container">
                <!-- Section Tittle -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-tittle text-center">
                            <span>İNDİRİMLİ TELEFONLAR</span>
                            <h2>Favori Telefonlar</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="assets/img/service/ıphone13.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>7.4 </span></span>
                                    <h3><a href="#">Iphone 13 (128GB) MAVİ</a></h3>
                                    <p class="TL">27.000 ₺ <span>/ SON 7 ADET</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>4 GÜN</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="single-place mb-30">
                            <div class="place-img">
                                <img src="assets/img/service/mi10t.jpg" alt="">
                            </div>
                            <div class="place-cap">
                                <div class="place-cap-top">
                                    <span><i class="fas fa-star"></i><span>7.6 </span></span>
                                    <h3><a href="#">Xiaomi Mi 10T (128GB) SİYAH</a></h3>
                                    <p class="TL">12.150 ₺ <span>/ SON 2 ADET</span></p>
                                </div>
                                <div class="place-cap-bottom">
                                    <ul>
                                        <li><i class="far fa-clock"></i>5 GÜN</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!-- Favourite Places End -->

        <!-- Support Company Start-->
        <div class="support-company-area support-padding fix">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-l-6 col-l-6">
                        <div class="support-location-img mb-50">
                            <img src="assets/img/service/fn23.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-l-6 col-lg-6">
                        <div class="right-caption">
                            <!-- Section Tittle -->
                            <div class="section-tittle section-tittle2">
                                <span>Biz Kimiz?</span>
                                <h2>Almadan Önce
                                    <br>
                                    Tanıyın</h2>
                            </div>
                            <div class="support-caption">
                                <p>
                                    FN İletişim 1983 yılında küçük bir işletme olarak Kahramanmaraş'ın Elbistan ilçesinde kurulmuştur.Yıllar içerisinde bölgede güvenin ve kalitenin 
                                    bir numaralı durağı olan FN İletişim müşterilerine 35 yılı aşkındır hizmet vermektedir.Önceliğimiz güven ve kalite.
                                    Elbistan içi satışlarımız mevcuttur.
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
