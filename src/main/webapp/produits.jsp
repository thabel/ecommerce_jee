<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="dao.AppDao"%>
<%@page import="entities.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<%
String param = request.getParameter("categorie");
if (param == null) {
	param = "Viandes";
}
%>
<body>
	<jsp:include page="nav.jsp" />
	<ul class="breadcrumb">
		<li><a href="#">Acceuil</a></li>
		<li><a href="#">Produits</a></li>
		<li><%=param%></li>

	</ul>
	<section>
		<div class="product-container">
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
				out.println("			<a href=\"#\">");// addToPanier
				String data = "{name_produit:\"" + prod.getNom() + "\",prix:" + prod.getPrix_produit() + ",image_name:\""
				+ prod.getImage_name() + "\"" + ",id:\"" + prod.getId() + "\"" + "}";
				out.println("            <button onclick='addToList(" + data + ")'>");
				out.println(
				"                <svg viewBox=\"0 0 25 25\" fill=\"white\" xmlns=\"http://www.w3.org/2000/svg\" class=\"\" aria-hidden=\"true\" focusable=\"false\">");
				out.println(
				"                    <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M2.12772 4.63849C2.031 4.93371 2.19191 5.25145 2.48713 5.34817L3.95323 5.82852C4.50211 6.00835 4.92089 6.45641 5.06326 7.01617L6.96851 14.5069C7.11663 15.0892 7.44048 15.59 7.87467 15.9583C7.10697 16.4604 6.59975 17.3278 6.59975 18.3136C6.59975 19.8669 7.85895 21.1261 9.41225 21.1261C10.9656 21.1261 12.2248 19.8669 12.2248 18.3136C12.2248 17.6805 12.0155 17.0962 11.6625 16.6261H16.9121C16.559 17.0962 16.3498 17.6805 16.3498 18.3136C16.3498 19.8669 17.609 21.1261 19.1623 21.1261C20.7156 21.1261 21.9748 19.8669 21.9748 18.3136C21.9748 17.2727 21.4093 16.3639 20.5688 15.8776C20.905 15.5665 21.1675 15.1713 21.3216 14.7169L23.445 8.45582C23.5447 8.16162 23.3871 7.84224 23.0929 7.74247C22.7987 7.64269 22.4793 7.80031 22.3796 8.09451L20.2562 14.3556C20.024 15.0404 19.3813 15.5011 18.6581 15.5011H9.69423C8.92246 15.5011 8.24904 14.9776 8.0588 14.2296L6.15355 6.73886C5.91625 5.80592 5.2183 5.05916 4.3035 4.75944L2.8374 4.27909C2.54218 4.18236 2.22444 4.34328 2.12772 4.63849ZM9.41225 16.6261C8.48027 16.6261 7.72475 17.3817 7.72475 18.3136C7.72475 19.2456 8.48027 20.0011 9.41225 20.0011C10.3442 20.0011 11.0998 19.2456 11.0998 18.3136C11.0998 17.3817 10.3442 16.6261 9.41225 16.6261ZM17.4748 18.3136C17.4748 17.3817 18.2303 16.6261 19.1623 16.6261C20.0942 16.6261 20.8498 17.3817 20.8498 18.3136C20.8498 19.2456 20.0942 20.0011 19.1623 20.0011C18.2303 20.0011 17.4748 19.2456 17.4748 18.3136Z\" fill=\"white\"></path>");
				out.println(
				"                    <path d=\"M14.108 4.25113C13.7973 4.25113 13.5455 4.50297 13.5455 4.81363V7.71267H10.5862C10.2755 7.71267 10.0237 7.96451 10.0237 8.27517C10.0237 8.58583 10.2755 8.83767 10.5862 8.83767H13.5455V11.736L14.108 11.7367H13.5455C13.5455 12.0474 13.7973 12.2992 14.108 12.2992C14.4187 12.2992 14.6705 12.0473 14.6705 11.7367V8.83767H17.6297C17.9403 8.83767 18.1922 8.58583 18.1922 8.27517C18.1922 7.96451 17.9403 7.71267 17.6297 7.71267H14.6705V4.81363C14.6705 4.50297 14.4187 4.25113 14.108 4.25113Z\" fill=\"white\"></path>");
				out.println("                </svg>");
				out.println("            </button>");
				out.println("</a>");
				out.println("        </div>");
				out.println("    </div>");
				out.println("</div>");
			}
			%>
		</div>


	</section>
</body>
<script>
// Load list from localStorage




function updateLocaleStorage(){
  localStorage.setItem("list",JSON.stringify(list));
  const span_el = document.getElementById("achat-items");
  span_el.innerText = getAllQuantities(list);
  console.log(list);
}

function addToList(arg){
	const item_list = list.filter((el)=>el.name_produit == arg.name_produit);
  if(item_list.length != 0){
    item_list[0].quantite +=1;
    console.log("case 1",item_list)
  }else{
    arg.quantite = 1;
    list.push(arg);
    console.log("agr",list);
  }
  // update localStorage
  updateLocaleStorage()
	console.log("heelolo back",arg);
}
</script>
</html>