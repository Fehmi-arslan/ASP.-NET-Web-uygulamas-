using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TelefonWeb.Yonetim.models
{
    public class Model
    {
        public Model() { }
        public Model(int Id, string ModelAdi)
        {
            this.Id = Id;
            this.ModelAdi = ModelAdi;
        }

        public int Id { get; set; }

        public string ModelAdi { get; set; }
    }
}