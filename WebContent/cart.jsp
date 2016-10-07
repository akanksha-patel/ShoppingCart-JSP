<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean class="com.bitwise.models.Cart" scope="session" id="cart"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<html>
<head>
<title>YOUR PROFILE</title>
<link rel='stylesheet' type='text/css' href='css/home.css' />
<link rel='stylesheet' type='text/css' href='css/mainmenu.css' />
</head>
<body>
	<div id='main'>
		<form action='ProductController'>
			<center>
				<table>
					<tr>
						<th>Cart Items</th>
					</tr>
					<!--
		for (Product item: cartItems) {
			out.println("<tr>"
					+ "<td>"+item.getProductName() + 
							 "</tr>");
			sum=sum+item.getProductPrice();
			
		} -->

					<c:if test="${ not empty cart.getCartItems() }">

						<c:forEach items="${ cart.getCartItems() }" var="item">
							<tr>
								<td><c:out value="${ item.getProductName()}"></c:out>
							</tr>
						</c:forEach>


					</c:if>

					<tr>
						<td><input type='submit' value='ADD MORE ITEMS'></td>
					</tr>
				</table>
			</center>

		</form>
	</div>
</body>
</html>

