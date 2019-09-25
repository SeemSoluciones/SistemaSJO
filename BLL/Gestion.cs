using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.GestionTableAdapters;
namespace BLL
{
    public class Gestion
    {
        private TiendaTableAdapter tienda;
        private TipoPagoTableAdapter tipoP;

        private TiendaTableAdapter TIENDA
        {
            get
            {
                if (tienda == null)
                    tienda = new TiendaTableAdapter();
                return tienda;
            }
        }

        private TipoPagoTableAdapter TIPOP
        {
            get
            {
                if (tipoP == null)
                    tipoP = new TipoPagoTableAdapter();
                return tipoP; 
            }
        }

        public string InsertarTienda(string nom, int tel, string dire)
        {
            try
            {
                TIENDA.InsertTienda(nom, tel, dire);
                return "Datos ingresados correctamente";
            }
            catch
            {
                return "Error, revise los campos";
            }
        }

        public string InsertarTipoPago(string tipoPago)
        {
            try
            {
                TIPOP.InsertTipoDePago(tipoPago);
                return "Datos ingresados correctamente";
            }
            catch
            {
                return "Error!. resive los campos";
            }
        }


    }
}
