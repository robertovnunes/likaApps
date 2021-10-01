<?php
if ($_GET['n'] == "is"){
	if ($_POST['ctrlis'] != "") {
		$abais = "'abais".$_POST['ctrlis']."'";
		$divis = "'divis".$_POST['ctrlis']."'";
	} else {
		$abais = "'abais1'";
		$divis = "'divis1'";
	}
	$s = "AlternarAbasIS(".$abais.",".$divis.")";
} else if ($_GET['n'] == "exame"){
 	if ($_POST['ctrlex'] != "") {
		$abaex = "'abaex".$_POST['ctrlex']."'";
		$divex = "'divex".$_POST['ctrlex']."'";
	} else {
		$abaex = "'abaex1'";
		$divex= "'divex1'";
	}
	$s = 'AlternarAbasEX('.$abaex.','.$divex.')';
} else if ($n == "histpaciente" && $_GET['n'] != "historico"){ 
	if ($_POST['ctrlhp'] != "") {
		$abahp = "'abahp".$_POST['ctrlhp']."'";
		$divhp = "'divhp".$_POST['ctrlhp']."'";
	} else {
		$abahp = "'abahp1'";
		$divhp= "'divhp1'";
	}
	$s = "AlternarAbasHP(".$abahp.",".$divhp.")";
}
?>

<html>
<head>
<link rel="shortcut icon" href="images/logo2.jpg" />
<title>PED - Prontu&aacute;rio de Semiologia Pedi&aacute;trica.</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="author" lang="pt-br" content="Dennis Silveira" />
<meta name="language" content="pt-br" />
<link rel="author" href="dwsilveira@gmail.com" />
<script type="text/javascript" src="jquery-1.2.1.pack.js"></script>
<script type="text/javascript">
	function lookup(inputString) {
		if(inputString.length == 0) {
			// Hide the suggestion box.
			$('#suggestions').hide();
		} else {
			$.post("rpc.php", {queryString: ""+inputString+""}, function(data){
				if(data.length >0) {
					$('#suggestions').show();
					$('#autoSuggestionsList').html(data);
				}
			});
		}
	} // lookup
	
	function fill(thisValue) {
		$('#inputString').val(thisValue);
		setTimeout("$('#suggestions').hide();", 300);
	}
</script>
<SCRIPT LANGUAGE="JavaScript" SRC="CalendarPopup.js"></SCRIPT>

<!-- This javascript is only used for the show/hide source on my example page.
     It is not used by the Calendar Popup script -->

<!-- This prints out the default stylehseets used by the DIV style calendar.
     Only needed if you are using the DIV style popup -->
<SCRIPT LANGUAGE="JavaScript">document.write(getCalendarStyles());</SCRIPT>

<!-- These styles are here only as an example of how you can over-ride the default
     styles that are included in the script itself. -->

<STYLE>
	.TESTcpYearNavigation,
	.TESTcpMonthNavigation
			{
			background-color:#6677DD;
			text-align:center;
			vertical-align:center;
			text-decoration:none;
			color:#FFFFFF;
			font-weight:bold;
			}
	.TESTcpDayColumnHeader,
	.TESTcpYearNavigation,
	.TESTcpMonthNavigation,
	.TESTcpCurrentMonthDate,
	.TESTcpCurrentMonthDateDisabled,
	.TESTcpOtherMonthDate,
	.TESTcpOtherMonthDateDisabled,
	.TESTcpCurrentDate,
	.TESTcpCurrentDateDisabled,
	.TESTcpTodayText,
	.TESTcpTodayTextDisabled,
	.TESTcpText
			{
			font-family:arial;
			font-size:8pt;
			}
	TD.TESTcpDayColumnHeader
			{
			text-align:right;
			border:solid thin #6677DD;
			border-width:0 0 1 0;
			}
	.TESTcpCurrentMonthDate,
	.TESTcpOtherMonthDate,
	.TESTcpCurrentDate
			{
			text-align:right;
			text-decoration:none;
			}
	.TESTcpCurrentMonthDateDisabled,
	.TESTcpOtherMonthDateDisabled,
	.TESTcpCurrentDateDisabled
			{
			color:#D0D0D0;
			text-align:right;
			text-decoration:line-through;
			}
	.TESTcpCurrentMonthDate
			{
			color:#6677DD;
			font-weight:bold;
			}
	.TESTcpCurrentDate
			{
			color: #FFFFFF;
			font-weight:bold;
			}
	.TESTcpOtherMonthDate
			{
			color:#808080;
			}
	TD.TESTcpCurrentDate
			{
			color:#FFFFFF;
			background-color: #6677DD;
			border-width:1;
			border:solid thin #000000;
			}
	TD.TESTcpCurrentDateDisabled
			{
			border-width:1;
			border:solid thin #FFAAAA;
			}
	TD.TESTcpTodayText,
	TD.TESTcpTodayTextDisabled
			{
			border:solid thin #6677DD;
			border-width:1 0 0 0;
			}
	A.TESTcpTodayText,
	SPAN.TESTcpTodayTextDisabled
			{
			height:20px;
			}
	A.TESTcpTodayText
			{
			color:#6677DD;
			font-weight:bold;
			}
	SPAN.TESTcpTodayTextDisabled
			{
			color:#D0D0D0;
			}
	.TESTcpBorder
			{
			border:solid thin #6677DD;
			}
</STYLE>



<script type="text/javascript" src="jquery-1.2.1.pack.js"></script>

<script type="text/javascript">
	function lookupcb(inputString) {
		if(inputString.length == 0) {
			// Hide the suggestion box.
			$('#suggestionsCboM').hide();
		} else {
			$.post("rpc_cbo.php", {queryString: ""+inputString+""}, function(data){
				if(data.length >0) {
					$('#suggestionsCboM').show().;
					$('#autoSuggestionsListCboM').html(data);
				}
			});
		}
	} // lookup
	
	function fill(thisValue) {
		$('#inputStringCboM').val(thisValue);
		setTimeout("$('#suggestionsCboM').hide();", 300);
	}
</script>


<script language='javascript' src='functions/jquery-1.2.6.js' type='text/javascript'></script>
<link rel="stylesheet" href="css/ped.css" />
<?php


if ($n == "prontpaciente" || $n == "histpaciente") {
	
	echo "<link rel='stylesheet' href='css/prontuario.css' />
";
}
if ($n != "index")
	echo "<script language='JavaScript' src='functions/funcgerais.js' type='text/javascript'></script>
<script language='JavaScript' src='functions/vnu_datestamp.js' type='text/javascript'></script>
";
if ($n == "prontpaciente" || $n == "cadpaciente" || $n == "altpaciente")
	echo "<script language='JavaScript' src='functions/validacombo.js' type='text/javascript'></script>
";
if ($n == "prontpaciente" || $n == "histpaciente")
	echo "<script language='JavaScript' src='functions/habilitaCampos.js' type='text/javascript'></script>
";
?>

</head>

<body 
<?php
if ($n != "index") {
	echo 'onLoad="hora1(); renderDate();';  
	if ($n == "prontpaciente" || $n == "histpaciente")
		echo $s;
	echo '"';
}
?>
>

