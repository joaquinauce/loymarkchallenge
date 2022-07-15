using BusinessLogicLayer;
using ChallengeLoyMark.Funciones;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChallengeLoyMark
{
    public partial class UsuarioCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarComboPaises();

                if (Request.Params["id"] != null)
                {
                    Usuario user = UsuarioBLL.SelectById(int.Parse(Request.Params["id"].ToString()));
                    txtName.Text = user.Nombre;
                    txtLastName.Text = user.Apellido;
                    txtEmail.Text = user.Email;
                    txtBirthDate.Text = user.FechaNacimiento.ToString();
                    txtPhoneNumber.Text = user.Telefono;
                    chkRecibeInformacion.Checked = user.RecibeInformacion;
                    ddlCountry.SelectedValue = (user.Pais != null) ? user.Pais.IdPais.ToString() : "";
                }

                if (Request.Params["edit"] == "0")
                {
                    txtName.Enabled = false;
                    txtLastName.Enabled = false;
                    txtEmail.Enabled = false;
                    txtBirthDate.Enabled = false;
                    txtPhoneNumber.Enabled = false;
                    chkRecibeInformacion.Enabled = false;
                    ddlCountry.Enabled = false;
                    btnSave.Visible = false;
                    btnCancel.Text = "Volver";
                }
                if (Request.Params["edit"] == "1")
                {
                    btnSave.Text = "Actualizar";
                }
            }
        }
        private void LlenarComboPaises()
        {
            ddlCountry.Items.Clear();
            ddlCountry.Items.Add(new ListItem("Seleccione un país", ""));

            List<Pais> Paises = PaisBLL.SelectAll();
            foreach (Pais p in Paises)
            {
                ddlCountry.Items.Add(new ListItem(p.Nombre + " - " + p.CodigoInternacional, p.IdPais.ToString()));
            }
        }
        public string CamposObligatorios()
        {
            string ValidacionCorreoElectronico = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            string ValidacionSoloLetras = "^[a-zA-Z]+$";

            string camposObligatorios = "";

            if (txtName.Text == "")
                camposObligatorios += "\\n - Nombre";
            if (txtLastName.Text == "")
                camposObligatorios += "\\n - Apellido";
            if (txtEmail.Text == "")
                camposObligatorios += "\\n - Correo Electrónico";
            if (txtBirthDate.Text == "")
                camposObligatorios += "\\n - Fecha de nacimiento";
            if (ddlCountry.SelectedIndex <= 0)
                camposObligatorios += "\\n - País de residencia";
            if (Regex.Replace(txtName.Text, ValidacionSoloLetras, String.Empty).Length != 0)
                camposObligatorios += "\\n - Nombre (ingrese caracteres válidos)";
            if (Regex.Replace(txtLastName.Text, ValidacionSoloLetras, String.Empty).Length != 0)
                camposObligatorios += "\\n - Apellido (ingrese caracteres válidos)";
            if (Regex.Replace(txtEmail.Text, ValidacionCorreoElectronico, String.Empty).Length != 0)
                camposObligatorios += "\\n - Formato de correo electrónico incorrecto";


            return camposObligatorios;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();

            string validarCamposObligatorios = CamposObligatorios();
            bool IsInsert = Request.Params["id"] == null;

            if (validarCamposObligatorios != "")
            {
                MessageBox.Show(validarCamposObligatorios, "warning", "Revise los siguientes campos");
                return;
            }
            else
            {
                if (!IsInsert)
                    user.IdUsuario = int.Parse(Request.Params["id"].ToString());


                user.Nombre = txtName.Text;
                user.Apellido = txtLastName.Text;
                user.Email = txtEmail.Text;
                user.FechaNacimiento = DateTime.Parse(txtBirthDate.Text);
                user.Telefono = txtPhoneNumber.Text;
                user.Pais = new Pais(int.Parse(ddlCountry.SelectedValue), ddlCountry.SelectedItem.Text.Substring(ddlCountry.SelectedItem.Text.Length - 3, 3));
                user.RecibeInformacion = chkRecibeInformacion.Checked;

                try
                {
                    int idUsuario = UsuarioBLL.Save(user);

                    Usuario userCreado = new Usuario();
                    userCreado = UsuarioBLL.SelectById(idUsuario);
                    string recibeInfo = userCreado.RecibeInformacion ? recibeInfo = "SI" : recibeInfo = "NO";

                    if (IsInsert)
                    {
                        ActividadBLL.Save(TipoOperacion.Create, "Se ha dado de alta el usuario", userCreado, userCreado.Apellido + ", " + userCreado.Nombre + ". Su correo electronico es: " + userCreado.Email + ". Ha nacido el día " + userCreado.FechaNacimiento.ToShortDateString() + ". Su país de residencia es: " + userCreado.Pais.Nombre + "(" + userCreado.Pais.CodigoInternacional + ")" + ". El usuario ha decidido " + recibeInfo + " recibir información.");
                        MessageBox.Show("Usuario registrado con éxito.", "success", "Confirmación", "Aceptar", "window.location='UsuarioList.aspx'");
                        LimpiarCampos();
                        return;

                    }
                    if (!IsInsert)
                    {
                        ActividadBLL.Save(TipoOperacion.Update, "Se ha actualizado el usuario", userCreado, userCreado.Apellido + ", " + userCreado.Nombre + ". Su correo electronico es: " + userCreado.Email + ". Ha nacido el día " + userCreado.FechaNacimiento.ToShortDateString() + ". Su país de residencia es: " + userCreado.Pais.Nombre + "(" + userCreado.Pais.CodigoInternacional + ")" + ". El usuario ha decidido " + recibeInfo + " recibir información.");
                        MessageBox.Show("Usuario actualizado con éxito.", "success", "Confirmación", "Aceptar", "window.location='UsuarioList.aspx'");
                        return;

                    }
                }

                catch (ExisteCorreoElectronico)
                {
                    MessageBox.Show("El correo electronico ya se encuentra registrado", "warning", "Advertencia");
                    return;
                }

                catch (Exception)
                {
                    MessageBox.Show("Error al guardar el usuario", "error", "Error");
                    return;
                }
            }
        }

        private void LimpiarCampos()
        {
            txtName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhoneNumber.Text = "";
            ddlCountry.SelectedIndex = 0;
            txtBirthDate.Text = DateTime.Now.ToShortDateString().ToString();
            chkRecibeInformacion.Checked = false;
        }
    }
}