using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Windows.Forms;
using System.Reflection;

namespace TelefonWeb
{
    public partial class TelefonEkle : System.Web.UI.Page
    {
        string tel_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString; //veri tabanını bağladık

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
        protected void Btn_Upload_Click(object sender, EventArgs e)//fotoğrafları images dosyasına kaydı ve resim için dosya seçenekleri yazıldı
        {
            if (FileUpload1.HasFile)
            {
                if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/jpg" || FileUpload1.PostedFile.ContentType == "image/png")
                {
                    string resimad = FileUpload1.FileName.ToString();
                    FileUpload1.SaveAs(Server.MapPath("~/images" + resimad));
                    lblresim.Text = resimad.ToString();
                }
                else
                {
                    lblresim.Text = "Lütfen jpeg,jpg veya png uzantılı resim seçin";
                }
            }
            else
            { lblresim.Text = "Lütfen bir resim giriniz!!"; }
        }
        protected void Btn_Kydet_Click(object sender, EventArgs e)
        {
            string marka = Dropdownmarka.Text.ToUpper();
            string model = Dropdownmodel.Text.ToUpper();
            string hafıza = txthafıza.Text.ToUpper();
            string ekranboyut = txtekranboyut.Text.ToUpper();
            string kameracoz = txtkameracöz.Text.ToUpper();
            string onkamera = txtonkamera.Text.ToUpper();
            string pılgucu = txtpilgucu.Text.ToUpper();
            string ram = txtram.Text.ToUpper();
            string parmakyuz = txtparmakyuz.Text.ToUpper();
            string garantı = txtgarantisuresi.Text.ToUpper();
            string rengı = txtrengi.Text.ToUpper();
            string fotograf = lblresim.Text.ToUpper();
            string fıyat = txtfiyat.Text;

            TelefonKaydet(marka, model, hafıza, ekranboyut, kameracoz, onkamera, pılgucu, ram,
             parmakyuz, garantı, rengı, fotograf, fıyat);

            Response.Redirect("TelefonEkle.aspx");// Girilen telefon özelliklerini sıfırlayıp tekrardan aynı sayfaya çevirir
        }


        private void TelefonKaydet(string marka, string model, string hafıza, string ekranboyut, string kameracoz, string onkamera,
            string pılgucu, string ram, string parmakyuz, string garantı, string rengı, string fotograf, string fıyat)
        {
            using (SqlConnection connection = new SqlConnection(tel_baglan))
            {
                String query = "INSERT INTO dbo.Telefon(marka,model,hafıza,ekran_boyutu,kamera_coz,on_kamera,pil_gucu,ram,parmakızı_yuztanıma,rengı,garantı_suresi,fıyat,fotograf_yukle) VALUES (@marka,@model,@hafıza,@ekran_boyutu,@kamera_coz,@on_kamera,@pil_gucu,@ram,@parmakızı_yuztanıma,@rengı,@garantı_suresi,@fıyat,@fotograf_yukle)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@marka", SqlDbType.VarChar).Value = marka;
                    command.Parameters.Add("@model", SqlDbType.VarChar).Value = model;
                    command.Parameters.Add("@hafıza", SqlDbType.VarChar).Value = hafıza;
                    command.Parameters.Add("@ekran_boyutu", SqlDbType.VarChar).Value = ekranboyut;
                    command.Parameters.Add("@kamera_coz", SqlDbType.VarChar).Value = kameracoz;
                    command.Parameters.Add("@on_kamera", SqlDbType.VarChar).Value = onkamera;
                    command.Parameters.Add("@pil_gucu", SqlDbType.VarChar).Value = pılgucu;
                    command.Parameters.Add("@ram", SqlDbType.VarChar).Value = ram;
                    command.Parameters.Add("@parmakızı_yuztanıma", SqlDbType.VarChar).Value = parmakyuz;
                    command.Parameters.Add("@rengı", SqlDbType.VarChar).Value = rengı;
                    command.Parameters.Add("@garantı_suresi", SqlDbType.VarChar).Value = garantı;
                    command.Parameters.Add("@fıyat", SqlDbType.VarChar).Value = fıyat;
                    command.Parameters.Add("@fotograf_yukle", SqlDbType.VarChar).Value = fotograf;
                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show("Yeni Telefon Bilgileri başarıyla eklendi");
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

            using (SqlConnection connection = new SqlConnection(tel_baglan))
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

            using (SqlConnection connection = new SqlConnection(tel_baglan))
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
                        }
                    }
                    connection.Close();
                }
            }
            return optionList;
        }

        protected void Dropdownmarka_SelectedIndexChanged(object sender, EventArgs e)
        {
            Dropdownmodel.Items.Clear();
            int markaId = Convert.ToInt32(Dropdownmarka.SelectedItem.Value);
            List<ListItem> modeller = ModelGetır(markaId);
            foreach (var model in modeller)
            {
                Dropdownmodel.Items.Add(model);
            }
        }
    }
}