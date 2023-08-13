using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Windows.Forms;

namespace TelefonWeb
{
    public partial class AdminGiris : System.Web.UI.Page
    {
        string admin_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kullanici = txtkullanıcıadı.Text;
            string sifre = txtsifre.Text;
            using (SqlConnection connection = new SqlConnection(admin_baglan))
            {
                String query = "SELECT * FROM dbo.Kullanici where KullanıcıAdı=@KullanıcıAdı and Sifre=@Sifre", admin_baglan;

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    command.Parameters.Add("@KullanıcıAdı", SqlDbType.VarChar).Value = kullanici;
                    command.Parameters.Add("@Sifre", SqlDbType.VarChar).Value = sifre;

                    SqlDataReader oku = command.ExecuteReader();

                    if (oku.Read())
                    {
                        Session["Kullanici"] = oku["KullanıcıAdı"].ToString();
                        Response.Redirect("~/Yonetim/Default2.aspx");
                        //command.ExecuteNonQuery();
                    }
                    else
                    {
                        Label1.Text = "Kullanıcı Adı ve/veya Şifre hatalı tekrar deneyiniz!!!";
                    }
                    oku.Close();
                    connection.Close();
                    connection.Dispose();//Bağlantıyı yok etme
                }
            }
        }
    }
}
