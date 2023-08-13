<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminGiris.aspx.cs" Inherits="TelefonWeb.AdminGiris" %>


<!DOCTYPE html>
<html lang="tr">
<head>
    <title>Kullanıcı Girişi</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" type="image/png" href="Login_v1/images/icons/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="Login_v1/vendor/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="Login_v1/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="Login_v1/vendor/animate/animate.css">

    <link rel="stylesheet" type="text/css" href="Login_v1/vendor/css-hamburgers/hamburgers.min.css">

    <link rel="stylesheet" type="text/css" href="Login_v1/vendor/select2/select2.min.css">

    <link rel="stylesheet" type="text/css" href="Login_v1/css/util.css">
    <link rel="stylesheet" type="text/css" href="Login_v1/css/main.css">

    <meta name="robots" content="noindex, follow">
    <script nonce="9479ef19-687b-4f59-9b72-1d0f09372726">(function (w, d) { !function (a, b, c, d) { a[c] = a[c] || {}; a[c].executed = []; a.zaraz = { deferred: [], listeners: [] }; a.zaraz.q = []; a.zaraz._f = function (e) { return function () { var f = Array.prototype.slice.call(arguments); a.zaraz.q.push({ m: e, a: f }) } }; for (const g of ["track", "set", "debug"]) a.zaraz[g] = a.zaraz._f(g); a.zaraz.init = () => { var h = b.getElementsByTagName(d)[0], i = b.createElement(d), j = b.getElementsByTagName("title")[0]; j && (a[c].t = b.getElementsByTagName("title")[0].text); a[c].x = Math.random(); a[c].w = a.screen.width; a[c].h = a.screen.height; a[c].j = a.innerHeight; a[c].e = a.innerWidth; a[c].l = a.location.href; a[c].r = b.referrer; a[c].k = a.screen.colorDepth; a[c].n = b.characterSet; a[c].o = (new Date).getTimezoneOffset(); if (a.dataLayer) for (const n of Object.entries(Object.entries(dataLayer).reduce(((o, p) => ({ ...o[1], ...p[1] })), {}))) zaraz.set(n[0], n[1], { scope: "page" }); a[c].q = []; for (; a.zaraz.q.length;) { const q = a.zaraz.q.shift(); a[c].q.push(q) } i.defer = !0; for (const r of [localStorage, sessionStorage]) Object.keys(r || {}).filter((t => t.startsWith("_zaraz_"))).forEach((s => { try { a[c]["z_" + s.slice(7)] = JSON.parse(r.getItem(s)) } catch { a[c]["z_" + s.slice(7)] = r.getItem(s) } })); i.referrerPolicy = "origin"; i.src = "/cdn-cgi/zaraz/s.js?z=" + btoa(encodeURIComponent(JSON.stringify(a[c]))); h.parentNode.insertBefore(i, h) };["complete", "interactive"].includes(b.readyState) ? zaraz.init() : a.addEventListener("DOMContentLoaded", zaraz.init) }(w, d, "zarazData", "script"); })(window, document);</script>
</head>
<body>
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <div class="login100-pic js-tilt" data-tilt>
                    <img src="Login_v1/images/img-01.png" alt="IMG">
                </div>
                <form class="login100-form validate-form" runat="server">
                    <span class="login100-form-title">KULLANICI GİRİŞİ
                    </span>
                    <div class="wrap-input100 validate-input" data-validate="Kullanıcı adı gerekli">
                        <asp:TextBox ID="txtkullanıcıadı" Cssclass="input100" runat="server" placeholder="Kullanıcı Adı"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                        </span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate="Şifre gerekli">
                        <asp:TextBox ID="txtsifre" Cssclass="input100" type="password" runat="server" placeholder="Şifre"></asp:TextBox>
                        <span class="focus-input100"></span>
                        <span class="symbol-input100">
                            <i class="fa fa-lock" aria-hidden="true"></i>
                        </span>
                    </div>
                    <div class="container-login100-form-btn">
                        
                        <asp:Button ID="Button1" runat="server" Text="Giriş" CssClass="login100-form-btn" OnClick="Button1_Click" />
                    </div>
                    <div class="text-center p-t-12">
                        <span class="txt1">
                            Kullanıcı Adı ve Şifre
                        </span>
                        <a class="txt2" href="#">
                            Unuttum
                        </a>
                    </div>
                    <p style="align-content:center;">
                        <asp:Label ID="Label1" runat="server" ForeColor="#CC0000"></asp:Label></p>
                    <div class="text-center p-t-136">
                        <a class="txt2" href="#">
                            Yeni Hesap Oluştur
                            <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="Login_v1/vendor/jquery/jquery-3.2.1.min.js"></script>

    <script src="Login_v1/vendor/bootstrap/js/popper.js"></script>
    <script src="Login_v1/vendor/bootstrap/js/bootstrap.min.js"></script>

    <script src="Login_v1/vendor/select2/select2.min.js"></script>

    <script src="Login_v1/vendor/tilt/tilt.jquery.min.js"></script>
    <script>
        $('.js-tilt').tilt({
            scale: 1.1
        })
    </script>

    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-23581568-13');
    </script>

    <script src="Login_v1/js/main.js"></script>
    <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816" integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw==" data-cf-beacon='{"rayId":"7cde3a95a83d50e8","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2023.4.0","si":100}' crossorigin="anonymous"></script>
</body>
</html>

