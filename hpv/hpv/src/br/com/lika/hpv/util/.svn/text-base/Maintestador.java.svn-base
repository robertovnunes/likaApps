 package br.com.lika.hpv.util;
 
 import br.com.lika.hpv.dao.DAOFactory;
import br.com.lika.hpv.dao.FormularioDAO;
import br.com.lika.hpv.model.formulario.Formulario;

import com.lowagie.text.Chunk;
 import com.lowagie.text.Document;
 import com.lowagie.text.DocumentException;
 import com.lowagie.text.Paragraph;
 import com.lowagie.text.pdf.Barcode128;
 import com.lowagie.text.pdf.PdfContentByte;
 import com.lowagie.text.pdf.PdfWriter;
 import java.io.FileNotFoundException;
 import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaQuery;
import org.hibernate.criterion.Criterion;
import org.hibernate.engine.TypedValue;
import org.hibernate.impl.CriteriaImpl.CriterionEntry;
 
 public class Maintestador
 {
   public static void main(String[] args)
   {
	   
	   Session s = HibernateUtil.getSession();
	   
	   Transaction t = s.beginTransaction();
	   
	   Criteria c = s.createCriteria(Formulario.class);
	  
	   
	   FormularioDAO a = new FormularioDAO(s);
	   
	   
	   List<Formulario> l = a.listaTudo();
		
	   for(Formulario f : l){
		   
		   if(f.getId() == 0 || f.getId() ==1
				   || f.getId() ==2
				   || f.getId() ==3
				   || f.getId() ==4
				   || f.getId() ==5
				   || f.getId() ==6
				   || f.getId() ==7
				   || f.getId() ==8
				   || f.getId() ==11
				   || f.getId() ==12
				   || f.getId() ==13
				   || f.getId() ==20
				   || f.getId() ==26
				   || f.getId() ==28
				   || f.getId() ==29
				   || f.getId() ==31
				   || f.getId() ==33
				   || f.getId() == 52
				   || f.getId() ==53
				   || f.getId() ==54
				   || f.getId() ==57
				   || f.getId() ==63
				   || f.getId() ==64
				   || f.getId() ==74
				   || f.getId() ==105
				   || f.getId() ==106
				   || f.getId() ==138
				   || f.getId() ==142
				   || f.getId() ==143
				   || f.getId() ==190
				   || f.getId() ==191
				   || f.getId() ==254
				   || f.getId() ==307
				   || f.getId() ==385
				   || f.getId() ==389
				   || f.getId() ==391
				   || f.getId() ==429
				   || f.getId() ==430
				   || f.getId() ==434
				   || f.getId() ==437
				   || f.getId() ==438
				   || f.getId() ==442
				   || f.getId() ==446
				   || f.getId() ==458
				   || f.getId() ==459
				   || f.getId() ==475
				   || f.getId() ==534
				   || f.getId() ==582
				   || f.getId() ==591
				   || f.getId() ==604
				   || f.getId() ==605
				   || f.getId() ==640
				   || f.getId() ==671
				   || f.getId() ==743
				   || f.getId() ==782
				   || f.getId() ==783
				   || f.getId() ==784
				   || f.getId() ==841
				   || f.getId() ==857
				   || f.getId() ==866
				   || f.getId() == 909){
			   System.out.println(f.getId());
			   s.delete(f);
			   t.commit();
			   t = s.beginTransaction();
		   }
	   }
		
	   
	   s.close();
	   
	   
	   
		
	   
   }
    }
/* Location:           D:\UFPE\LIKA\desenvolvimento\hpv\trunk\hpv\ImportedClasses\
 * Qualified Name:     br.com.lika.hpv.util.Maintestador
 * JD-Core Version:    0.6.0
 */
  