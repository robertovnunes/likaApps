package br.com.lika.hpv.util;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.w3c.dom.Document;
import org.w3c.tidy.Tidy;
import org.xhtmlrenderer.pdf.ITextRenderer;

import com.lowagie.text.DocumentException;

public class Html2Pdf {
	public static void convert(String input, OutputStream out)
			throws DocumentException, IOException {
		convert(new ByteArrayInputStream(input.getBytes()), out);
	}

	public static void convert(InputStream input, OutputStream out)
			throws DocumentException, IOException {
		Tidy tidy = new Tidy();
		Document doc = tidy.parseDOM(input, null);
		ITextRenderer renderer = new ITextRenderer();
		renderer.setDocument(doc, null);
		renderer.layout();
		renderer.createPDF(out);
		out.close();
	}
	
	public static void main(String[] args) throws FileNotFoundException, DocumentException, IOException {
		
		Tidy t = new Tidy();
		
		String html = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n"+
"<html>"+
"<body>\n"+
	"<img src=\"header.jpg\" />\n"+
 	"<br />\n"+
 	"<br />\n"+
 	"<table>\n"+
 "		<tr>\n"+
 "			<td><b>Nome:</b></td><td></td>\n"+
 "		</tr>\n"+
"		<tr>\n"+
"			<td><b>Idade:</b></td><td></td>\n"+
"		</tr>\n"+
		
		
"		<tr>\n"+
"			<td><b>Nº Registro:</b></td><td></td>\n"+
"		</tr>\n"+

"		<tr>\n"+
"			<td><b>Data de Coleta:</b></td><td></td>\n"+
"		</tr>\n"+
"		<tr>\n"+
"			<td><b>Data de Liberação do Resultado:</b></td><td></td>\n"+
"		</tr>\n"+
"	</table>\n"+
	
"	<br><br>\n"+
"	<h1 style=\"text-align: center;\">RESULTADO DO EXAME MOLECULAR PARA PAPILOMAVÍRUS HUMANO</h1>\n"+
	
"	<br><br><br>\n"+
"	<h3>TIPO DA AMOSTRA:</h2><br>\n"+
	
"	<h3>ADEQUABILIDADE DA AMOSTRA:</h2><BR>\n"+
	
"	<h3>DIAGNÓSTICO DESCRITIVO/RESULTADO:</h2><BR>\n"+
	
"	<br><br><br>\n"+
"	<b style=\"font-size: 10px;\">Obs: O resultado apresentado refere-se à detecção de fragmentos virais por técnicas de biologia molecular"+
"	(PCR) na amostra avaliada e pode ser decorrente de um estado transitório da paciente.</b>\n"+
	
"	<br><br><br>\n"+
"	<img src=\"footer.jpg\" />\n"+
"</body>\n"+
"</html>";
		
		Html2Pdf.convert(html, new FileOutputStream("casa.pdf"));
		
		
	}
}
