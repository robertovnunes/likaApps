 package br.com.lika.hpv.util;
 
 import com.lowagie.text.Document;
 import com.lowagie.text.DocumentException;
 import com.lowagie.text.Image;
 import com.lowagie.text.Paragraph;
 import com.lowagie.text.pdf.Barcode128;
 import com.lowagie.text.pdf.Barcode39;
 import com.lowagie.text.pdf.PdfContentByte;
 import com.lowagie.text.pdf.PdfWriter;
 import java.io.FileOutputStream;
 import java.io.IOException;
 import java.io.PrintStream;
 
 public class Barcodes
 {
   public static void main(String[] args)
   {
     System.out.println("Chapter 5: example Barcodes");
     System.out.println("-> Creates a PDF file with barcodes.");
     System.out.println("-> jars needed: iText.jar");
     System.out.println("-> resulting PDF: barcodes.pdf");
 
     Document document = new Document();
     try
     {
       PdfWriter writer = PdfWriter.getInstance(
         document, 
         new FileOutputStream("2.pdf"));
 
       document.open();
 
       PdfContentByte cb = writer.getDirectContent();
 
       for (int t = 30; t < 100; t += 10) {
         document.add(new Paragraph("Modelo: Barcode 128, cabendo 18 caracteres"));
         Barcode128 code128 = new Barcode128();
         code128.setCode("AB12CE34HJ45JK67_18");
         code128.setTextAlignment(0);
         Image i = code128.createImageWithBarcode(cb, null, null);
         i.scalePercent(t, t + 40);
         document.add(i);
       }
 
       for (int x = 20; x <= 100; x += 10) {
         document.add(new Paragraph("Barcode 3 of 9"));
         Barcode39 code39 = new Barcode39();
         code39.setCode("IQOWE");
         Image i = code39.createImageWithBarcode(cb, null, null);
         i.scalePercent(x, x + 40);
         document.add(i);
       }
 
     }
     catch (DocumentException de)
     {
       System.err.println(de.getMessage());
     } catch (IOException ioe) {
       System.err.println(ioe.getMessage());
     }
 
     document.close();
   }
 }

/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.util.Barcodes
 * JD-Core Version:    0.6.0
 */