using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TelefonWeb.Yonetim
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Kullanici"] == null)
            {
                Response.Redirect("~/AdminGiris.aspx");
            }
            else
            {
                lblkullanici1.Text = Session["Kullanici"].ToString();
                lblkullanici2.Text = Session["Kullanici"].ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Remove("Kullanici"); //kullanıcıyı sil
            Session.Abandon();//yok et
            Response.Redirect("~/AdminGiris.aspx");
        }
    }
}