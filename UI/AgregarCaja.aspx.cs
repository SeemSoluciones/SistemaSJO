﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;

namespace UI
{
    public partial class AgregarCaja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int mjs = 0;
            SqlDataSource1.InsertParameters["Concepto"].DefaultValue = TextBox1.Text;
            mjs = SqlDataSource1.Insert();
            if(mjs == 1)
            {
                Response.Write("<script>alert('Datos guardado con exito!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Error, no se guardo los datos')</script>");
            }
        }
    }
}