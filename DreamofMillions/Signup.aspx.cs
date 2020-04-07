using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using DreamofMillions;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


namespace DreamofMillionsMembers
{
    public partial class Signup : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = string.Format("New Member Registration Page :: Member :: {0:d}", DateTime.Now);
            
        }
        protected void cusCustom_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            if (e.Value.Length == 8)
                e.IsValid = true;

            else
                e.IsValid = false;
        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
                if (IsValid)
                {
                    registerUserWithSlowHash();
                }
            
        
        }

        private void registerUserWithSlowHash()
        {
            bool methodStatus = true;

            if (InputValidation.ValidateUserName(txtUserName.Text) == false)
            {
                methodStatus = false;
            }
            if (InputValidation.ValidateUserName(txtPw.Text) == false)
            {
                methodStatus = false;
            }
            if (methodStatus == true)
            {

                DreamofMillions.MemberService.DreamsWebServiceSoapClient client =
                new DreamofMillions.MemberService.DreamsWebServiceSoapClient();
                int ret = client.UserAddorEdit(txtFName.Text, txtLName.Text, txtUserName.Text, txtEmail.Text, txtPw.Text);
                if (ret > 0)
                    try
                    {

                       //Display success message.
                        lblMessage.Text = "This information will be sent to your property manager. Your property manager will activate your account and send you your login information. " +
                            "Please contact your management office at (937) 371-1226 if you have further questions.";

                        if (txtUserName.Text != "" && txtPw.Text != "")
                        {
                            txtFName.Text = "";
                            txtLName.Text = "";
                            txtEmail.Text = "";
                            txtUserName.Text = "";
                            txtPw.Text = "";

                            //Response.Redirect("index.aspx");
                        }

                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.ToString();
                    }
            }
            else
            {
                lblMessage.Text = "Error while inserting Record";
            }


            }
                         
            }
           

        }
     

 




















