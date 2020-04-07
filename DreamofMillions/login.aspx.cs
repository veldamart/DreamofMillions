﻿using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


namespace DreamofMillions
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (this.Page.User.Identity.IsAuthenticated)
            //{
            //    Response.Redirect(FormsAuthentication.DefaultUrl);
            //}
        }
        protected void ValidateUser(object sender, EventArgs e)
        {
            string username = Username.Text.Trim();
            string password = txtPassword.Text.Trim();
            int userId = 0;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_User"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userId)
                {
                    case -1:
                        dvMessage.Visible = true;
                        lblMessage.Text = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        dvMessage.Visible = true;
                        lblMessage.Text = "Account has not been activated.";
                        break;
                    default:
                        if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                        {
                            FormsAuthentication.SetAuthCookie(username, chkRememberMe.Checked);
                            Response.Redirect(Request.QueryString["ReturnUrl"]);
                        }
                        else
                        {
                            FormsAuthentication.RedirectFromLoginPage(username, chkRememberMe.Checked);
                        }
                        break;
                }
            }
        }
    }
}

        
   
