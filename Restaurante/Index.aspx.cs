using CapaDatos;
using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Hosting;
using System.Runtime.Versioning;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Restaurante
{
    public partial class Index : System.Web.UI.Page
    {

        public DataSet dtVenta = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Productos"] = null;

                using (Entities entities = new Entities())
                {
                    var platosList = (from p in entities.PLATO

                                      select new { p.NOMBRE, p.IDPLATO }).ToList();

                    if (platosList != null)
                    {
                        dropPlato.DataValueField = "IDPLATO";
                        dropPlato.DataTextField = "NOMBRE";
                        dropPlato.SelectedValue = "0";
                        dropPlato.DataSource = platosList;
                        dropPlato.DataBind();
                    }
                }

                using (Entities entities = new Entities())
                {
                    var mesaList = (from p in entities.MESA

                                    select new { p.NOMBRE, p.NROMESA }).ToList();

                    if (mesaList != null)
                    {
                        dropMesa.DataValueField = "NROMESA";
                        dropMesa.DataTextField = "NOMBRE";
                        dropMesa.SelectedValue = "0";
                        dropMesa.DataSource = mesaList;
                        dropMesa.DataBind();
                    }
                }

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(
                          this, GetType(), "ajax", "$(document).ajaxStart($.blockUI);", true);
            if (dropPlato.SelectedValue != "0" && dropMesa.SelectedValue != "0" && !string.IsNullOrEmpty(txtCliente.Text.Trim()) && !string.IsNullOrEmpty(txtMesero.Text.Trim()))
            {

                var idPlato = Convert.ToInt32(dropPlato.SelectedValue);
                CapaDatos.Entities entities = new Entities();
                var plato = (from p in entities.PLATO
                             where p.IDPLATO == idPlato
                             select new { p.VALOR, p.NOMBRE, p.IDPLATO }).ToList();
            
                DataTable table = new DataTable("Productos");

                table.Columns.Add(new DataColumn("idPlato"));
                table.Columns.Add(new DataColumn("Plato"));
                table.Columns.Add(new DataColumn("Cantidad"));
                table.Columns.Add(new DataColumn("Valor"));
                table.Columns.Add(new DataColumn("Total"));

                if (dtVenta.Tables.Count == 0)
                {
                    dtVenta.Tables.Add(table);
                }
                DataRow dtrPro = dtVenta.Tables["Productos"].NewRow();

                dtrPro["idPlato"] = plato[0].IDPLATO;
                dtrPro["Plato"] = plato[0].NOMBRE;
                dtrPro["Cantidad"] = txtCantidad.Text;
                dtrPro["Valor"] = plato[0].VALOR;
                dtrPro["Total"] = Convert.ToDecimal(txtCantidad.Text) * plato[0].VALOR;

                //System.Data.DataSet dtVentaSesion = Session["Productos"] as System.Data.DataSet;
                if (Session["Productos"] != null)
                {
                    dtVenta = Session["Productos"] as DataSet;

                }

                dtVenta.Tables["Productos"].Rows.Add(dtrPro.ItemArray);


                GridView1.DataSource = dtVenta.Tables[0];
                GridView1.DataBind();
                txtCantidad.Text = "";
                dropPlato.SelectedValue = "0";
                dropMesa.SelectedValue = "0";
                Session["Productos"] = dtVenta;

            }
            else
            {
                ScriptManager.RegisterStartupScript(
                                        this, GetType(), "showalert", "alert('Faltan datos por selecionar: cantidad, mesero o plato');", true);
            }

        }

        protected void txtCliente_TextChanged(object sender, EventArgs e)
        {
         
            var idCliente = 0;
            int.TryParse(txtCliente.Text, out idCliente);
            CapaDatos.Entities entities = new Entities();
            var ClienteNombres = (from p in entities.CLIENTE
                                  where p.IDENTIFICACION == idCliente
                                  select new { p.NOMBRES, p.APELLIDOS }).ToList();
            if (ClienteNombres != null)
            {
                if (ClienteNombres.Count > 0)
                {
                    txtNombreCliente.Text = ClienteNombres[0].NOMBRES + " " + ClienteNombres[0].APELLIDOS;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                        this, GetType(), "showalert", "alert('No existe el usuario con esa identificación');", true);
                    txtNombreCliente.Text = "";
                    txtCliente.Text = "";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript
                    (this, GetType(), "showalert", "alert('Hubo inconvenientes al buscar el cliente. Por favor intente de nuevo');", true);
                txtNombreCliente.Text = "";
                txtCliente.Text = "";
            }

        }

        protected void txtMesero_TextChanged(object sender, EventArgs e)
        {
            var idMesero = 0;
            int.TryParse(txtMesero.Text, out idMesero);

            CapaDatos.Entities entities = new Entities();
            var MeseroNombre = (from p in entities.MESERO
                                where p.IDMESERO == idMesero
                                select new { p.NOMBRES, p.APELLIDOS }).ToList();

            if (MeseroNombre != null)
            {
                if (MeseroNombre.Count > 0)
                {
                    txtNombreMesero.Text = MeseroNombre[0].NOMBRES + " " + MeseroNombre[0].APELLIDOS;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(
                        this, GetType(), "showalert", "alert('No existe el mesero con esa identificación');", true);
                    txtNombreMesero.Text = "";
                    txtMesero.Text = "";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript
                    (this, GetType(), "showalert", "alert('Hubo inconvenientes al buscar el mesero. Por favor intente de nuevo');", true);
                txtNombreMesero.Text = "";
                txtMesero.Text = "";
            }
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            txtCantidad.Text = "";
            dropPlato.SelectedValue = "0";
            dropMesa.SelectedValue = "0";
            GridView1.DataSource = null;
            GridView1.DataBind();
            Session["Productos"] = null;

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
     

            if (GridView1.Rows.Count > 0)
            {
                try
                {

                    if (!string.IsNullOrEmpty(txtCliente.Text.Trim()) && !string.IsNullOrEmpty(txtMesero.Text.Trim()))
                    {
                        var idcliente = Convert.ToInt32(txtCliente.Text);
                        var idmesa = Convert.ToInt32(dropMesa.SelectedValue);
                        var idmesero = Convert.ToInt32(txtMesero.Text);

                        CapaDatos.Entities entities = new Entities();

                        var cliente = entities.CLIENTE.FirstOrDefault(m => m.IDENTIFICACION == idcliente);
                        var mesa = entities.MESA.FirstOrDefault(m => m.NROMESA == idmesa);
                        var mesero = entities.MESERO.FirstOrDefault(m => m.IDMESERO == idmesero);


                        entities.FACTURA.Add(new FACTURA { CLIENTE = cliente, MESA = mesa, MESERO = mesero, FECHA = DateTime.Now });
                        entities.SaveChanges();
                        decimal valor = 0;

                        foreach (GridViewRow row in GridView1.Rows)
                        {
                            var factura = entities.FACTURA.OrderByDescending(p => p.NROFACTURA).FirstOrDefault();
                            var supervisor = entities.SUPERVISOR.First();
                            var cantidad = Convert.ToInt32(row.Cells[3].Text);

                            var idplato = Convert.ToInt32(row.Cells[0].Text);
                            var plato = entities.PLATO.FirstOrDefault(m => m.IDPLATO == idplato);
                            decimal.TryParse(row.Cells[4].Text, out valor);

                            entities.DETALLEXFACTURA.Add(new DETALLEXFACTURA { CANTIDAD=cantidad, FACTURA = factura, IDSUPERVISOR = 0, PLATO1 = plato, VALOR = valor });
                        }
                        entities.SaveChanges();
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript
                        (this, GetType(), "showalert", "alert('Faltan rellenar datos');", true);
                    }

                    ScriptManager.RegisterStartupScript
                            (this, GetType(), "showalert", "alert('¡DATOS GUARDADOS CON EXITO!');", true);
                    limpiaControles();
                }
                catch (Exception)
                {

                    ScriptManager.RegisterStartupScript
                    (this, GetType(), "showalert", "alert('Hubo inconvenientes al guardar, intente de nuevo');", true);
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript
                    (this, GetType(), "showalert", "alert('Nada para guardar');", true);
            }
        }

        private void limpiaControles() {
            txtCantidad.Text = "";
            dropPlato.SelectedValue = "0";
            dropMesa.SelectedValue = "0";
            Session["Productos"] = null;
            GridView1.DataSource = null;
            GridView1.DataBind();
            txtCliente.Text = "";
            txtNombreCliente.Text = "";
            txtMesero.Text = "";
            txtNombreMesero.Text = "";
        }
    }
}