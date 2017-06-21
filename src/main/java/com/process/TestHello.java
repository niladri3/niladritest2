package com.process;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;


import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class TestHello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public TestHello() {
        super();
            }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		try {
			//File testf = new File( TestHello.class.getResource( "/roseindia.xml" ).toURI() );
			File input =new File( getServletContext().getResource("/roseindia.xml").toURI());
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db;
			db = dbf.newDocumentBuilder();
			Document document = db.parse(input);
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
			/*String fileName="xml/roseindia.xml";
			//InputStream in = this.getClass().getClassLoader().getResourceAsStream();
			  DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory
		                .newInstance();
			  DocumentBuilder docBuilder;
			try {
				this.getClass().getResource("/roseindia.xml");
				URL in = this.getClass().getResource("/roseindia.xml");
				docBuilder = docBuilderFactory.newDocumentBuilder();
				//Document doc = docBuilder.parse("src/main/resources/xml/roseindia.xml");
				Document doc = docBuilder.parse("src/main/resources/xml/roseindia.xml");
			} catch (ParserConfigurationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SAXException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			  
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
