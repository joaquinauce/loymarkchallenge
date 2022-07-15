using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChallengeLoyMark
{
    public partial class Actividades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarActividades(null, null);
            }
        }

        public void CargarActividades(object sender, EventArgs e)
        {
            DataSet dataSet = new DataSet();

            dataSet = ActividadBLL.GetDataSet();

            GrillaActividades.DataSource = dataSet;

            GrillaActividades.DataBind();
        }

        protected void GrillaActividades_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrillaActividades.PageIndex = e.NewPageIndex;
            CargarActividades(null, null);
        }
    }
}