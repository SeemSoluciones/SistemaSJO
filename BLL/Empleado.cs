using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL.EmpleadosTableAdapters;

namespace BLL
{
    public class Empleado
    {
        private EmpleadoTableAdapter empleado;
        private UsuarioTableAdapter usuario;
        private Empleado2TableAdapter empleado2;
        private Usuario1TableAdapter usuario2;


        private UsuarioTableAdapter USUARIO
        {
            get
            {
                if (usuario == null)
                    usuario = new UsuarioTableAdapter();
                return usuario;
            }

        }

        private Usuario1TableAdapter USUARIO2
        {
            get
            {
                if (usuario2 == null)
                    usuario2 = new Usuario1TableAdapter();
                return usuario2;
            }

        }
        public EmpleadoTableAdapter EMPELADO
        {
            get
            {
                if (empleado == null)
                    empleado = new EmpleadoTableAdapter();
                return empleado;
            }
        }

        public Empleado2TableAdapter EMPELADO2
        {
            get
            {
                if (empleado2 == null)
                    empleado2 = new Empleado2TableAdapter();
                return empleado2;
            }
        }
        public int Usuario(string  user, string pass)
        {
            int resul;
           resul = Convert.ToInt32(USUARIO.Buser(user, pass));
            return resul; 
        }

        public DataTable BuscarUsuario(string user, string pass )
        {
            DataTable tabla = new DataTable();
            tabla = EMPELADO2.BuscarEmpleado(user, pass);
            return tabla;
        }


        public DataTable BuscarUserYPass(string user, string pass)
        {
            DataTable tabla  = new DataTable();
            tabla = USUARIO2.UsserYPass(user, pass);
            return tabla;
        }
        public DataTable BuscarUsuario2(int idEmplead)
        {
            DataTable tabla = new DataTable();
            tabla = USUARIO2.BuscarEmpleadoxID(idEmplead);
            return tabla;
        }

        public string InsertarEmpleado(string user, string pass, int idRl, string nom, string ape, long dpi,  string dire, int tel, int idTienda )
        {
            int msj = 0;
            try
            {
               msj =  EMPELADO.InsertarEmpleado(user, pass, idRl, nom, ape, dpi, tel, dire, idTienda);
                return msj.ToString();
            }
            catch(Exception e)
            {
                return e.ToString();
            }
        }

        public string EditarUsuario(string user, string pass, int idEmplead)
        {
            try
            {
                USUARIO.EditarUsuario(user, pass, idEmplead);
                return "Datos ingresados correctamente";
            }
            catch
            {
                return "Error, datos no guardados";
            }
        }
    }
}
