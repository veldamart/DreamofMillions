//namespace DreamofMillions.MemberService.Signup { 

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace DreamofMillions
{
    /// <summary>
    /// Summary description for DreamsWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class DreamsWebService : System.Web.Services.WebService
    {

        [WebMethod]
        public int UserAddorEdit(string FName, string LName, string UserName, string EmailAddress, string Password)
        {
            int retRecord;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("UserAddorEdit", con))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("UserId", SqlDbType.VarChar, 50).Value = "";
                    cmd.Parameters.Add("FName", SqlDbType.VarChar, 50).Value = FName;
                    cmd.Parameters.Add("LName", SqlDbType.VarChar, 50).Value = LName;
                    cmd.Parameters.Add("UserName", SqlDbType.VarChar, 50).Value = UserName;
                    cmd.Parameters.Add("EmailAddress", SqlDbType.VarChar, 50).Value = EmailAddress;
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    string saltHashReturned = PasswordHash.PasswordStorage.CreateHash(Password.ToString());
                    int commIndex = saltHashReturned.IndexOf(":");
                    String extractedString = saltHashReturned.Substring(0, commIndex);
                    commIndex = saltHashReturned.IndexOf(":");
                    extractedString = saltHashReturned.Substring(commIndex + 1);
                    commIndex = extractedString.IndexOf(":");
                    String salt = extractedString.Substring(0, commIndex);
                    commIndex = extractedString.IndexOf(":");
                    extractedString = extractedString.Substring(commIndex + 1);
                    String hash = extractedString;
                    cmd.Parameters.AddWithValue("@Password", saltHashReturned);
                    retRecord = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            
            return retRecord;
        }
    }
}
//}
