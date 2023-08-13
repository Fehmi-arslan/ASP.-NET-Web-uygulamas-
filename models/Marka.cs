using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TelefonWeb.Yonetim.models
{
    public class Marka
    {

        public Marka() { }

        public Marka(int Id, string MarkaAdi)
        {
            this.Id = Id;
            this.MarkaAdi = MarkaAdi;
        }

        public int Id { get; set; }

        public string MarkaAdi { get; set; }
    }
}