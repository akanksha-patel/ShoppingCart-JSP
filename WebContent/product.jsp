<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="ex" uri="WEB-INF/custom.tld"%>
<jsp:useBean class="com.bitwise.models.Products" scope="session"
	id="products"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel='stylesheet' type='text/css' href='css/home.css' />
<link rel='stylesheet' type='text/css' href='css/mainmenu.css' />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<title>Insert title here</title>
</head>
<body>
	<div id='main'>
	<font size='3' color='red'>
	<c:out value="WELCOME ${fn:toUpperCase(user.getUserName())}"></c:out>
	</font>
		<h3>WELCOME TO THE WORLD OF SHOPPING</h3>
		<br /> 

		<form action="CartController" method="post">

			<c:if test="${ not empty products.getList() }">
				<select name="prod">
					<c:forEach items="${ products.getList() }" var="item">
						<option value="${ item }">
							<c:out
								value="${ item.getProductName() }, ${ item.getProductPrice() }"></c:out>
						</option>
					</c:forEach>
				</select>

			</c:if>

			<input type="submit" name="submit" value="ADD TO CART" /> <input
				type="submit" name="submit" value="REMOVE FROM CART" /> <input
				type="submit" name="submit" value="DISPLAY CART" /> <input
				type='submit' value='LOGOUT' name='submit' />

		</form>
		
		<table id="info">
			<tr>
				<td><b>
				 <ex:Hello></ex:Hello>
						....... </b></td>
			</tr>
		</table>
	</div>
			
<%@ include file="footer.jsp"%>
</body>

</html>