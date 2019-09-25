﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DsProductoTableAdapters;
using System.Data;
using System.IO;
using System.Data.SqlClient;
namespace BLL
{
     public class Cproducto
    {

        private ProductoTableAdapter producto;
        private BuscarPTableAdapter buscarP;

        private ProductoTableAdapter PRODUCTO
        {
            get
            {
                if (producto == null)
                    producto = new ProductoTableAdapter();
                return producto;
            }
        }


        private BuscarPTableAdapter BUSCARP
        {
            get
            {
                if (buscarP == null)
                    buscarP = new BuscarPTableAdapter();
                return buscarP;
            }
        }


       public DataTable BuscarProducto(string codigo)
        {
            DataTable tabla = new DataTable();
            tabla = BUSCARP.BuscarProductoXcod(codigo);
            return tabla;
        }

        public DataTable BuscarProducto2(string codigo)
        {
            DataTable tabla = new DataTable();
            tabla = BUSCARP.BuscarProductoXcodigo(codigo);
            return tabla;
        }
        public DataTable ListaProducto()
        {
            DataTable Lista = new DataTable();
            Lista = PRODUCTO.GetData();
            return Lista;
        }

        #region Producto
        public string InsertarProducto(string codigo,string codigo2,  string NomP, string Desc, byte[] img, int idRubro ,int IDprov, int IDmarProd)
        {
           try
            {
                PROVEEDOR.InsertarProducto(codigo,codigo2 , NomP, Desc, img, idRubro , IDprov, IDmarProd);
                return "Datos ingresados correctamente";

           }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string EditarProducto(string codigo, string codigo2, string NomP, string Desc,  byte[] img, int idRubro, int IDprov, int IDmarProd)
        {
            try
            {
                PROVEEDOR.EditarProducto(codigo, codigo2, NomP, Desc, img, idRubro, IDprov, IDmarProd);
                return "Datos actualizado correctamente";

            }
            catch
            {
                return "Error, datos no Actualizados";
            }
        }


        public string EliminarProdcuto(int IDP)
        {
            try
            {
                PROVEEDOR.EliminarProducto(IDP);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }


        public int SiExisteProducto(int idProducto)
        {
            int resul;
            resul =   Convert.ToInt16( PROVEEDOR.SiExisteProducto(idProducto));
            return resul;
        }
        #endregion

        #region Categoria
        private CategoriaTableAdapter categoria;

        private CategoriaTableAdapter CATEGORIA
        {
            get
            {
                if (categoria == null)
                    categoria = new CategoriaTableAdapter();
                return categoria;
            }
        }


        public DataTable ListaCategoria()
        {
            DataTable Tabla = new DataTable();
            Tabla = CATEGORIA.ListaCategoria();
            return Tabla;
        }


        public string InsertaRubro(string Rubro, int idLinea)
        {
            try
            {
                PROVEEDOR.InsertarRubro(Rubro, idLinea);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string InsertaModelo(string Modelo, int idMarca)
        {
            try
            {
                PROVEEDOR.InsertarModelo(Modelo, idMarca);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string InsertaMarca(string Marca)
        {
            try
            {
                PROVEEDOR.InsertarMarca(Marca);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }


        public  int ID_Rubro(string codigo)
        {
           int res = Convert.ToInt32(PROVEEDOR.ID_RubroXcodigo(codigo));
            return res;
        }

        public int ID_Rubro2(string codigo2)
        {
            int res = Convert.ToInt32(PROVEEDOR.ID_RubroXEquivalencia(codigo2));
            return res;
        }


        public string InsertarMarcaProd(string marca)
        {
            try
            {
                PROVEEDOR.InsertMarcaProd(marca);
                return "EXito!";
            }
            catch
            {
                return "Error";
            }
        }

        public string InsertarMedida(string medida)
        {
            try
            {
                PROVEEDOR.InsertarMedida(medida);
                return "EXito!";
            }
            catch
            {
                return "Error";
            }
        }
        #endregion

        #region Proveedor
        private ProveedorTableAdapter proveedor;

        private ProveedorTableAdapter PROVEEDOR
        {
            get
            {
                if (proveedor == null)
                    proveedor = new ProveedorTableAdapter();
                return proveedor;
            }
        }

        public int SiExisteProveedor(string codigo)
        {
            
            return Convert.ToInt32(PROVEEDOR.SiExisteproveedor(codigo));
            
        }
        public string nuevoProvedor(string codigo, string prove, string direc, int tel, int nit)
        {
            try
            {
                PROVEEDOR.InsertarProveedor(codigo, prove, direc, tel, nit);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }
        #endregion

        #region Productos por encargo
        public string nuevoEncargo(DateTime fechaE, decimal money, string descrip, string idProd, int idCl, byte[] ubicacion, decimal precioreal)
        {
            try
            {
               


                PROVEEDOR.InsertarProdXencargo(fechaE, money, descrip, ubicacion,idProd, idCl, precioreal);
                return "Producto por pedidos ingreado correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string EliminarEncargo(int idProd)
        {
            try
            {
                PROVEEDOR.ProdxEnPositivo(idProd);
                return "Producto entregado con exitos";
            }
            catch
            {
                return "Error, no se realizo cambios";
            }
        }
        #endregion

        #region VENTA
        public string InsertarVenta(decimal subtotal, decimal descuento, decimal total, decimal iva, int idEmp, int idCaja)
        {
            try
            {

                string msj = "";

               msj = PROVEEDOR.InsertVenta(subtotal, descuento, total, iva, idEmp, idCaja).ToString();
                return msj;
            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string InsertarDetalleVenta(int cantidad, decimal preVenta, decimal total, int IDVenta, string IDprod, int Tpago, int idStock)
        {
            try
            {
                PROVEEDOR.InsertDetalleVenta(cantidad, preVenta, total, IDVenta, IDprod, Tpago, idStock);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }
        public string EditarDetalleVenta(int cantidad, decimal total, int idDetalleV)
        {
            try
            {
                PROVEEDOR.EditarDetalleVenta(cantidad, total, idDetalleV);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string EliminarDetallV(int idDetalleV)
        {
            try
            {
                PROVEEDOR.EliminarDetalleVenta(idDetalleV);
                return "Eliminado";
            }
            catch
            {
                return "Error";
            }
        }

        public string EditarStockDevol(int cant, int IdStock)
        {
            try
            {
                PROVEEDOR.EditarStockDevol(IdStock, cant);
                return "Editado";
            }
            catch
            {
                return "Error";
            }
        }


        #endregion

        #region COMPRA
        public string InsertarCompra(decimal total, string Nofac, int Idprov)
        {
            try
            {

                string msj = "";

                msj = PROVEEDOR.InsertCompra(total, Nofac, Idprov).ToString();
                return msj;
            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }

        public string InsertarDetalleCompra(int cantidad, decimal precioU, decimal total, string IDprod, int IDstock , int IDcompr)
        {
            try
            {
                PROVEEDOR.InsertDetalleCompra(cantidad, precioU, total, IDprod, IDstock, IDcompr);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }
        #endregion

        #region STOCK
        public int CantidadProductoStock(int Idprod, int idTienda)
        {
            int cant;
              cant =   Convert.ToInt32(PROVEEDOR.CantidadStock(Idprod, idTienda));
            return cant;
        }


        public void InsertarStock(int cant, int cantM, string ubic, decimal precioU, decimal precioV, string codProd, int idAno, int IdTienda, int IdMedid)
        {
           
                PROVEEDOR.InsertarStock(cant, cantM, ubic, precioU, precioV, codProd, idAno, IdTienda, IdMedid);
               // return  "Si se pudo";
           
         
        }

        public string EditarStock(int IDexist, int cantM, string ubic, decimal precioU, decimal preci)
        {
            try
            {
                PROVEEDOR.EditarStock(IDexist, cantM, ubic, precioU, preci);
                return "Datos actualizado correctamente";
            }
            catch
            {
                return "Error, Datos no actualizdo";
            }
        }

        public string exportarStock(int cantidad, int idTiend, int idanio, string codio, int idStock)
        {
            string ms;
            try
            {
                return ms = PROVEEDOR.ExportarStock(cantidad, idTiend, idanio, codio, idStock).ToString();
            }
            catch
            {
                return "Error, no se exporto";
            }
        }

        public int SiExisteStock(string idProd, int idAnio, int idTienda)
        {
            return Convert.ToInt32(PROVEEDOR.SiExisteStock(idAnio, idTienda, idProd));
        }
        #endregion

        #region
        public string InsertarEstdos(int idVenta, int idTienda)
        {
            try
            {
                PROVEEDOR.InsertEstados(idVenta, idTienda);
                return "Datos ingresados correctamente";

            }
            catch
            {
                return "Error, datos no ingresado";
            }
        }
        #endregion
    }
}