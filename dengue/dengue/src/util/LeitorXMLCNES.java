package util;

import java.io.File;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import dados.hibernate.HibernateUtil;

public class LeitorXMLCNES {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		 try {
			 
			 SessionFactory sf = HibernateUtil.getFabricaDeSessao();
		      
			 
				File fXmlFile = new File("C://Downloads/CNESBrasil/xmlCNES2.xml");
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(fXmlFile);
			 
				//optional, but recommended
				//read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
				doc.getDocumentElement().normalize();
			 
				System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
			 
				NodeList nList = doc.getElementsByTagName("ROW");
			 
				System.out.println("----------------------------");
				
				for (int temp = 0; temp < nList.getLength(); temp++) {
			 
					Node nNode = nList.item(temp);
			 
					System.out.println("\nCurrent Element: " + nNode.getNodeName());
			 
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {
			 
						Transaction transaction = sf.getCurrentSession().beginTransaction();
						  
						Element eElement = (Element) nNode;
			 
						
//						 `CO_UNIDADE` varchar(31) NOT NULL,
//						  `NO_FANTASIA` varchar(60) NOT NULL,
//						  `CO_MUNICIPIO_GESTOR` varchar(7) NOT NULL,
//						  `CO_SIASUS` varchar(7) NOT NULL,
//						  `NU_CNPJ` varchar(14) NOT NULL,
//						  `NU_CPF` varchar(11) NOT NULL,
//						  `CO_CNES` varchar(7) NOT NULL,
//						  `DT_ATUALIZACAO` datetime NOT NULL,
//						  `CO_SIASUS1` varchar(7) NOT NULL,
//						  `CO_SIASUS2` varchar(7) NOT NULL,
//						  `CO_SIASUS3` varchar(7) NOT NULL,
//						  `CO_SIASUS4` varchar(7) NOT NULL,
//						  `CO_SIASUS5` varchar(7) NOT NULL,
						
						SQLQuery tempQuery =  sf.getCurrentSession().createSQLQuery("INSERT INTO cnes (CO_UNIDADE, NO_FANTASIA, CO_MUNICIPIO_GESTOR, CO_SIASUS, NU_CNPJ, NU_CPF, CO_CNES, DT_ATUALIZACAO, CO_SIASUS1, CO_SIASUS2, CO_SIASUS3, CO_SIASUS4, CO_SIASUS5) " +
								"VALUES(:CO_UNIDADE, :NO_FANTASIA, :CO_MUNICIPIO_GESTOR, :CO_SIASUS, :NU_CNPJ, :NU_CPF, :CO_CNES, :DT_ATUALIZACAO, :CO_SIASUS1, :CO_SIASUS2, :CO_SIASUS3, :CO_SIASUS4, :CO_SIASUS5)" );
						
						tempQuery.setParameter("CO_UNIDADE",eElement.getAttribute("CO_UNIDADE"));
						tempQuery.setParameter("NO_FANTASIA",eElement.getAttribute("NO_FANTASIA"));
						tempQuery.setParameter("CO_MUNICIPIO_GESTOR",eElement.getAttribute("CO_MUNICIPIO_GESTOR"));
						tempQuery.setParameter("CO_SIASUS",eElement.getAttribute("CO_SIASUS"));
						tempQuery.setParameter("NU_CNPJ",eElement.getAttribute("NU_CNPJ"));
						tempQuery.setParameter("NU_CPF",eElement.getAttribute("NU_CPF"));
						tempQuery.setParameter("CO_CNES",eElement.getAttribute("CO_CNES"));
						tempQuery.setParameter("DT_ATUALIZACAO",eElement.getAttribute("DT_ATUALIZACAO"));
						tempQuery.setParameter("CO_SIASUS1",eElement.getAttribute("CO_SIASUS1"));
						tempQuery.setParameter("CO_SIASUS2",eElement.getAttribute("CO_SIASUS2"));
						tempQuery.setParameter("CO_SIASUS3",eElement.getAttribute("CO_SIASUS3"));
						tempQuery.setParameter("CO_SIASUS4",eElement.getAttribute("CO_SIASUS4"));
						tempQuery.setParameter("CO_SIASUS5",eElement.getAttribute("CO_SIASUS5"));
						
						
						   tempQuery.executeUpdate();
						   
						   sf.getCurrentSession().flush();
						   transaction.commit();
						   sf.getCurrentSession().close();
						   System.out.println("----------------------------"+temp);
			 
					}
				}
			    } catch (Exception e) {
				e.printStackTrace();
			    }
	}

}
