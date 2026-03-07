using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Data_and_Web_Development_Final
{
    public partial class Bookings_Details : System.Web.UI.Page
    {
        protected global::System.Web.UI.WebControls.FormView FormView1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemCreated(object sender, EventArgs e)
        {
            if (FormView1.CurrentMode == FormViewMode.Insert)
            {
                TextBox txtTime = (TextBox)FormView1.FindControl("BOOKINGTIMETextBox");
                if (txtTime != null && string.IsNullOrEmpty(txtTime.Text))
                {
                    txtTime.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
                }
            }
        }
    }
}
