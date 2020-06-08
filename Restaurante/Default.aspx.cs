using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;

namespace Restaurante
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CapaDatos.Entities entities = new Entities();
            var query = (from p in entities.CLIENTE
                        select new { p.NOMBRES, p.APELLIDOS }).ToList();
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
    }
}