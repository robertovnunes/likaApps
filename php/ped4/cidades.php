<?
/******************************************************************
// ARQUIVO ...: Monta o XML das Cidades 
// BY ........: Júlio César Martini     
// DATA ......: 14/03/2006              
/******************************************************************/

//CONECTA AO MYSQL                     
require_once("dbconfig.php");           

//RECEBE PARÃMETRO                     
$pEstado = $_POST["estado"];           

//EXECUTA A QUERY               
$sql_cidades = mysql_query("SELECT * FROM  tb_cidade WHERE fk_cod_estado = '$pEstado'");       

$row = mysql_num_rows($sql_cidades);    

//VERIFICA SE VOLTOU ALGO 
if($row) {                
   //XML
   $xml  = "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>\n";
   $xml .= "<cidades>\n";               
   
   //PERCORRE ARRAY            
   for($i=0; $i<$row; $i++) {  
      $codigo    = mysql_result($sql_cidades, $i, "cod_cidade"); 
	  $descricao = mysql_result($sql_cidades, $i, "descricao");
      $xml .= "<cidade>\n";     
      $xml .= "<codigo>".$codigo."</codigo>\n";                  
      $xml .= "<descricao>".$descricao."</descricao>\n";         
      $xml .= "</cidade>\n";    
   }//FECHA FOR                 
   
   $xml.= "</cidades>\n";
   
   //CABEÇALHO
   Header("Content-type: application/xml; charset=iso-8859-1"); 
}//FECHA IF (row)                                               

//PRINTA O RESULTADO  
echo $xml;            
?>
