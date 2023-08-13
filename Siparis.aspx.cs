using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Windows.Forms;
using System.Reflection;
using TelefonWeb.Yonetim.models;

namespace TelefonWeb
{
    public partial class Siparis : System.Web.UI.Page
    {

        public string seciliMarkaId
        {
            get { return (string)ViewState["seciliMarkaId"]; }
            set { ViewState["seciliMarkaId"] = value; }
        }

        public string seciliModelId
        {
            get { return (string)ViewState["seciliModelId"]; }
            set { ViewState["seciliModelId"] = value; }
        }

        string siparis_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString; //veri tabanını bağladık
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<ListItem> markalar = MarkaGetır();
                foreach (var marka in markalar)
                {
                    dropmarka.Items.Add(marka);
                }
            }
        }
        protected void Btn_Kaydet_Click(object sender, EventArgs e)
        {
            string adsoyad = txtadsoyad.Text;
            string tc = txtTC.Text.ToUpper();
            string adres = txtadres.Text.ToUpper();
            string telno = txttelno.Text;
            string marka = dropmarka.Text.ToUpper();
            string model = dropmodel.Text.ToUpper();
            

            SiparisKaydet(adsoyad, tc, adres, marka, model, telno);

            Response.Redirect("Siparis.aspx");// Girilen telefon özelliklerini sıfırlayıp tekrardan aynı sayfaya çevirir
        }
        private void SiparisKaydet(string adsoyad, string tc, string adres, string marka, string model, string telno)
        {
            using (SqlConnection connection = new SqlConnection(siparis_baglan))
            {
                String query = "INSERT INTO dbo.Siparis(ad_soyad,tc,adres,tel_no,marka,model) VALUES (@ad_soyad,@tc,@adres,@tel_no,@marka,@model)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@ad_soyad", SqlDbType.VarChar).Value = adsoyad;
                    command.Parameters.Add("@tc", SqlDbType.VarChar).Value = tc;
                    command.Parameters.Add("@adres", SqlDbType.VarChar).Value = adres;
                    command.Parameters.Add("@tel_no", SqlDbType.VarChar).Value = telno;
                    command.Parameters.Add("@marka", SqlDbType.VarChar).Value = marka;
                    command.Parameters.Add("@model", SqlDbType.VarChar).Value = model;
                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show("Sipariş Bilgileri Sisteme YÜKLENDİ!!");
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
        }
        private List<ListItem> MarkaGetır()
        {
            List<ListItem> optionList = new List<ListItem>();

            using (SqlConnection connection = new SqlConnection(siparis_baglan))
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

        private List<ListItem> ModelGetır(int markaId)
        {
            List<ListItem> optionList = new List<ListItem>();

            using (SqlConnection connection = new SqlConnection(siparis_baglan))
            {
                String query = "SELECT * FROM dbo.Model WHERE Marka_id = @markaId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    command.Parameters.Add("@markaId", SqlDbType.Int).Value = markaId;
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
            dropmodel.Items.Clear();
            seciliMarkaId = dropmarka.SelectedItem.Value;
            int markaId = Convert.ToInt32(dropmarka.SelectedItem.Value);
            List<ListItem> modeller = ModelGetır(markaId);
            foreach (var model in modeller)
            {
                dropmodel.Items.Add(model);
            }
        }

        private DataTable TelefonGetir2(string markaId, string modelId)
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("EkranBoyutu");
            table.Columns.Add("KameraCozunurlugu");
            table.Columns.Add("Hafiza");
            table.Columns.Add("OnKameraCozunurlugu");
            table.Columns.Add("PilGucu");
            table.Columns.Add("Ram");
            table.Columns.Add("Parmak İzi/Yüz tanıma");
            table.Columns.Add("Rengi");
            table.Columns.Add("Garanti Süresi");

            using (SqlConnection connection = new SqlConnection(siparis_baglan))
            {
                String query = "SELECT * FROM dbo.Telefon WHERE marka = @markaId AND model = @modelId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@markaId", SqlDbType.VarChar).Value = markaId;
                    command.Parameters.Add("@modelId", SqlDbType.VarChar).Value = modelId;

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            DataRow row = table.NewRow();
                            row["Id"] = reader[0].ToString();
                            row["Hafiza"] = reader[3].ToString();
                            row["EkranBoyutu"] = reader[4].ToString();
                            row["KameraCozunurlugu"] = reader[5].ToString();
                            row["OnKameraCozunurlugu"] = reader[6].ToString();
                            row["PilGucu"] = reader[7].ToString();
                            row["Ram"] = reader[8].ToString();
                            row["Parmak İzi/Yüz tanıma"] = reader[9].ToString();
                            row["Rengi"] = reader[10].ToString();
                            row["Garanti Süresi"] = reader[11].ToString();
                            table.Rows.Add(row);
                        }
                    }
                    connection.Close();
                }
            }
            return table;
        }

        protected void Dropdownmodel_SelectedIndexChanged(object sender, EventArgs e)
        {
            seciliModelId = dropmodel.SelectedItem.Value;
            //Telefon telefon = TelefonGetir(seciliMarkaId, seciliModelId);
            DataTable telefonTable = TelefonGetir2(seciliMarkaId, seciliModelId);

            if (telefonTable.Rows.Count > 0)
            {
                GridView2.DataSource = telefonTable;
                GridView2.DataBind();
                //System.Diagnostics.Debug.WriteLine(String.Format("ID : {0}", telefonTable.Rows[0]["Id"]));
            }


        }
    }
}