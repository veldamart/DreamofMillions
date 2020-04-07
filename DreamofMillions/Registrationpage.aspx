<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrationpage.aspx.cs" Inherits="DreamofMillions.Registrationpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Registration</title>
   <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/signup.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="title" content="Registration"/>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://wcet1993.com/assets/javascript/jquery/cookie-plugin.js"></script>
 <script>
function remember_me(){
   var c = $("#chkMe"); //INPUT CHECKBOX
   //IF CHECKBOX IS SET, COOKIE WILL BE SET
   if(c.is(":chkMe")){
     var u = $("#UserName").val(); //VALUE OF USERNAME
     var p = $("#Password").val(); //VALUE OF PASSWORD
     $.cookie("UserName", u, { expires: 3650 }); //SETS IN DAYS (10 YEARS)
     $.cookie("Password", p, { expires: 3650 }); //SETS IN DAYS (10 YEARS)
   }
}
//NEXT PAGE LOAD, THE USERNAME & PASSWORD WILL BE SHOWN IN THEIR FIELDS
function load_em(){
   var u = $.cookie("UserName"); //"USERNAME" COOKIE
   var p = $.cookie("Password"); //"PASSWORD" COOKIE

   $("#UserName").val(u); //FILLS WITH "USERNAME" COOKIE
   $("#Password").val(p); //FILLS WITH "PASSWORD" COOKIE
}
</script>
</head>
<body>
    <form id="form1" runat="server">
  <fieldset>
<legend >Signup</legend>
<br />
First Name:<asp:TextBox CssClass="textbox" ID="txtFName" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" runat="server" required="" name="string"/>
<br />
<br />
Last Name:<asp:TextBox CssClass="textbox" ID="txtLName" runat="server" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" required="" name="string"/>
<br />
<br />
UserName:<asp:TextBox CssClass="textbox" ID="txtUserName" runat="server" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" required="" name="string"/><br />
<%--<asp:CustomValidator runat="server" id="CustomValidator1" controltovalidate="txtUserName" onservervalidate="cusCustom_ServerValidate" ForeColor="Red" errormessage="The text must be exactly 8 characters long!" />--%>
<br />
User Email:<asp:TextBox CssClass="textbox" ID="txtEmail" Textmode="Email" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" runat="server" required="" name="string" /><br />
<br />
<br />
Password:<asp:TextBox CssClass="textbox" ID="txtPw" Textmode="Password" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" runat="server" Width="176px" required="" name="string"/>
   <asp:RegularExpressionValidator runat="server" 
    ControlToValidate="txtPw"
    ValidationExpression="(?=.{8,})[a-zA-Z]+[^a-zA-Z]+|[^a-zA-Z]+[a-zA-Z]+"
    Display="Dynamic"
    ErrorMessage="Password must be 8 characters and have both letters and numbers." ForeColor="Red"/>
<br />
<br />
<div class="checkbok">
<input type="checkbox" id ="chkMe" value= "chkMe" style="margin-top: 0px;margin-bottom: 0px; margin-left: 0px;  margin-right: 0px;" runat="server"/>
<input onchange="remember_me()" style=" margin:  0px 0px 0px;" type="button" value="Remember Me"/>
<asp:Button ID="btn_Add" runat="server" CssClass="btn btn-info btn-large align-content-center" Text="Sign In" style= "margin: 0px 0px 0px 0px; padding: 0 0 0 0;" Width="90px"/><br/>
</div>
 <asp:Label ID="lblMessage" Forecolor="Red" runat="server"></asp:Label>
 </fieldset>
<%--  </div>--%>
<%-- </section>--%>
<br />
    </form>
</body>
</html>
