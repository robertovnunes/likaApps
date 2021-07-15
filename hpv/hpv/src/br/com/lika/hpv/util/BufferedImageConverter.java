 package br.com.lika.hpv.util;
 
 import com.lowagie.text.Chunk;
 import com.lowagie.text.Document;
 import com.lowagie.text.Image;
 import com.lowagie.text.PageSize;
 import com.lowagie.text.Phrase;
 import com.lowagie.text.pdf.BarcodeEAN;
 import com.lowagie.text.pdf.PdfContentByte;
 import com.lowagie.text.pdf.PdfWriter;
 import java.io.FileOutputStream;
 import java.io.PrintStream;
 
 public class BufferedImageConverter
 {
   public static void main(String[] args)
   {
     System.out.println("Barcode Linha de Código ");
     Document document = new Document(PageSize.A4, 50.0F, 50.0F, 50.0F, 50.0F);
     try {
       PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("D://Codigo_Barra.pdf"));
       document.open();
       PdfContentByte cb = writer.getDirectContent();
 
       BarcodeEAN codeEAN = new BarcodeEAN();
 
       codeEAN.setCode("lika-hpv");
       codeEAN.setGuardBars(false);
 
       Image imageEAN = codeEAN.createImageWithBarcode(cb, null, null);
       document.add(new Phrase(new Chunk(imageEAN, 0.0F, 0.0F)));
       document.add(new Phrase("\nthiago19-02-1987"));
     }
     catch (Exception de)
     {
       de.printStackTrace();
     }
     document.close();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.util.BufferedImageConverter
 * JD-Core Version:    0.6.0
 */