using CapaDatos;
using System;
using System.Collections.Generic;
using System.Globalization;
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
                DateTime FechaInicial = DateTime.Parse(txtFechaInicio.Text, CultureInfo.InvariantCulture);

                DateTime FechaFinal = DateTime.Parse(txtFechaFinal.Text, CultureInfo.InvariantCulture);
                FechaFinal = FechaFinal.AddDays(1);
                Entities entities = new Entities();

                var meseroList = (from m in entities.MESERO
                                  join f in entities.FACTURA on m.IDMESERO equals f.IDMESERO into j
                                  from k in j.DefaultIfEmpty()
                                  join d in entities.DETALLEXFACTURA on k.NROFACTURA equals d.NROFACTURA into detalles
                                  from detalle in detalles.DefaultIfEmpty()
                                  where ( k.FECHA >= FechaInicial && k.FECHA < FechaFinal) || (k.FECHA==null)
                                  group new { m, detalle } by new { m.NOMBRES, m.APELLIDOS } into g
                                 
                                  let ventas = g.Sum(m => m.detalle==null?0: m.detalle.VALOR)
                                  let Mesero = g.Key.NOMBRES + " " + g.Key.APELLIDOS
                                  orderby ventas descending
                                  select new { Mesero, Ventas = ventas }
                                 
                                      ).ToList();                         
                                     
                                      



                GridView1.DataSource = meseroList;
                GridView1.DataBind();
          
                var consumo = decimal.Parse(txtCantidad.Text);

                var clientelist = (from c in entities.CLIENTE
                                   join f in entities.FACTURA on c.IDENTIFICACION equals f.IDCLIENTE
                                   join d in entities.DETALLEXFACTURA on f.NROFACTURA equals d.NROFACTURA
                                   where f.FECHA >= FechaInicial && f.FECHA < FechaFinal 

                                   group new { d,f, c} by new {  c.NOMBRES,c.APELLIDOS} into g
                                   let Compras = g.Sum(m =>  m.d.VALOR)
                                   let Cliente= g.Key.NOMBRES+" "+g.Key.APELLIDOS
                                   where Compras >= consumo
                                   select new {Cliente, Compras }

                                  ).ToList();


                GridView2.DataSource = clientelist;
                GridView2.DataBind();

                var platolist = (from plato in entities.PLATO
                                 join detalle in entities.DETALLEXFACTURA on plato.IDPLATO equals detalle.PLATO
                                 join factura in entities.FACTURA on detalle.NROFACTURA equals factura.NROFACTURA
                                 where factura.FECHA >= FechaInicial && factura.FECHA < FechaFinal
                                 group new { detalle, plato } by new { plato.NOMBRE } into grupo
                                 let Valor = grupo.Sum(x => x.detalle.VALOR)
                                 let Cantidad = grupo.Sum(x => x.detalle.CANTIDAD)
                                 orderby Cantidad descending
                                 
                                 select new { Valor, Cantidad, grupo.Key.NOMBRE }).ToList();


            GridView3.DataSource = platolist;
                GridView3.DataBind();
                ScriptManager.RegisterStartupScript(
                                  this, GetType(), "showalert", "alert('listo');", true);

            }

            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(
                                   this, GetType(), "showalert", "alert('" + ex.ToString() + "');", true);
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            var count = 0;
            var valor = 0;
            foreach (GridViewRow row in GridView1.Rows)
            {

                int.TryParse(row.Cells[1].Text, out valor);
                count += valor;
            }

            if (count<1)
            {
                if (GridView1.DataSource!=null)
                {
                    GridView1.DataSource = null;
                    GridView1.DataBind(); 
                }
            }

        }
    }
}
