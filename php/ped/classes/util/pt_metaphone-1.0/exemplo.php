<html>
<head>
<title>Exemplo do pt_metaphone</title>
</head>

<body>
<?php

	include("pt_metaphone.php");

	$a="caio melo";

	print "<h1>".$a."</h1>\n";

	print "<h2>".pt_metaphone($a)."</h2>\n";
	
	$b="kaio melu";
	
	print "<h1>".$b."</h1>\n";

	print "<h2>".pt_metaphone($b)."</h2>\n";

?>
</body>

</html>