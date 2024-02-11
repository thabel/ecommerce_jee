
<%@page import="dao.AppDao"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<jsp:include page="head_admin.jsp">
	<jsp:param name="admin" value="true" />
</jsp:include>
<%
String param = request.getParameter("categorie");
if (param == null) {
	param = "total";
}
%>
<section class="admin-section">
	<section class="admin-nav">
		<ul>
			<li class="active"><a
				href="<%=request.getRequestURI()%>?categorie=total"
				class="active">Tous les Produits</a></li>
			<li><a href="<%=request.getRequestURI()%>?categorie=Viandes">Viandes</a></li>
			<li><a href="<%=request.getRequestURI()%>?categorie=Fromages">Fromages</a></li>
			<li><a href="<%=request.getRequestURI()%>?categorie=Pain">Pains</a></li>
			<li><a href="<%=request.getRequestURI()%>?categorie=Legumes">Legumes</a></li>
		</ul>
	</section>
	<section class="admin-product">
		<%
		List<Produits> produits = AppDao.getProduit(param);
		for (Produits prod : produits) {
			out.println("<div class=\"product-card\">");
			out.println("    <img alt=\"\" src=\"upload/" + prod.getImage_name() + "\">");
			out.println("    <div class=\"product-details\">");
			out.println("        <div class=\"price\">");
			out.println("            <div>");
			out.println("                <span>" + prod.getPrix_produit() + "dhs/kg</span>");
			out.println("                <p>" + prod.getNom() + "</p>");
			out.println("            </div>");
			out.println("        </div>");
			out.println("        <div class=\"btns\">");
			out.println(
			"            <a class=\"delete btn\" href=\"#\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>");
			out.println(
			"            <a class=\"modify btn\" href=\"#\"><i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i></a>");
			out.println("        </div>");
			out.println("    </div>");
			out.println("</div>");
		}
		%>




		</div>
	</section>
</section>



</body>
