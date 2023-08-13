using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace TelefonWeb
{
    public partial class StokDuzenle : System.Web.UI.Page
    {
        string stok_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btn_Guncelle_Click(object sender, EventArgs e)
        {
            string marka = txtmarka.Text.ToUpper();
            string model = txtmodel.Text.ToUpper();
            string stok = txtstok.Text.ToUpper();
            string giris = txtgiris.Text.ToUpper();
            string alıs = txtalıs.Text.ToUpper();

            StokGuncelle(marka, model, stok, giris, alıs);
            Response.Redirect("StokDuzenle.aspx");
        }
        private void StokGuncelle(string marka, string model, string stok, string giris, string alıs)
        {
            using (SqlConnection connection = new SqlConnection(stok_baglan))
            {
                string query = "UPDATE dbo.Stok set marka='" + txtmarka + "',model='" + txtmodel + "',stok_adedi='" + txtstok + "',giris_tarihi='" + txtgiris + "',alis_fıyatı='" + txtalıs + "'"; ;
                //String query = "UPDATE dbo.Telefon set marka='" + txtmarka + "',model='" + txtmodel + "',hafıza='" + txthafıza + "',ekran_boyutu='" + txtekran + "',kamera_coz='" + txtkamera + "',on_kamera='" + txtonkamera + "',pil_gucu='" + txtpil + "',ram='" + txtram + "',parmakızı_yuztanıma='" + txtparmak + "',rengı='" + txtrengi + "',garantı_suresi='" + txtgaranti + "',fıyat='" + txtfiyat + "',fotograf_yukle='" + lblresim + "'";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@marka", SqlDbType.VarChar).Value = marka;
                    command.Parameters.Add("@model", SqlDbType.VarChar).Value = model;
                    command.Parameters.Add("@stok_adedi", SqlDbType.Int).Value = stok;
                    //command.Parameters.Add("@giris_tarihi", SqlDbType.DateTime).Value = giris;
                    command.Parameters.Add("@alis_fıyatı", SqlDbType.VarChar).Value = alıs;

                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show("Stok Bilgileriniz başarıyla Güncellendi!!!");
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

    }
}