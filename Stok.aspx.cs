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
using Microsoft.Ajax.Utilities;

namespace TelefonWeb
{
    public partial class Stok : System.Web.UI.Page
    {
        string stok_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString;
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
        protected void Btn_Guncelle_Click(object sender, EventArgs e)
        {

            string marka = Dropdownmarka.Text.ToUpper();
            string model = Dropdownmodel.Text.ToUpper();
            string stok = txtstok.Text;
            string giris = DateTime.Now.ToString("dd/MM/yyyy");
            string alıs = txtalıs.Text.ToUpper();
            bool markaModelVarmı = MarkaModelKontrol(marka, model);//Stok kaydı olmayan marka&modeli güncellememeli
            if (!markaModelVarmı)
            {
                StokGuncelle(marka, model, stok, giris, alıs);
            }
            
            Response.Redirect("Stok.aspx");
        }
        protected void Btn_Kydet_Click(object sender, EventArgs e)
        {
            string marka = Dropdownmarka.Text.ToUpper();
            string model = Dropdownmodel.Text.ToUpper();
            string stok = txtstok.Text.ToUpper();
            string giris = txtgiris.Text;
            string alıs = txtalıs.Text.ToUpper();

            StokKaydet(marka, model, stok, giris, alıs);
            Response.Redirect("Stok.aspx");
        }
        private void StokKaydet(string marka, string model, string stok, string giris, string alıs)
        {
            using (SqlConnection connection = new SqlConnection(stok_baglan))
            {
                String query = "INSERT INTO dbo.Stok(marka,model,stok_adedi,girıs_tarihi,alis_fıyatı) VALUES (@marka,@model,@stok_adedi,@girıs_tarihi,@alis_fıyatı)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@marka", SqlDbType.VarChar).Value = marka;
                    command.Parameters.Add("@model", SqlDbType.VarChar).Value = model;
                    command.Parameters.Add("@stok_adedi", SqlDbType.VarChar).Value = stok;
                    command.Parameters.Add("@girıs_tarihi", SqlDbType.VarChar).Value = giris;
                    command.Parameters.Add("@alis_fıyatı", SqlDbType.VarChar).Value = alıs;

                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show("Stok Bilgileriniz başarıyla eklendi");
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
        private void StokGuncelle(string marka, string model, string stok, string giris, string alıs)
        {
            using (SqlConnection connection = new SqlConnection(stok_baglan))
            {
                String query = "UPDATE dbo.Stok set marka='" + marka + "',model='" + model + "',stok_adedi='" + stok + "',girıs_tarihi='" + giris + "',alis_fıyatı='" + alıs + "' where marka='" + marka + "'and model='"+ model + "'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@marka", SqlDbType.VarChar).Value = marka;
                    command.Parameters.Add("@model", SqlDbType.VarChar).Value = model;
                    command.Parameters.Add("@stok_adedi", SqlDbType.VarChar).Value = stok;
                    command.Parameters.Add("@girıs_tarihi", SqlDbType.VarChar).Value = giris;
                    command.Parameters.Add("@alis_fıyatı", SqlDbType.VarChar).Value = alıs;

                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show("Stok Bilgileriniz başarıyla Güncellendi");
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

            using (SqlConnection connection = new SqlConnection(stok_baglan))
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

            using (SqlConnection connection = new SqlConnection(stok_baglan))
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

        private bool MarkaModelKontrol(string marka, string model)
        {
            bool markaModelVarMı = false;
            using (SqlConnection connection = new SqlConnection(stok_baglan))
            {
                String query = "SELECT * FROM [Stok] where marka ='" + marka +"' and model ='"+ model+"'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if(reader.HasRows  == false )
                        {
                            MessageBox.Show("Seçmiş olduğunuz marka&model için stok girişi yoktur. Güncelleme yapamazsınız!! ");
                            return markaModelVarMı = true;
                        }  
                    }
                    connection.Close();
                }
            }
            return markaModelVarMı;
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