<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.w3c.dom.*, javax.xml.parsers.*" %>
<%
  DocumentBuilderFactory docFactory = 
  DocumentBuilderFactory.newInstance();
  DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
  Document doc = docBuilder.parse
("F:\\JavaProgram\\Dashboard\\src\\main\\webapp\\nonProd.xml");
%>
<%!
  public boolean isTextNode(Node n){
  return n.getNodeName().equals("#text");
  }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Parsing of xml using DOM Parser</title>
<script type="text/javascript">

</script>
<link rel="stylesheet" type="text/css" href="startingPage.css">
</head>
<body>
<h2><font color='green'>Non-ProdSystem</font></h2>

<input type="submit" id="prod" value="Production"
		onclick="location.href='http://localhost:8084/Dashboard/index.jsp'">
	<input type="submit" id="nonprod" value="Non-Production"
		onclick="location.href='http://localhost:8084/Dashboard/parsingxmlNonProd.jsp'">

  <table align="center" cellpadding="5" cellspacing="5" border="1"
		style="width: 100%; border-collapse: collapse;">
  <tr bgcolor="#A52A2A">
			<th>Host</th>
			<th>SID</th>
			<th>SCS</th>
			<th>Type</th>
			<th>URL</th>
			<th>SAP Components</th>
  </tr>
  <%
  Element  element = doc.getDocumentElement(); 
  NodeList personNodes = element.getChildNodes(); 
  for (int i=0; i<personNodes.getLength(); i++){
  Node emp = personNodes.item(i);
  if (isTextNode(emp))
  continue;
  NodeList NameDOBCity = emp.getChildNodes(); 
  %>
  <tr bgcolor="#DEB887">
  <%
  for (int j=0; j<NameDOBCity.getLength(); j++ ){
  Node node = NameDOBCity.item(j);
  if ( isTextNode(node)) 
  continue;
  %>
  <%if(!node.getFirstChild().getNodeValue().contains("www")){ %>
  <td><%= node.getFirstChild().getNodeValue() %></td>
  <%} 
  else{
  %>
  <td><a href='<%= node.getFirstChild().getNodeValue() %>'><%= node.getFirstChild().getNodeValue()%></a></td>
  <%} %>
  <%
  } 
  %>
  </tr>
  <%
  }
  %>
  </table>
  <form action="nonProdForm.jsp">
  <input type="submit" value="Add" id="add">
  </form>
 <input type="submit" id="Delete" value="Delete">
</body>
</html>