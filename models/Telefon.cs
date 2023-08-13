using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TelefonWeb.Yonetim.models
{
    public class Telefon
    {
        public int Id { get; set; }
        public Marka marka { get; set; }
        public Model model { get; set; }
        public string Hafiza { get; set; }
        public string EkranBoyutu { get; set; }
        public string KameraCozunurlugu { get; set; }
        public string OnKameraCozunurlugu { get; set; }
        public string PilGucu { get; set; }
        public string Ram { get; set; }
        public string ParmakYuz { get; set; }
        public string Rengi { get; set; }
        public string Garanti { get; set; }
        public int Fiyat { get; set; }

    }
}