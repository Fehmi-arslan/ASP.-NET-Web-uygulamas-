using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services.Description;
using System.Windows.Forms;
using System.Data.Common;
using System.Collections.ObjectModel;

namespace TelefonWeb
{
    public partial class MarkaEkle : System.Web.UI.Page
    {
        //public static string marka_baglan = "Data Source=DESKTOP-9MUIAUH\\SQLEXPRESS\\FNİLETİŞİM ConnectionString;Initial Catalog=Telefon;Integrated Security=True";
        string marka_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Btn_Kaydet_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtmarka.Text)){
                MessageBox.Show("Lütfen Marka Giriniz");
                return;
            }

            string marka = txtmarka.Text.ToUpper();

            using (SqlConnection connection = new SqlConnection(marka_baglan))
            {
                String query = "INSERT INTO dbo.Marka(Marka_adı) VALUES (@Marka_adı)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@Marka_adı", SqlDbType.VarChar).Value = marka;

                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show("Marka eklendi");
                    }
                    catch (Exception ex)
                    {
                        string hata = ex.Message;
                    }
                    finally
                    {
                        connection.Close();
                    }
                    // Check Error
                    if (result < 0)
                        Console.WriteLine("Error inserting data into Database!");
                }
            }

            Response.Redirect("MarkaEkle.aspx");// Girilen telefon özelliklerini sıfırlayıp tekrardan aynı sayfaya çevirir
        }


        //public void getMarkaValue()
        //{

        //    using (SqlConnection connection = new SqlConnection(marka_baglan))
        //    {
        //        string query = "Select Marka_adı From dbo.Marka";
        //        using (SqlCommand command = new SqlCommand(query, connection))
        //        {
        //            connection.Open();
        //            SqlDataReader reader = command.ExecuteReader();
        //            GridView1.DataSource = reader;
        //            GridView1.DataBind();
        //            connection.Close();
        //        }
        //    }
        //}
    }
}

