using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Restaurante
{
    public partial class Indicadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIndicadores_Click(object sender, EventArgs e)
        {

            try
            {
                DateTime FechaInicial = DateTime.Parse(txtFechaInicio.Text);

                DateTime FechaFinal = DateTime.Parse(txtFechaFinal.Text);
                using (Entities entities = new Entities())
                {
                    var meseroList = (from m in entities.MESERO
                                      join f in entities.FACTURA on m.IDMESERO equals f.IDMESERO
                                      join d in entities.DETALLEXFACTURA on f.NROFACTURA equals d.NROFACTURA
                                      where f.FECHA >= FechaInicial && f.FECHA <= FechaFinal

                                      //select new { m.NOMBRES, m.APELLIDOS, d.VALOR }
                                      select new {d.NROFACTURA, m.NOMBRES, m.APELLIDOS, d.VALOR }

                                      ).ToList();


                    GridView1.DataSource = meseroList;
                    GridView1.DataBind();

                    //    ScriptManager.RegisterStartupScript(
                    //             this, GetType(), "showalert", "alert('listo');", true);
                    //}
                    var consumo = decimal.Parse(txtCantidad.Text);
                    
                    var clientelist = (from m in entities.CLIENTE
                                       join f in entities.FACTURA on m.IDENTIFICACION equals f.IDCLIENTE
                                       join d in entities.DETALLEXFACTURA on f.NROFACTURA equals d.NROFACTURA
                                       where f.FECHA >= FechaInicial && f.FECHA <= FechaFinal && d.VALOR>= consumo


                                       select new { d.NROFACTURA, m.NOMBRES, m.APELLIDOS , d.VALOR}

                                      ).ToList();


                    GridView2.DataSource = clientelist;
                    GridView2.DataBind();

                    ScriptManager.RegisterStartupScript(
                             this, GetType(), "showalert", "alert('listo');", true);
                }
            }

            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(
                                   this, GetType(), "showalert", "alert('" + ex.ToString() + "');", true);
            }
        }
    }
}
