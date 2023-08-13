using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Windows.Forms;
using System.Data;

namespace TelefonWeb
{
    public partial class ModelEkle : System.Web.UI.Page
    {
        string model_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<ListItem> markalar = MarkaGetır();
                foreach (var marka in markalar)
                {
                    Dropdownmarka.Items.Add(marka);
                }
            }

        }
        protected void Btn_Kydet_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtmodel.Text))
            {
                MessageBox.Show("Lütfen Model Giriniz");
                return;
            }

            string model = txtmodel.Text.ToUpper();//Model'e girilen text'i büyük harf girer
            string marka = Dropdownmarka.Text.ToUpper();

            using (SqlConnection connection = new SqlConnection(model_baglan))
            {
                String query = "INSERT INTO dbo.Model(Model_adı,Marka_id) VALUES (@Model_adı,@Marka_id)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@Model_adı", SqlDbType.VarChar).Value = model;
                    command.Parameters.Add("@Marka_id", SqlDbType.VarChar).Value = marka;

                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show("Model eklendi");
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
            //SqlConnection baglan = new SqlConnection(model_baglan);
            //baglan.Open();
            //SqlCommand komut = new SqlCommand("insert into Model(Model_adı,Model_id) values (@Model_adı,@Marka_id)", baglan);
            //komut.Parameters.AddWithValue("@Model_adı", txtmodel.Text.ToString());
            //komut.Parameters.AddWithValue("@Marka_id", txtmarkaıd.Text.ToString());
            //baglan.Close();
            Response.Redirect("ModelEkle.aspx"); // Girilen telefon özelliklerini sıfırlayıp tekrardan aynı sayfaya çevirir
        }
        private List<ListItem> MarkaGetır()
        {
            List<ListItem> optionList = new List<ListItem>();

            using (SqlConnection connection = new SqlConnection(model_baglan))
            {
                String query = "SELECT * FROM dbo.Marka";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ListItem item = new ListItem();
                            item.Value = reader[0].ToString();
                            item.Text = reader[1].ToString();
                            optionList.Add(item);
                            //System.Diagnostics.Debug.WriteLine(String.Format("ID : {0}", reader[0]));
                        }
                    }
                    connection.Close();
                }
            }
            return optionList;
        }

        protected void Dropdownmarka_SelectedIndexChanged(object sender, EventArgs e)
        {
           // Dropdownmarka.Items.Clear();
           // int markaId = Dropdownmarka.SelectedItem.Value();
            List<ListItem> modeller = MarkaGetır();
            foreach (var marka in modeller)
            {
                Dropdownmarka.Items.Add(marka);
            }
        }
    }
}