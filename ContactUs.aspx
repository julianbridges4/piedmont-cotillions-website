<%@ Import Namespace="aspNetEmail" %>
<%@ Page Language="VB" %>
<!DOCTYPE html>
<script runat="server">

	Sub Page_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
		If Page.IsPostBack Then
			
		
			'Response.Write(Request.Form.AllKeys)
			Dim Body As String = ""
			
			For Each key As String In Request.Form.AllKeys
				Body &= key & " " & Request.Form.Item(key) & "<BR>"
				'Response.Write(key & " " & Request.Form.Item(key))
			Next
		
			''If Page.IsPostBack Then
			''mail.data-architech.com
			''andrea@data-architech.com
			''pwemkj
			Dim msg As New EmailMessage()

			'set the server
			msg.Server = "mail.data-architech.com"
			msg.Username = "andrea@data-architech.com"
			msg.Password = "pwemkj"
			'set the 'From Address'
			msg.FromAddress = "andrea@data-architech.com"

			'set the 'To Address'
			msg.AddTo("samuel@data-architech.com")

			'set the subject
			msg.Subject = "test sub"

			'because the email is formatted using 'text' we only
			'need to check to see if 'html' was selected.

			msg.BodyFormat = MailFormat.Html
		

			'now get the body
			msg.Body = Server.HtmlDecode(Body)

			'Don't throw any internal exceptions
			msg.ThrowException = False

			'turn logging on, in case there was an error, but only for testing. There is a perf hit for this feature.
			msg.Logging = False
			msg.LogBody = False

			Dim returnmsg As String
			
			If msg.Send() Then
				returnmsg = "The message was sent!"
			Else
				'if an error occurred, write it out to the screen
				returnmsg = "<font color=#ff0033>The following error occurred while sending the email: " & msg.LastException().Message & "</font><br>Here is the full SMTP Session Log<pre>" + Server.HtmlEncode(msg.GetLog()) + "</pre>"
			End If

			'Show the SMTP Session
			'returnmsg &= "<BR><b>Log</b><pre>" + msg.GetLog() + "</pre>"
			Me.MsgOutput.Controls.Add(New LiteralControl(returnmsg))
			Me.MsgOutput.Visible = True
			Me.FormHolder.Visible = False
			
			
			
		'	Response.Write(returnmsg)
		End If
	End Sub

</script>

<html> 
<head>
	<title></title>
	<link type="text/css" href="css/master.css?v=1" rel="stylesheet" />
	
	<script type="text/javascript" src="js/flexcroll.2.0.js"></script>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.hoverIntent.minified.js"></script>
	<script type="text/javascript" src="js/JQuery_SlideShow_Cross.js"></script>
	<script type="text/javascript" src="js/JQ-includes.js"></script>
	<script type="text/javascript">
		$(function () {
		});
	</script>
	<style type="text/css">
		#Content 
		{
			height:480px;
			overflow:auto;
			color:#FFF;

		}
		
	#Content h3
	{
		padding:10px 10px;
		margin-top:20px;
		color:#ca7b41;
	}
	
	#Content p
	{
		padding:10px 10px;

	}
	#Content a
	{
		color:#ca7b41;
		text-decoration:none;
	}
	
	#Content a:hover
	{
		color:#000;
	}
	</style>
</head>
<body>

    <form id="form1" runat="server">

	<div id="Header">

	</div>

	<div id="Content" class='flexcroll'>

	
	<asp:PlaceHolder runat="server" ID="MsgOutput" Visible="false"></asp:PlaceHolder>
	<asp:PlaceHolder runat="server" ID="FormHolder">
    <table style='margin: 0px 0px 0px 80px; line-height: normal;'; width="795" height="468" cellspacing="1" cellpadding="5" border="0" style="text-align: center; background-color: #ffffff;";border-left-width: 0px;>
        <tbody>
            <tr bgcolor="#C8733A">
                <td align="center" style="font-family: verdana,arial,helvetica,sans-serif; font-size: 8pt; color: #000000; text-decoration: none; font-weight: normal;">
                <table width="90%" cellspacing="0" cellpadding="3" border="0">
                    <tbody>
                        <tr>
                            <td align="center" style="font-family: arial,helvetica,sans-serif; font-size: 12pt; font-weight: bold;"><span controlid="wstForm_Contact" id="formLabel_ContactForm">Contact Information</span><br />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-family: verdana,arial,helvetica,sans-serif; font-size: 8pt; color: #000000; text-decoration: none; font-weight: normal; padding-bottom: 10px;">
                            <p style="text-align: justify;">Please complete for more information on Piedmont Cotillion classes in your area!</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table width="90%" cellspacing="1" cellpadding="3" border="0">
                    <tbody>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_First" id="formLabel_First">First Name:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_First" name="FirstName" id="formElement_First" gtbfieldid="37" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_Last" id="formLabel_Last">Last Name:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_Last" name="LastName" id="formElement_Last" gtbfieldid="38" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_CFirst" id="formLabel_First">Child's First Name:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_First" name="First Name" id="formElement_CFirst" gtbfieldid="37" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_CLast" id="formLabel_Last">Child's Last Name:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_CLast" name="Last Name" id="formElement_CLast" gtbfieldid="38" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_CGender" id="formLabel_CGender">Child's Gender</span></td>
                            <td style="font-size: 8pt; text-align: left;">
                            <select labelid="formLabel_CGender" name="CGender" id="formElement_CGender" gtbfieldid="77">
                            <option selected="selected" value=" "> </option>
                            <option value="M">Male</option>
                            <option value="F">Female</option>
                            </select>
                            </td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_Street1" id="formLabel_Street1">Address Street 1:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_Street1" name="Address Street 1" size="30" id="formElement_Street1" gtbfieldid="39" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_Street2" id="formLabel_Street2">Address Street 2:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_Street2" name="Address Street 2" size="30" id="formElement_Street2" gtbfieldid="40" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_City" id="formLabel_City">City:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_City" name="City" id="formElement_City" gtbfieldid="41" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_Zip" id="formLabel_Zip">Zip Code:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_Zip" maxlength="5" name="Zip Code" size="5" id="formElement_Zip" gtbfieldid="42" /> (5 digits)</td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_State" id="formLabel_State">State:</span></td>
                            <td style="font-size: 8pt; text-align: left;">
                            <select labelid="formLabel_State" name="State" id="formElement_State" gtbfieldid="43">
                            <option value="AL">AL</option>
                            <option value="AK">AK</option>
                            <option value="AZ">AZ</option>
                            <option value="AR">AR</option>
                            <option value="CA">CA</option>
                            <option value="CO">CO</option>
                            <option value="CT">CT</option>
                            <option value="DE">DE</option>
                            <option value="DC">DC</option>
                            <option value="FL">FL</option>
                            <option value="GA">GA</option>
                            <option value="HI">HI</option>
                            <option value="ID">ID</option>
                            <option value="IL">IL</option>
                            <option value="IN">IN</option>
                            <option value="IA">IA</option>
                            <option value="KS">KS</option>
                            <option value="KY">KY</option>
                            <option value="LA">LA</option>
                            <option value="ME">ME</option>
                            <option value="MD">MD</option>
                            <option value="MA">MA</option>
                            <option value="MI">MI</option>
                            <option value="MN">MN</option>
                            <option value="MS">MS</option>
                            <option value="MO">MO</option>
                            <option value="MT">MT</option>
                            <option value="NE">NE</option>
                            <option value="NV">NV</option>
                            <option value="NH">NH</option>
                            <option value="NJ">NJ</option>
                            <option value="NM">NM</option>
                            <option value="NY">NY</option>
                            <option selected="selected" value="NC">NC</option>
                            <option value="ND">ND</option>
                            <option value="OH">OH</option>
                            <option value="OK">OK</option>
                            <option value="OR">OR</option>
                            <option value="PA">PA</option>
                            <option value="RI">RI</option>
                            <option value="SC">SC</option>
                            <option value="SD">SD</option>
                            <option value="TN">TN</option>
                            <option value="TX">TX</option>
                            <option value="UT">UT</option>
                            <option value="VT">VT</option>
                            <option value="VA">VA</option>
                            <option value="WA">WA</option>
                            <option value="WV">WV</option>
                            <option value="WI">WI</option>
                            <option value="WY">WY</option>
                            </select>
                            </td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_DaytimePhone" id="formLabel_DaytimePhone">Daytime Phone:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_DaytimePhone" name="Daytime Phone" id="formElement_DaytimePhone" gtbfieldid="44" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_EveningPhone" id="formLabel_EveningPhone">Evening Phone:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_EveningPhone" name="Evening Phone" id="formElement_EveningPhone" gtbfieldid="45" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_Email" id="formLabel_Email">Email:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><input labelid="formLabel_Email" name="Email" id="formElement_Email" gtbfieldid="46" /></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_CGender" id="Span1">How Did You Hear About Us?</span></td>
                            <td style="font-size: 8pt; text-align: left;">
                            <select labelid="formLabel_HearAbout" name="HearAbout" id="Select1" gtbfieldid="51">
                            <option selected="selected" value=" "> </option>
                            <option value="Newspaper Advertisement">Newspaper Advertisement</option>
                            <option value="Flyer Mailing">Flyer Mailing</option>
                            <option value="Website">Website</option>
                            <option value="School Directory Advertisement">School Directory Advertisement</option>
                            <option value="Other">Other</option>
                            </select>
                            </td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_Other" id="Span2">Other</span></td>
                            <td style="font-size: 8pt; text-align: left;"><textarea labelid="formLabel_Other" style="width: 100%;" cols="38" rows="1" name="Other" id="Textarea1">Other</textarea></td>
                        </tr>
                        <tr bgcolor="#C8733A">
                            <td style="font-size: 8pt; text-align: left;"><span controlid="formElement_Comments" id="formLabel_Comments">Comments:</span></td>
                            <td style="font-size: 8pt; text-align: left;"><textarea labelid="formLabel_Comments" style="width: 100%;" cols="38" rows="3" name="Comments" id="formElement_Comments">Enter comments here</textarea></td>
                        </tr>
                    </tbody>
                </table>
                <p><input type="submit" name="submit" value="Submit"><input type="reset" value="Reset" id="wstForm_Contact_Reset" /></p>
                </td>
            </tr>
        </tbody>
    </table>
    <input type="hidden" value="Contact Form." name="FormMailerSubject" id="FormMailerSubject" /><input type="hidden" value="http://piedmontcotillions.com/Home_Page.html" name="FormMailerRedirect" id="FormMailerRedirect" />
</asp:PlaceHolder>

	</div>




<div id="Footer">
</div>

</div>
</form>
</body>
</html>
