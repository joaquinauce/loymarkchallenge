using BusinessLogicLayer;
using ChallengeLoyMark.Funciones;
using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChallengeLoyMark
{
    public partial class UsuarioList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarUsuarios();
            }

        }

        private void CargarUsuarios()
        {
            DataSet dsUsuarios = new DataSet();
            dsUsuarios = UsuarioBLL.GetDataSet();

            GrillaUsuarios.DataSource = dsUsuarios;
            GrillaUsuarios.DataBind();
        }

        protected void GrillaUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("Eliminar"))
                {
                    ViewState["id_usuario"] = int.Parse(e.CommandArgument.ToString());
                    MessageBox.ShowConfirmation("¿Desea eliminar el usuario?", "Confirmacion", "Confirmar", "Cancelar", "$('#" + btnConfirmarEliminar.ClientID + "').click();");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void GrillaUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;

                Label lblId = e.Row.FindControl("lblId") as Label;
                LinkButton btnVisualizar = e.Row.Cells[2].FindControl("iBtnVer") as LinkButton;

                Label recibeInformacion = e.Row.FindControl("recibeInformacion") as Label;

                if (bool.Parse(rowView["recibe_informacion"].ToString()) == true)
                {
                    recibeInformacion.Text = "<i class='fa fa-check'";
                    recibeInformacion.Attributes["style"] = "color: #00C017";
                }
                if (bool.Parse(rowView["recibe_informacion"].ToString()) == false)
                {
                    recibeInformacion.Text = "<i class='fa fa-times'";
                    recibeInformacion.Attributes["style"] = "color: #F72C00";
                }
            }
        }

        protected void GrillaUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrillaUsuarios.PageIndex = e.NewPageIndex;
            CargarUsuarios();
        }

        protected void btnConfirmarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioBLL.Delete(int.Parse(ViewState["id_usuario"].ToString()));
                Usuario userEliminado = UsuarioBLL.SelectById(int.Parse(ViewState["id_usuario"].ToString()));
                ActividadBLL.Save(TipoOperacion.Delete, "Se ha eliminado el usuario ", userEliminado, userEliminado.Apellido + ", " + userEliminado.Nombre);

                CargarUsuarios();

                MessageBox.Show("El usuario se ha eliminado", "success", "Confirmación");
                return;
            }
            catch (Exception exception)
            {
                MessageBox.Show("No se pudo eliminar el usuario", "error", "Error");
                return;
            }
        }

        protected void chkMostrarEliminados_CheckedChanged(object sender, EventArgs e)
        {
            if (chkMostrarEliminados.Checked)
                CargarUsuariosEliminados();
            else
                CargarUsuarios();
        }

        private void CargarUsuariosEliminados()
        {
            DataSet dsUsuarios = new DataSet();
            dsUsuarios = UsuarioBLL.GetDataSetEliminados();

            GrillaUsuarios.DataSource = dsUsuarios;
            GrillaUsuarios.DataBind();
        }
    }
}