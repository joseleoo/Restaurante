using CapaDatos;
using System;
using System.Linq;
using System.Web.UI.WebControls;
namespace Restaurante
{
    public partial class Index : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Button1_Click(object sender, EventArgs e)
        {
            CapaDatos.Entities entities = new Entities();
            var query = (from p in entities.CLIENTE
                         where p.IDENTIFICACION==1234
                         select new { p.NOMBRES, p.APELLIDOS }).ToList();
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
    }
}