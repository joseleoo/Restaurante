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
                Entities entities = new Entities();

                var meseroList = (from m in entities.MESERO
                                  join f in entities.FACTURA on m.IDMESERO equals f.IDMESERO into j
                                  from k in j.DefaultIfEmpty()
                                  join d in entities.DETALLEXFACTURA on k.NROFACTURA equals d.NROFACTURA into detalles
                                  from detalle in detalles.DefaultIfEmpty()
                                 
                                  group new { m, detalle } by new { m.NOMBRES, m.APELLIDOS } into g
                                  //where k.FECHA >= FechaInicial && k.FECHA <= FechaFinal
                                  let ventas = g.Sum(m => m.detalle==null?0: m.detalle.VALOR)
                                  let Mesero = g.Key.NOMBRES + " " + g.Key.APELLIDOS
                                  orderby ventas descending
                                  select new { Mesero, Ventas = ventas }
                                  //select new { g.Key ,g.Sum(x=>x.val)}


                                      ).ToList();                                     
                                     
                                      



                GridView1.DataSource = meseroList;
                GridView1.DataBind();
          
                var consumo = decimal.Parse(txtCantidad.Text);

                var clientelist = (from c in entities.CLIENTE
                                   join f in entities.FACTURA on c.IDENTIFICACION equals f.IDCLIENTE
                                   join d in entities.DETALLEXFACTURA on f.NROFACTURA equals d.NROFACTURA
                                   //where f.FECHA >= FechaInicial && f.FECHA <= FechaFinal && d.VALOR >= consumo
                                  
                                   group new { d,f, c} by new {  c.NOMBRES,c.APELLIDOS} into g
                                   let Compras = g.Sum(m =>  m.d.VALOR)
                                   let Cliente= g.Key.NOMBRES+" "+g.Key.APELLIDOS
                                   where Compras >= consumo
                                   select new {Cliente, Compras }

                                  ).ToList();


                GridView2.DataSource = clientelist;
                GridView2.DataBind();

                ScriptManager.RegisterStartupScript(
                         this, GetType(), "showalert", "alert('listo');", true);

            }

            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(
                                   this, GetType(), "showalert", "alert('" + ex.ToString() + "');", true);
            }
        }
    }
}
