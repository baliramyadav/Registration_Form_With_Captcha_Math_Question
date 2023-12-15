<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="Registration_Form_With_Captcha_Math_Question.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>How to prevent robots from automatically filling up a form?</h2>
            <fieldset style="width: 550px;">
                <legend> <h3>Registration Form</h3> </legend>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <table align="center">
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Please enter Name" ControlToValidate="txtName" Display="Dynamic" ForeColor="#FF3300" SetFocusOnError="True" ValidationGroup="group1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Please enter up to 20 characters." ValidationExpression="^[a-zA-Z\s]{0,20}$" Display="Dynamic" ValidationGroup="group1"> </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please enter Email Id" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="group1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Please enter valid email id format" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="group1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblWhatsApp" runat="server" Text="WhatsApp Number:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtWhatsApp" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please enter WhatsApp Number" ControlToValidate="txtWhatsApp" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="group1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*Please enter a 10-digit WhatsApp mobile number" ControlToValidate="txtWhatsApp" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d{10}$" ValidationGroup="group1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCountryCode" runat="server" Text="Country Code:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCountryCode" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Please enter CountryCode" ControlToValidate="txtCountryCode" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="group1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*Please enter a valid Country Code" ControlToValidate="txtCountryCode" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(\+?)(88|86|91|92|81|65)$" ValidationGroup="group1"></asp:RegularExpressionValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMathQuestion" runat="server" Text="What is"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMathAnswer" runat="server"></asp:TextBox><br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td valign="middle">

                            <asp:UpdatePanel ID="UP1" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td style="height: 50px; width: 100px;">
                                                <asp:Image ID="imgCaptcha" runat="server" />
                                            </td>
                                            <td valign="middle">
                                                <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" ValidationGroup="group2" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            Enter captcha code :  
                        </td>
                        <td>
                            <asp:TextBox ID="txtCaptcha" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <!-- This label will show the validation message -->
                    <tr>
                        <td>
                            <asp:Label ID="lblValidation" runat="server" ForeColor="Red"></asp:Label><br />
                        </td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="group1" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </form>
</body>
</html>
