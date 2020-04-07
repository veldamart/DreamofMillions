<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DreamofMillionsMembers.Signup"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
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
   <h1 class="page-header">
  <small>MWB Real Estate LLC. Tenant Landlord Service!</small></h1>
 <%-- predefined grid classes for making the grid layout--%>
 <div class= "col-md-4 col-sm-4 col-xs-12"></div>
 <div class= "col-md-4 col-sm-4 col-xs-12">
 <div class="row">
<input type="hidden" runat="server" id="hfuserId"/></div>
</div>
<form id="signin" runat="server">
<section>
<div class="container">
 <fieldset>
<legend >Become a Member!</legend>
<br />
First Name:<asp:TextBox CssClass="textbox" ID="txtFName" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" runat="server" required="" name="string"/>
<br />
<br />
Last Name:<asp:TextBox CssClass="textbox" ID="txtLName" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" runat="server" required="" name="string"/>
<br />
<br />
UserName:<asp:TextBox CssClass="textbox" ID="txtUserName" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" runat="server" required="" name="string"/><br />
<asp:CustomValidator runat="server" id="CustomValidator1" controltovalidate="txtUserName" onservervalidate="cusCustom_ServerValidate" ForeColor="Red" errormessage="The text must be exactly 8 characters long!" />
<br />
User Email:<asp:TextBox CssClass="textbox" ID="txtEmail" Textmode="Email" style="margin-top: -30px;margin-bottom: -30px; margin-left: 50px;  margin-right: 50px;" runat="server" required="" name="string" /><br />
<br />
Password:<asp:TextBox CssClass="textbox" ID="txtPw" Textmode="Password" style="margin-top: -30px;margin-bottom: -30px; margin-left: 55px;  margin-right: 50px;" runat="server" Width="176px" required="" name="string"/>
   <asp:RegularExpressionValidator runat="server" 
    ControlToValidate="txtPw"
    ValidationExpression="(?=.{8,})[a-zA-Z]+[^a-zA-Z]+|[^a-zA-Z]+[a-zA-Z]+"
    Display="Dynamic"
    ErrorMessage="Password must be 8 characters and have both letters and numbers." ForeColor="Red"/>
<br />
<br />
<div>
<div class="checkbok">
<input type="checkbox" id ="chkMe" value= "chkMe" style="margin-top: 0px;margin-bottom: 0px; margin-left: 0px;  margin-right: 0px;" runat="server"/>
<input onchange="remember_me()" style=" margin: 10px 0px 0px 0px;" type="button" value="Remember Me"/>
<asp:Button ID="btn_Add" runat="server" CssClass="btn btn-info btn-large align-content-center" Text="Sign In" style= "margin: 0px 0px 0px 0px; padding: 0 0 0 0;" Width="80px" OnClick="btn_Add_Click" Height="33px"/>
<input type="button"  class="btn btn-info btn-large align-content-center" value="Exit" style= "margin: 0px 0px 0px 3px; padding: 0 0 0 0; width: 82px; height: 33px;" onclick="window.open('index.aspx', 'newPage');" />
<br /><br /><div>
<asp:Label ID="lblMessage" width="285px" Forecolor="Red" runat="server"></asp:Label></div>
</div>
</fieldset>
</div>
</section>
<br />
<div class="login">
<fieldset>
<legend style="text-align:center; width: 317px;">Help!</legend>
 <p>We provide education, information, and problem solving assistance as a way to improve tenant-landlord relations and decrease the amount of housing evictions in our community.
    We are landlords and our goal is to ensure that stable rental housing exists by educating existing and potential landlords and tenants regarding their respective rights and 
    responsibilities.</p><br />
   <h4>Our services include:</h4>
   <ul>
       <li>Ready-to-Rent classes for tenants looking to establish or rebuild a positive rental history.</li>
       <li>Landlord workshops on fair housing laws, local government rules and requirements, business fundamentals and other common issues.,</li>
   	   <li>Serving as a community resource on the rights and responsibilities of both tenants and landlords.</li>
       <li>Provide resource for mediation services to help resolve tenant/landlord and neighbor to neighbor disputes.</li>
  </ul>
    <%--<p>Whether you are a landlord or a tenant, The Tenant Landlord Connection Program can assist you in resolving your rental disputes to avoid costly legal action.</p><br />
    <p>The The Tenant Landlord Connection program only serves Dayton residents, and cannot offer legal advice or promise resolution.</p><br />
    <p>To speak with The Tenant Landlord Connection staff about your rental situation, call: 937-371-1226, or email: veldamart@gmail.com</p>--%>

</fieldset>
      </div> 
 </form>
 <script src="JS/EmailVerification.js"></script>
</body>
</html>






