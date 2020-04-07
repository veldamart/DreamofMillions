<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="DreamofMillions.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Member Registration Page</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link href="Content/bootstrap.min.css" rel="stylesheet"/>
    <meta name="title" content="Registration"/>
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'media="screen" />
     <style type="text/css">
        body
        {
            margin: 20pt !important;
        }
    </style>
 </head>
<body>
<section>
<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-top">
<div class="container-fluid">
  <a class="navbar-brand" href="#">Tenant Page</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarNav">
<ul class="navbar-nav">
<li class="nav-item active">
<a class="nav-link" href="Index.aspx">Home<span class="sr-only">(current)</span></a></li>
<li class="nav-item">
<a class="nav-link" href="#">My Account</a></li>
<li class="nav-item">
<a class="nav-link Dashboard" href="#">Dashboard</a></li>
<li class="nav-item">
<a class="nav-link Contact" href="#">Contact</a></li>
</ul>
</div>
</div>
</nav>
</section><br /><br />
 <form id="form1" runat="server">
<div style="max-width: 400px;">
<fieldset>
<legend style="text-align:center; width: 317px;">Login</legend>
     <label for="Username">Username</label>
    <asp:TextBox ID="Username" runat="server" CssClass="form-control" placeholder="Enter Username" required="required" /><br />
    <label for="txtPassword">Password</label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password" required="required" />
    <label for="txtPassword">Password</label>
    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email" required="required" />
    <div class="checkbox">
    <asp:CheckBox ID="chkRememberMe" Text="Remember Me" runat="server" />
     <br />
    <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="ValidateUser" Class="btn btn-primary" />
    <br />
    <br />
    <asp:Label ID="dvMessage" runat="server" visible="false" Forecolor="Red" class="alert alert-danger"/>" 
    <%--<div id="dvMessage" runat="server" visible="false" class="alert alert-danger">--%>
    <strong>Error!</strong>
    <asp:Label ID="lblMessage" runat="server" />
     <br />
    <br />
        </div>
</fieldset>
</div>
 <div class="login">
<fieldset>
<legend style="text-align:center; width: 317px;">I&#39;ve forgotten my password</legend>
Email:<asp:TextBox CssClass="textbox" ID="txtpwEmail" runat="server" ValidationGroup="GetPassword" AutoPostBack="true"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
ErrorMessage="Password must be 8 characters and have both letters and numbers" ForeColor="Red" ValidationGroup="GetPassword" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
<br /><br />
<asp:Button ID="btnGetPassword" runat="server" ValidationGroup="GetPassword" Text="Get Password" />
</fieldset>
</div>
</form>
<script src="JS/EmailVerification.js"></script>
 <%--</form>--%>
 </body>
</html>
