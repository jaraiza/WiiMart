<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %><a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>



<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<html>
	<head>
		<script>
			// prevent 209601 (idle on a page, times the user out)
			var wiishop = new wiiShop();
			const unused = wiishop.connecting;
		</script>
	
	
  <!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="/oss/favicon.ico" /> 
<link href="/oss/oss/common/css/oss.css" rel="stylesheet" type="text/css" />
<link href="/oss/oss/common/css/error.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
	var ecCheck = false;
	var errorCheck = false;
	var buttonsCheck = false;
	var imagesCheck = false;
	var soundCheck = false;
	var shopCheck = false;
	var ossCheck = false;
//-->
</script>

<SCRIPT language="JavaScript" src="/oss/oss/common/js//ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//error.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//images.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//oss.js"></SCRIPT>

<script type="text/JavaScript">
<!--
var testMode = 'false';

function getMethod()
{
	return '<%= request.getMethod() %>';	
}

function getPostParams()
{
    var params = "";    
   
   return params;
}

function isConnectingPage()
{
    var isConnecting = '';
    return (isConnecting == 'true');
}

function listPurchaseHistory() {
	trace("hi")
	var ec = new ECommerceInterface();
	var progress = ec.getPurchaseInfo();

    opName = "list purchase history";
    opDesc = "listing purchase history for device";
    finishOp(opName, opDesc, progress, "listPurchaseHistoryDone");
}

function listPurchaseHistoryDone(progress) {
	showResult (progress, opName, opDesc);
}

function initPageCommon()
{
	var isShoppingManualEnabled = "true";
    	if (ecSupportsSession()) {
        	isShoppingManualEnabled = ec.getSessionValue("isShopManEnabled");
    	}
    
    	if (isShoppingManualEnabled != "true") {
    		hideElement("tophelpshadow");
	    	hideElement("help");
    	}
    	
	var ecsUrl = null;
	var iasUrl = null;
	var ccsUrl = null;
	var ucsUrl = null;
	var currBalance = null;

    // js file loading check
	var shopErrCheck = new wiiShop();
	if (shopErrCheck != null && "error" in shopErrCheck) {
		// shopErrCheck.error(209620, 1);
		if (!ecCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!errorCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!buttonsCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!imagesCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!soundCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!shopCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!ossCheck) {
			shopErrCheck.error(209620, 1);
		}
	}

	init();
	
	// Cancel any ongoing async ops
	ec.cancelOperation();
	

	ecsUrl = 'https://oss-auth.blinklab.com/oss/ecs/services/ECommerceSOAP';

	iasUrl = 'https://oss-auth.blinklab.com/oss/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.cdn.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.larsenv.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.blinklab.com/oss/serv/";
	secureOssPath = "https://oss-auth.blinklab.com/oss/serv/";	

	ecTimeout = new ECTimeout(parseInt("900000"));
	
	
	currBalance = document.getElementById("currentBalance");
	if(currBalance) {
		currBalance.innerHTML = getBalance();
	}		
	
	setLogUrl("Log.jsp");

    if(shop.isCompatibleMode)
    {
        setEulaUrl("L_01.jsp");
    }
    else
    {
        setEulaUrl("L_03_UA_1.jsp");
    }

	
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_a.gif');
	var supportsCreditCard = 'true';
	if (ecSupportsSession()) {
        	ec.setSessionValue("supportsCreditCard", supportsCreditCard);
    	}

    updateHistory();
	var isConnecting = isConnectingPage();
    setConnectingToServer(isConnecting);
    
    if (isHRPDisablePage()) {
	   	wiiEnableHRP();
	} else {
	   	wiiEnableHRP();
	}
}

<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->


// Takes a progress object and returns the OSS error message to be displayed to the user
function getOssErrorMsg(progress)
{
	if (progress.status >= 0) { return ""; }
	
    var status = progress.status;
    var errCode = progress.errCode;
    var errInfo = progress.errInfo;

    var msg;	

	var a = new Array();	
	// EC lib Errors
	//a[-(EC_ERROR_CANCELED)] = "???OSS_ERROR_NETWORK_TIMEOUT???";
	a[-(EC_ERROR_NET_NA)] = "There was a network error. Please check your Internet settings and your network configuration.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_ECARD)] = "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_REGISTER)] = "The Wii Number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_ALREADY_OWN)] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	msg = a[-status];

    if (status == EC_ERROR_WS_REPORT) {
    	 msg = getWebServiceErrorMsg(errCode, errInfo);
    } else if (status == EC_ERROR_NET_CONTENT ||
               status == EC_ERROR_FAIL ||
    	       status == EC_ERROR_WS_RECV) {
    	if (errCode != null && errCode < 0) {
    	    var httpStatus = errCodeToHTTPStatus(errCode);
    	    var nhttpStatus = errCodeToNHTTPStatus(errCode);    
      	    if (nhttpStatus == 0 && shop.isCompatibleMode) {
    		    msg = "There was a network error. Check your settings under the Internet option in System Settings on the Wii U Menu.";
    		} else if (nhttpStatus == 0) {
    		    msg = "There was a network error. Please check your Internet settings and your network configuration.<BR><BR>Visit support.nintendo.com for assistance.";
    		} else if (nhttpStatus != 0) {
    		    msg = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "Error Code: <span id='errorCode'></span></span>"
		+ '<BR><span class="contentsRedM">' + errorMsg + '</span>';
	elem.innerHTML = html;
	document.getElementById("errorCode").innerHTML = errorCode;
}

function setErrorHtml(elem, progress)
{
	if (elem != null) {
	    var errorCode = getOssErrorCode(progress);
    	var errorMsg = getOssErrorMsg(progress);
    	setErrorHtmlMsg(elem, errorCode, errorMsg);
	}
}


// Web service error messages 
// (only include message that may potentially be displayed to user)
// (errCode is progress.errCode from a web service)
// (errInfo is progress.errInfo from a web service)
function getWebServiceErrorMsg(errCode, errInfo)
{
	var a = new Array();
	
	// ECS Errors
	a[617] = "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[618] = "This Wii Points Card cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";
	a[621] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[623]	= "You have downloaded this title before, and your trial period has expired. You cannot redownload it.<BR><BR>Visit support.nintendo.com for assistance.";
	a[642] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[643] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[644] = "Credit cards cannot be used on this console.<BR><BR>Please visit support.nintendo.com for assistance.";
	a[645] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ECS Gift Errors
	a[646] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[621] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[626] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[625] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ETS Errors
	a[705] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[706] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[707] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// PAS Errors
	a[810]	= "An error has occurred while redeeming your Wii Download Ticket.<BR><BR>Visit support.nintendo.com for assistance.";
	a[811]	= "The Wii Points Card you entered has expired.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "This Wii Points Card has already been redeemed.<BR><BR>Visit support.nintendo.com for assistance.";
	a[819]	= "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	
	a[826]	= "The server is busy.<BR><BR>Please try again later.";
	a[829]	= "The server is busy.<BR><BR>Please try again later.";
	a[830]	= "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[831] = "This Wii Points Card cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";

	// IAS Errors 
	a[901]	= "The Wii Number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[903]	= "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[928] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[958]	= "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[942] = "Unable to confirm the Username at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[943]	= "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";

	a[941] = "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";
	
	// More IAS Errors
	a[1401] = "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";
	a[1402] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this WiiMart account.<BR><BR>Visit support.nintendo.com for assistance.";
        a[1403] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this WiiMart account.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1499] = "Unable to confirm the Username at this time. The server is currently undergoing maintenance.<BR><BR>Sorry for the inconvenience. Please try again later.";
	
	// OSS Errors
	a[1610]	= "The Wii Download Ticket you entered has expired.";
	a[1611]	= "The Wii Download Ticket code you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1612] = "This Wii Download Ticket cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1613] = "There is no software available at this time for the Wii Download Ticket code you entered. Please check that you have entered the correct code.<BR><BR>NOTE: If you have activated Parental Controls, you may not be able to view all available software in the WiiMart. Please check your Parental Controls settings.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "Unable to confirm the Username at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "County is required.<BR><BR>Please try again.";
	a[NOA_ERROR_FoundOnBlacklist]				= "Unable to process.<BR><BR>For more information, visit support.nintendo.com.";
	a[NOA_ERROR_BillingAddress]                             = "The information you&rsquo;ve entered regarding your credit-card billing address is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCardType]                            = "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidVfyValue]                            = "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidExpDate]				= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidPostalCode]                          = "The postal code does not match the country settings entered in your Wii Settings.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_TechnicalDifficulties]			= "Unable to confirm credit-card information at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance.";
	a[NOA_ERROR_TryAgainLater]				= "Unable to confirm credit-card information at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "The credit-card expiration date is invalid.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "Billing zip/postal code is invalid. Please verify the information and try again. ";

	a[NOA_ERROR_EmptyVfyValue]				= "Please enter the three-digit security code.";

	var msg = a[code];
	return msg;
}

// IAS errors
function isLoyaltyError(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode >= 1400 && 
		     progress.errCode <= 1499) ||
			(progress.errCode == 942) ||
			(progress.errCode == 943) ||
			(progress.errCode == 941)) {
			return true;
		}
	}
	return false;
}	

function needCheckRegistration(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode == 903) ||
		     (progress.errCode == 642) ||
		     (progress.errCode == 625)) {
			return true;
		}
	}
	return false;		
}

function needSyncEticket(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if (progress.errCode == 621) {
			return true;
		}
	}
	return false;		
}



//-->

</script>
<title>WiiMart</title>
<style type="text/css">
/* W_03:  WiiMart Main Page */

#WW_off_banner02 {
	position:absolute;
	left:325px;
	top:80px;
	width:256px;
	height:131px;
	z-index:33;
}
#WW_off_banner01 {
	position:absolute;
	left:28px;
	top:80px;
	width:256px;
	height:131px;
	z-index:36;
}
#WW_off_spacer01 {
	position:absolute;
	left:28px;
	top:80px;
	width:256px;
	height:131px;
	z-index:38;
}
#WW_off_text01-01 {
	position:absolute;
	left:35px;
	top:103px;
	width:242px;
	height:22px;
	z-index:37;
}
#WW_off_spacer02 {
	position:absolute;
	left:325px;
	top:80px;
	width:256px;
	height:131px;
	z-index:35;
}
#WW_off_text02-01 {
	position:absolute;
	left:343px;
	top:135px;
	width:142px;
	height:22px;
	z-index:34;
}

#W_03-title-bg {
    position:absolute;
    width: 551px;
    height: 42px;
    z-index: 3;
    left: 24px;
    top: 25px;
}

#W_03-title {
	position:absolute;
	left:29px;
	top:28px;
	width:570px;
	height:28px;
	z-index:28;
}
#banner01 {
	position:absolute;
	left:17px;
	top:73px;
	width:191px;
	height:149px;
	z-index:36;
}
#banner07 {
	position:absolute;
	left:210px;
	top:73px;
	width:191px;
	height:149px;
	z-index:36;
}
#banner02 {
	position:absolute;
	left:403px;
	top:73px;
	width:191px;
	height:149px;
	z-index:36;
}
#banner03 {
	position:absolute;
	left:158px;
	top:223px;
	width:292px;
	height:69px;
	z-index:30;
}
#banner04 {
	position:absolute;
	left:21px;
	top:303px;
	width:184px;
	height:59px;
	z-index:27;
}
#banner05 {
	position:absolute;
	left:403px;
	top:303px;
	width:184px;
	height:59px;
	z-index:24;
}
#banner06 {
	position:absolute;
	left:212px;
	top:303px;
	width:184px;
	height:59px;
	z-index:24;
}

#spacer01 {
	position:absolute;
	left:27px;
	top:83px;
	width:171px;
	height:129px;
	z-index:100;
}
#spacer07 {
	position:absolute;
	left:220px;
	top:83px;
	width:171px;
	height:129px;
	z-index:100;
}
#spacer02 {
	position:absolute;
	left:413px;
	top:83px;
	width:171px;
	height:129px;
	z-index:100;
}
#spacer03 {
	position:absolute;
	left:158px;
	top:223px;
	width:292px;
	height:69px;
	z-index:32;
}
#spacer04 {
	position:absolute;
	left:21px;
	top:303px;
	width:184px;
	height:59px;
	z-index:29;
}
#spacer05 {
	position:absolute;
	left:403px;
	top:303px;
	width:184px;
	height:59px;
	z-index:26;
}
#spacer06 {
	position:absolute;
	left:212px;
	top:303px;
	width:184px;
	height:59px;
	z-index:26;
}

#text01-01 {
	position:absolute;
	left:27px;
	top:174px;
	width:171px;
	height:22px;
	z-index:37;
}
#text07-01 {
	position:absolute;
	left:220px;
	top:174px;
	width:171px;
	height:22px;
	z-index:37;
}
#text02-01 {
	position:absolute;
	left:413px;
	top:174px;
	width:171px;
	height:22px;
	z-index:37;
}
#text03-01 {
	position:absolute;
	left:193px;
	top:244px;
	width:224px;
	height:22px;
	z-index:31;
}
#text04-01 {
	position:absolute;
	left:31px;
	top:303px;
	width:164px;
	height:59px;
	z-index:28;
}
#text05-01 {
	position:absolute;
	left:413px;
	top:303px;
	width:164px;
	height:59px;
	z-index:25;
}
#text06-01 {
	position:absolute;
	left:222px;
	top:303px;
	width:164px;
	height:59px;
	z-index:25;
}

#titlespacer {
	position:absolute;
	left:29px;
	top:28px;
	width:554px;
	height:40px;
	z-index:46;
}

#nicknameBox_VC {
	position:absolute;
	left:17px;
	top:48px;
	width:577px;
	height:47px;
	z-index:99;
}
#nicknameBox_WW {
	position:absolute;
	left:17px;
	top:48px;
	width:577px;
	height:47px;
	z-index:99;
}
#nicknameBox_WC {
	position:absolute;
	left:17px;
	top:48px;
	width:577px;
	height:47px;
	z-index:99;
}

body {

    background-image: url(/oss/oss/common/images//back/A_03_back3.gif);

    background-repeat: no-repeat;
    background-color: #FFFFFF;
}

</style>
<script type="text/javascript">
	
function initPage()
{
    initPageCommon();
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
                     '/oss/oss/common/images//banner/Wiipoint_banner_b.gif',
                     '/oss/oss/common/images//banner/goTop_Press.png',
                     '/oss/oss/common/images//banner/goTop_Over.png',
                     '/oss/oss/common/images//banner/goTop_noAction.png',
                     '/oss/oss/common/images//banner/option2_b.png');


    MM_preloadImages('/oss/oss/common/images//banner/top_buy_vc_b.png',
                     '/oss/oss/common/images//banner/top_buy_wiiware_b.png',
                     '/oss/oss/common/images//banner/top_buy_wiichannel_b.png',
                     '/oss/oss/common/images/banner/nameplate_L_W_03.png',
                     '/oss/oss/common/images/banner/nameplate_C_W_03.png',
                     '/oss/oss/common/images/banner/nameplate_R_W_03.png');
    hideElement("WW_off");
    showElement("WW_on_text");
    showElement("WW_on_banner");
    showElement("WW_on_spacer");


    setUnderButtonL(true, "Wii Menu", "javascript:showWiiMenu()", "wiiSelectSound()");
    
    var isShoppingManualEnabled = "true";
        if (ecSupportsSession()) {
            isShoppingManualEnabled = ec.getSessionValue("isShopManEnabled");
        }
    
        if (isShoppingManualEnabled == "true") {
        setUnderButtonR(true, "Shopping Guide", "javascript:showHelp()", "wiiSelectSound()");
    } else {
        setUnderButtonR(false);
    }

    if (ecSupportsSession()) {
        // possibly set session variables in B_24, clear them in W_03 in case of escaping re-download processing.
        ec.setSessionValue("giftStatus", null);
        trace("clear giftStatus in W_03. ");
        ec.setSessionValue("redownloadFlag", null);
        trace("clear redownloadFlag in W_03. ");
        ec.setSessionValue("senderIndex", null);
        trace("clear senderIndex in W_03. ");
        ec.setSessionValue("transId", null);
        trace("clear transId in W_03. ");
    	ec.setSessionValue("transType", null);
    	trace("clear transType in W_03. ");
        ec.setSessionValue("useCampaignCode", null);
        trace("clear useCampaignCode in W_03. ");
        ec.setSessionValue("gameCardNum", null);
        trace("clear gameCardNum in W_03. ");
    }
    
	
}
//-->
</script>
</head>

<body onload="initPage();">
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<script language="JavaScript">MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');</script>
<div id="underButtonL" style="display:none">
    <div id="underbannershadowL" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerL" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgL" />
    </div>
    <div id="underspacerL" class="buttonSpacer">
	  <a href="" id="underlinkL">
    	<img id="underimageL" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgL','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordL" align="center" class="buttonTextBlackM buttonWord">
    </div>
</div>

<div id="underButtonR" style="display:none">
    <div id="underbannershadowR" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerR" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgR" />
    </div>
    <div id="underspacerR" class="buttonSpacer">
	  <a href="" id="underlinkR">
    	<img id="underimageR" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgR','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus ); " 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordR" align="center" class="buttonTextBlackM buttonWord">
    </div>
</div>

<div id="underButton" style="display:none">
    <div id="underbannershadow" class="buttonBannerShadow">
    	<img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
    <div id="underbanner" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImg" /></div>
    <div id="underspacer" class="buttonSpacer">
	<a href="" id="underlink">
    	<img id="underimage" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" 
    	onmouseover="MM_swapImage('underImg','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()">
    	</a>
    </div>
    <div id="underword" align="center" class="buttonTextBlackM buttonWord"></div>
</div>


<div id="WW_off">
<div id="WW_off_text02-01">
  <div align="center" class="contentsGrayL">
    <div align="left">　WiiWare</div>
  </div>
</div>
<div id="WW_off_text01-01">
  <div align="center" class="contentsGrayL">Virtual Console</div>
</div>
</div>

<div id="WW_on_text">
<div id="text01-01">
  <div align="center" class="contentsBlackS">Virtual Console</div>
</div>
<div id="text07-01">
  <div align="center" class="contentsBlackS">WiiWare</div>
</div>
<div id="text02-01">
  <div align="center" class="contentsBlackS">Wii Channels</div>
</div>
</div>
<div id="text03-01"> 
  <table width="100%" height="100%"><tr><td align="center" valign="middle"><div align="center" class="buttonTextBlackM">Add Wii Points</div></td></tr></table>
</div>
<div id="text04-01">
  <table width="100%" height="100%"><tr><td align="center" valign="middle"><div align="center" class="buttonTextBlackM">Account Activity</div></td></tr></table>
</div>
<div id="text05-01">
  <table width="100%" height="100%"><tr><td align="center" valign="middle"><div align="center" class="buttonTextBlackM">Settings and Features</div></td></tr></table>
</div>
<div id="text06-01">
  <table width="100%" height="100%"><tr><td align="center" valign="middle"><div align="center" class="buttonTextBlackM">Titles You&rsquo;ve Downloaded</div></td></tr></table>
</div>

<div id="WW_on_banner">
<div id="banner01"><img src="/oss/oss/common/images//banner/top_buy_vc_a.png" width="191" height="149" id="Image1" /></div>
<div id="banner07"><img src="/oss/oss/common/images//banner/top_buy_wiiware_a.png" width="191" height="149" id="Image7" /></div>
<div id="banner02"><img src="/oss/oss/common/images//banner/top_buy_wiichannel_a.png" width="191" height="149" id="Image2" /></div>

<div id="nicknameBox_VC" style="display:none" align="left">
  <table cellspacing=0 cellpadding=0>
  <tbody>
  <tr>
    <td>
      <img src='/oss/oss/common/images/banner/nameplate_L_W_03.png' />
    </td>
    <td style='background-image:url("/oss/oss/common/images/banner/nameplate_C_W_03.png");' align="left">
      <span class="contentsBlack">Classic games from<BR>past systems</span>
    </td>
    <td>
      <img src='/oss/oss/common/images/banner/nameplate_R_W_03.png' />
    </td>
  </tr>
  </tbody>
  </table>
</div>
<div id="nicknameBox_WW" style="display:none" align="center">
  <table cellspacing=0 cellpadding=0><tbody>
  <tr>
    <td>
      <img src='/oss/oss/common/images/banner/nameplate_L_W_03.png' />
    </td>
    <td style='background-image:url("/oss/oss/common/images/banner/nameplate_C_W_03.png");' align="left">
      <span class="contentsBlack">Original Wii titles<BR>available only here</span>
    </td>
    <td>
      <img src='/oss/oss/common/images/banner/nameplate_R_W_03.png' />
    </td>
  </tr>
  </tbody>
  </table>
</div>
<div id="nicknameBox_WC" style="display:none" align="right">
  <table cellspacing=0 cellpadding=0><tbody>
  <tr>
    <td>
      <img src='/oss/oss/common/images/banner/nameplate_L_W_03.png' />
    </td>
    <td style='background-image:url("/oss/oss/common/images/banner/nameplate_C_W_03.png");' align="left">
      <span class="contentsBlack">Channels to enhance<BR>your Wii experience</span>
    </td>
    <td>
      <img src='/oss/oss/common/images/banner/nameplate_R_W_03.png' />
    </td>
  </tr>
  </tbody>
  </table>
</div>
</div>

<div id="banner03"><img src="/oss/oss/common/images//banner/Wiipoint_banner_a.gif" width="292" height="69" id="Image3" /></div>
<div id="banner04"><img src="/oss/oss/common/images//banner/option2_a.png" width="184" height="59" id="Image4" /></div>
<div id="banner05"><img src="/oss/oss/common/images//banner/option2_a.png" width="184" height="59" id="Image5" /></div>
<div id="banner06"><img src="/oss/oss/common/images//banner/option2_a.png" width="184" height="59" id="Image6" /></div>

<div id="WW_on_spacer">
<div id="spacer01">
  <a href="javascript:showPage('B_01.jsp')">
    <img src="/oss/oss/common/images//spacer.gif" width="171" height="129" border="0" 
     onmouseover="MM_swapImage('Image1','','/oss/oss/common/images//banner/top_buy_vc_b.png',1);snd.playSE( cSE_Forcus ); document.getElementById('nicknameBox_VC').style.display='';" 
     onmouseout="document.getElementById('nicknameBox_VC').style.display='none'; MM_swapImgRestore()" 
     onclick="snd.playSE(cSE_Decide);"/>
  </a>
</div>
<div id="spacer07">
  <a href="javascript:showPage('B_27.jsp')">
    <img src="/oss/oss/common/images//spacer.gif" width="171" height="129" border="0" 
     onmouseover="MM_swapImage('Image7','','/oss/oss/common/images//banner/top_buy_wiiware_b.png',1);snd.playSE( cSE_Forcus ); document.getElementById('nicknameBox_WW').style.display='';" 
     onmouseout="document.getElementById('nicknameBox_WW').style.display='none'; MM_swapImgRestore()" 
     onclick="snd.playSE(cSE_Decide);"/>
  </a>
</div>
<div id="spacer02">
  <a href="javascript:showPage('B_04.jsp?p=1&platform=WII')">
    <img src="/oss/oss/common/images//spacer.gif" width="171" height="129" border="0" 
     onmouseover="MM_swapImage('Image2','','/oss/oss/common/images//banner/top_buy_wiichannel_b.png',1);snd.playSE( cSE_Forcus ); document.getElementById('nicknameBox_WC').style.display='';" 
     onmouseout="document.getElementById('nicknameBox_WC').style.display='none'; MM_swapImgRestore()" 
     onclick="snd.playSE(cSE_Decide);"/>
  </a>
</div>
</div>

<div id="spacer03">
  <a href="javascript:showPoints()">
    <img src="/oss/oss/common/images//spacer.gif" width="292" height="69" border="0" 
     onmouseover="MM_swapImage('Image3','','/oss/oss/common/images//banner/Wiipoint_banner_b.gif',1);snd.playSE( cSE_Forcus );" 
     onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"/>
  </a>
</div>
<div id="spacer04">
  <a href="javascript:showTransactions()">
    <img src="/oss/oss/common/images//spacer.gif" width="184" height="59" border="0" 
     onmouseover="MM_swapImage('Image4','','/oss/oss/common/images//banner/option2_b.png',1);snd.playSE( cSE_Forcus );" 
     onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"/>
  </a>
</div>
<div id="spacer05">
  <a href="javascript:showSettings()">
    <img src="/oss/oss/common/images//spacer.gif" width="184" height="59" border="0" 
     onmouseover="MM_swapImage('Image5','','/oss/oss/common/images//banner/option2_b.png',1);snd.playSE( cSE_Forcus );" 
     onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"/>
  </a>
</div>
<div id="spacer06">
  <a href="javascript:shop.beginWaiting(1);showOwnedTitles()">
    <img src="/oss/oss/common/images//spacer.gif" width="184" height="59" border="0" 
     onmouseover="MM_swapImage('Image6','','/oss/oss/common/images//banner/option2_b.png',1);snd.playSE( cSE_Forcus );" 
     onmouseout="MM_swapImgRestore()" 
     onclick="snd.playSE(cSE_Decide);"/>
</a>
</div>


<div id="W_03-title-bg"><img src="/oss/oss/common/images//banner/GifA_SoftList_noAction.png" name="goTop" /></div>
<div id="W_03-title" align="left" class="titleBlueL">WiiMart</div>


<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>

<div id='balanceInfo' onclick="showPoints(); wiiSelectSound();" 
 onmouseover="MM_swapImage('PointSpacer','','/oss/oss/common/images//banner/Addpoints_everywhere.gif',1);wiiFocusSound();" 
 onmouseout="MM_swapImgRestore();">
  <script type="text/JavaScript">MM_preloadImages('/oss/oss/common/images//banner/Addpoints_everywhere.gif');</script>
  <img src="/oss/oss/common/images//spacer.gif" name="PointSpacer" width="130" height="55" border="0"
     id='PointSpacer' style="position:absolute; top:376px; left:239px; z-index:20;"/>
  <div id="Wiipoint">
    <div align="center" class="buttonTextBlackM">Wii Points</div>
  </div>
  <div id="point" class="wiiPoint"><span id="currentBalance"></span></div>
</div>

<div id="titlespacer">
    <a href="javascript:showPage('W_01.jsp')">
        <img src="/oss/oss/common/images//spacer.gif" width="561" height="36" border="0" 
            onmousedown="MM_swapImage('goTop','','/oss/oss/common/images//banner/goTop_Press.png',1);" 
            onmouseup="MM_swapImage('goTop','','/oss/oss/common/images//banner/goTop_Over.png',1)" 
            onmouseover="MM_swapImage('goTop','','/oss/oss/common/images//banner/goTop_Over.png',1); snd.playSE( cSE_Forcus );"  
            onmouseout="MM_swapImage('goTop','','/oss/oss/common/images//banner/goTop_noAction.png',1);" 
            onclick="snd.playSE(cSE_Decide);"
        />
    </a>
</div>

</body>
</html>
