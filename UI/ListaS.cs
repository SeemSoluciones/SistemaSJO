using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UI
{
    public class ListaS
    {
        public string Columna1 { get; set; }
        public string Columna2 { get; set; }



        public override string ToString()
        {
            return "ID: " + Columna1 + "   Name: " + Columna2;
        }
        public override bool Equals(object obj)
        {
            if (obj == null) return false;
            ListaS objAsPart = obj as ListaS;
            if (objAsPart == null) return false;
            else return Equals(objAsPart);
        }
    }
}