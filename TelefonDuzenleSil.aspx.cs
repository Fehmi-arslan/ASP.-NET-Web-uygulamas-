using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Windows.Forms;
using System.Reflection;
using TelefonWeb.Yonetim.models;

namespace TelefonWeb
{
    public partial class TelefonDuzenleSil : System.Web.UI.Page
    {
        string telduz_baglan = WebConfigurationManager.ConnectionStrings["FNİLETİŞİMConnectionString"].ConnectionString; //veri tabanını bağladık

        public int seciliTelefonId
        {
            get { return (int)ViewState["seciliTelefonId"]; }
            set { ViewState["seciliTelefonId"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btn_Guncelle_Click(object sender, EventArgs e)
        {
            Telefon guncelTelefon = new Telefon();
            guncelTelefon.Id = seciliTelefonId;
            guncelTelefon.marka = new Marka(Convert.ToInt32(Dropdownmarka.SelectedItem.Value), Dropdownmarka.SelectedItem.Text);
            guncelTelefon.model = new Model(Convert.ToInt32(Dropdownmodel.SelectedItem.Value), Dropdownmodel.SelectedItem.Text);
            guncelTelefon.Hafiza = txthafıza.Text.ToUpper();
            guncelTelefon.EkranBoyutu = txtekran.Text.ToUpper();
            guncelTelefon.KameraCozunurlugu = txtkamera.Text.ToUpper();
            guncelTelefon.OnKameraCozunurlugu = txtonkamera.Text.ToUpper();
            guncelTelefon.PilGucu = txtpil.Text.ToUpper();
            guncelTelefon.Ram = txtram.Text.ToUpper();
            guncelTelefon.ParmakYuz = txtparmak.Text.ToUpper();
            guncelTelefon.Garanti = txtgaranti.Text.ToUpper();
            guncelTelefon.PilGucu = txtpil.Text.ToUpper();
            guncelTelefon.Rengi = txtrengi.Text.ToUpper();
            guncelTelefon.Fiyat = Convert.ToInt32(txtfiyat.Text);
            // EKLENECEK (!)
            //string rengı = txtrengi.Text.ToUpper();
            //string fotograf = lblresim.Text.ToUpper();
            //string fıyat = txtfiyat.Text;

            TelefonGuncelle(guncelTelefon);

            Response.Redirect("TelefonDuzenleSil.aspx");
        }

        private void TelefonGuncelle(Telefon telefon)
        {
            using (SqlConnection connection = new SqlConnection(telduz_baglan))
            {
                // EKLENECEK (!)
                //String query = "UPDATE dbo.Telefon set marka=@markaId, model=@modelId ,hafıza=@hafiza ,ekran_boyutu=@ekranBoyutu, kamera_coz=@kamera_coz ,on_kamera='" + txtonkamera + "',pil_gucu='" + txtpil + "',ram='" + txtram + "',parmakızı_yuztanıma='" + txtparmak + "',rengı='" + txtrengi + "',garantı_suresi='" + txtgaranti + "',fıyat='" + txtfiyat + "',fotograf_yukle='" + lblresim + "'";
                String query = "UPDATE dbo.Telefon set marka=@markaId, model=@modelId ,hafıza=@hafiza ,ekran_boyutu=@ekranBoyutu, kamera_coz=@kameraCoz ,on_kamera=@onKamera ,pil_gucu=@pilGucu ,ram=@ram,parmakızı_yuztanıma=@parmakızı_yuztanıma,rengı=@Rengı,garantı_suresi=@Garantı_suresi,fıyat=@Fıyat WHERE Tel_ID = @telefonId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@markaId", SqlDbType.VarChar).Value = telefon.marka.Id;
                    command.Parameters.Add("@modelId", SqlDbType.VarChar).Value = telefon.model.Id;
                    command.Parameters.Add("@hafiza", SqlDbType.VarChar).Value = telefon.Hafiza;
                    command.Parameters.Add("@ekranBoyutu", SqlDbType.VarChar).Value = telefon.EkranBoyutu;
                    command.Parameters.Add("@kameraCoz ", SqlDbType.VarChar).Value = telefon.KameraCozunurlugu;
                    command.Parameters.Add("@onKamera", SqlDbType.VarChar).Value = telefon.OnKameraCozunurlugu;
                    command.Parameters.Add("@pilGucu", SqlDbType.VarChar).Value = telefon.PilGucu;
                    command.Parameters.Add("@ram", SqlDbType.VarChar).Value = telefon.Ram;
                    command.Parameters.Add("@parmakızı_yuztanıma", SqlDbType.VarChar).Value = telefon.ParmakYuz;
                    command.Parameters.Add("@Rengı", SqlDbType.VarChar).Value = telefon.Rengi;
                    command.Parameters.Add("@Garantı_suresi", SqlDbType.VarChar).Value = telefon.Garanti;
                    command.Parameters.Add("@Fıyat", SqlDbType.VarChar).Value = telefon.Fiyat;
                    command.Parameters.Add("@telefonId", SqlDbType.Int).Value = telefon.Id;



                    //command.Parameters.Add("@Fotograf_yukle", SqlDbType.VarChar).Value = fotograf;
                    connection.Open();
                    int result = 0;
                    try
                    {
                        result = command.ExecuteNonQuery();
                        MessageBox.Show(" Telefon Bilgileri Güncellendi !!!");
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

        private Telefon TelefonGetir(int telefonId)
        {
            Telefon telefon = new Telefon();

            using (SqlConnection connection = new SqlConnection(telduz_baglan))
            {
                //String query = "SELECT * FROM dbo.Telefon WHERE Tel_ID = @telefonId";
                String query =
                    @"SELECT * FROM Telefon t 
	                    LEFT JOIN Marka ma ON t.marka = ma.ID  
                        LEFT JOIN Model mo ON t.model = mo.ID 
                    WHERE Tel_ID = @telefonId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@telefonId", SqlDbType.VarChar).Value = telefonId;

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            telefon.Id = Convert.ToInt32(reader[0].ToString());
                            //telefon.MarkaId = Convert.ToInt32(reader[1].ToString());
                            //telefon.ModelId = Convert.ToInt32(reader[2].ToString());
                            telefon.EkranBoyutu = reader[4].ToString();
                            telefon.KameraCozunurlugu = reader[5].ToString();
                            telefon.Hafiza = reader[3].ToString();
                            telefon.OnKameraCozunurlugu = reader[6].ToString();
                            telefon.PilGucu = reader[7].ToString();
                            telefon.Ram = reader[8].ToString();
                            telefon.ParmakYuz = reader[9].ToString();
                            telefon.Rengi = reader[10].ToString();
                            telefon.Garanti = reader[11].ToString();
                            telefon.Fiyat = Convert.ToInt32(reader[12].ToString());

                            Marka marka = new Marka();
                            marka.Id = Convert.ToInt32(reader[14].ToString());
                            marka.MarkaAdi = reader[15].ToString();
                            telefon.marka = marka;

                            Model model = new Model();
                            model.Id = Convert.ToInt32(reader[16].ToString());
                            model.ModelAdi = reader[17].ToString();
                            telefon.model = model;

                        }
                    }
                    connection.Close();
                }
            }
            return telefon;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex > -1)
            {
                int telefonId = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
                seciliTelefonId = telefonId;
                Telefon telefon = TelefonGetir(telefonId);

                Dropdownmarka.Items.Clear();
                ListItem markaListItem = new ListItem();
                markaListItem.Text = telefon.marka.MarkaAdi;
                markaListItem.Value = telefon.marka.Id.ToString();
                Dropdownmarka.Items.Add(markaListItem);
                Dropdownmarka.SelectedIndex = 0;

                Dropdownmodel.Items.Clear();
                ListItem modelListItem = new ListItem();
                modelListItem.Text = telefon.model.ModelAdi;
                modelListItem.Value = telefon.model.Id.ToString();
                Dropdownmodel.Items.Add(modelListItem);
                Dropdownmodel.SelectedIndex = 0;

                txthafıza.Text = telefon.Hafiza;
                txtekran.Text = telefon.EkranBoyutu;
                txtkamera.Text = telefon.KameraCozunurlugu;
                txtonkamera.Text += telefon.OnKameraCozunurlugu;
                txtpil.Text = telefon.PilGucu;
                txtram.Text = telefon.Ram;
                txtparmak.Text = telefon.ParmakYuz;
                txtrengi.Text = telefon.Rengi;
                txtgaranti.Text = telefon.Garanti;
                txtfiyat.Text = telefon.Fiyat.ToString();

                //MessageBox.Show("Seçili Telefon Marka Adı: " + telefon.marka.MarkaAdi.ToString());
            }

        }
    }
}