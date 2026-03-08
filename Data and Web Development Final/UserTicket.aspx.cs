using System;

namespace Data_and_Web_Development_Final
{
    public partial class UserTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            PanelResults.Visible = true;
        }
    }
}
