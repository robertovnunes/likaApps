<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="shortcut icon" href="images/logo2.jpg" />
    <title>PED - Prontu&aacute;rio de Semiologia Pedi&aacute;trica.</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta name="language" content="pt-br" />

	<script language='javascript' src='js/jquery-1.3.2.js' type='text/javascript'></script>
	<script language='JavaScript' src='js/funcgerais.js' type='text/javascript'></script>
	<script language='JavaScript' src='js/vnu_datestamp.js' type='text/javascript'></script>
	<script language='JavaScript' src='js/buscacep.js' type='text/javascript'></script>
	<script language='JavaScript' src='js/habilitaCampos.js' type='text/javascript'></script>	 
	<script language='JavaScript' src='js/SpryAssets/SpryMenuBar.js' type='text/javascript'></script>
	<script language='JavaScript' src='js/myOverlay.js' type='text/javascript'></script>	
	<script LANGUAGE="JavaScript" SRC="js/CalendarPopup.js"></script>
	<link rel='stylesheet' href='js/SpryAssets/SpryMenuBarVertical.css' type='text/css' />
	<link rel="stylesheet" href="css/ped.css" />
	<link rel="stylesheet" href="css/default.css" type="text/css"/>
	<?php if ($aba == "hd"){ ?>
	<script type="text/javascript">
		function lookup(inputString) {
			if(inputString.length == 0) {
				// Hide the suggestion box.
				$('#suggestions').hide();
			} else {
				$.post("views/rpc.php?conn=<?php echo $conn; ?>", {queryString: ""+inputString+""}, function(data){
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
	<?php } ?>

	<!-- This javascript is only used for the show/hide source on my example page.
		 It is not used by the Calendar Popup script -->

	<!-- This prints out the default stylehseets used by the DIV style calendar.
		 Only needed if you are using the DIV style popup -->
	<script LANGUAGE="JavaScript">document.write(getCalendarStyles());</script>
</head>

<body onLoad="hora1(); renderDate();">

