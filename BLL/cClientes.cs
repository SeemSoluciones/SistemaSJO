using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.ClienteTableAdapters;
using System.Data;

namespace BLL
{
    public class cClientes
    {

        private ClientesTableAdapter cliente;
        private CreditosTableAdapter creditos;
        private BCCTableAdapter bcc;
        

        private ClientesTableAdapter CLIENTES
        {
            get
            {
                if (cliente == null)
                    cliente = new ClientesTableAdapter();
                return cliente;
            }
        }

        private ClientesssTableAdapter cliente2;


        private ClientesssTableAdapter CLIENTES2
        {
            get
            {
                if (cliente2 == null)
                    cliente2 = new ClientesssTableAdapter();
                return cliente2;
            }
        }

        private CreditosTableAdapter CREDTIO
        {
            get
            {
                if (creditos == null)
                    creditos = new CreditosTableAdapter();
                return creditos;
            }
        }

        private BCCTableAdapter BCC
        {
            get
            {
                if (bcc == null)
                    bcc = new BCCTableAdapter();
                return bcc;
            }
        }

        public string InsertarInfoCredito(decimal crdmax, int dias, int idClie )
        {
            try
            {
                CREDTIO.InsertarInfoCredito(crdmax, dias, idClie);
                return "Exitoso";

            }
            catch
            {
                return "Error, no fue ingresado";
            }
        }

        public string EditarInfoCredito(decimal crdmax, int dias, int idClie)
        {
            try
            {
                CREDTIO.EditarInfoCredito(crdmax, dias, idClie);
                return "Exitoso";

            }
            catch
            {
                return "Error, no fue ingresado";
            }
        }


     

        public DataTable ListaCreditoMax( int Nit)
        {
            DataTable tabla = new DataTable();
            tabla = CREDTIO.ListaLimiteCredito(Nit);
            return tabla;
        }
       public string InsertarCliente(int nit, string nom, string ape, string dire, int tel, int cel, string empre, string correo)
        {
            try
            {
                CLIENTES.InsertarCliente(nit, nom, ape, dire, tel, cel, empre, correo);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }
        
        public string InsertarCredito(decimal monto, int idCliente, int idVenta)
        {
            try
            {
                string msj = "";
                msj = CLIENTES.InsertCredito(monto, idCliente, idVenta).ToString();
                return msj;

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string InsertarCreditoPorItem(int codigo, int Id_Cre)
        {
            try
            {
                CLIENTES.InsertarCreditoXitem(codigo, Id_Cre);
                return "Datos ingresados correctamente";
            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string InsertarAbonoCredito(decimal montoAbonado, decimal saldoPendiente, int idCredito)
        {
            try
            {
                CLIENTES.InsertAbonoCredito(montoAbonado,saldoPendiente, idCredito);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string InsertarAbonoCredito2(decimal montoAbonado, decimal saldoPendiente, int idCredito, int idItemXP)
        {
            try
            {
                CLIENTES.InsertAbonoCredito2(montoAbonado, saldoPendiente, idCredito, idItemXP);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }


        public string EditarCreditoXitem(int idCreditoXitem)
        {
            try
            {
                CLIENTES.EditarCreditoXitem(idCreditoXitem);
                return "1";
            }
            catch
            {
                return "Error, no fue posible editar";
            }
        }

        public string CreditoPagado(bool estado, int idCredito)
        {
            try
            {
                CLIENTES.CreditoPagado(estado, idCredito);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }


        public DataTable SaldoPendiente(int nit)
        {
            DataTable tabla = new DataTable();
            tabla = CREDTIO.SaldoPendienteFecha(nit);
            return tabla;
            
        }
        public string AbonarCredito(decimal montoAbonado, bool estado, int idCliente, int idventa)
        {
            try
            {
                CLIENTES.AbonarCredito(montoAbonado, estado, idCliente, idventa);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public int SiExisteCliente(int IdCliente)
        {
            int resul;
            resul = Convert.ToInt32(CLIENTES.SiExsisteCliente(IdCliente));
            return resul;
        }

        public int SiExisteCredito(int IdCliente)
        {
            int resul;
            resul = Convert.ToInt32(CLIENTES.SiExisteCredito(IdCliente));
            return resul;
        }

        public DataTable ListaClienteCredito (int NIT)
        {
            DataTable tb = new DataTable();
            tb = BCC.GetData(NIT);
            return tb;
        }

        public DataTable ListaUncliente(int nit)
        {
            DataTable tabla = new DataTable();
            tabla = CLIENTES2.BuscarClientess(nit);
            return tabla;
        }

    }
}
