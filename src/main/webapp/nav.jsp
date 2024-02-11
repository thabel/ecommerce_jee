<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav>
	<a href="<%=request.getContextPath()%>/acceuil.jsp">
		<h1 class="Logo">
			<span>Chez</span>-bio.com
		</h1>
	</a>

	<ul>
		<li><a href="#" class="link">Se connecter</a></li>
		<c:if test="${!param.admin.equals('true')}">
			<li><a href="<%=request.getContextPath()%>/panier.jsp"><img
					alt="" src="images/cart.svg"></a></li>
			<span class="cart-number" id="achat-items">0</span>
		</c:if>
	</ul>
</nav>

<script>
		const span_el = document.getElementById("achat-items");
		const Storelist = localStorage.getItem('list')?.toString();
		let list = [];

		if(Storelist){
		// convert storeList to object
		list = JSON.parse(Storelist);
		span_el.innerText = getAllQuantities(list); 
		}
	

		function getAllQuantities(list){
	sum = 0;

	for(const item of list){
		sum += item.quantite;
	}
  return sum;
}
 

function getItem(id){
	const res = list.filter((item)=>item.id == id);
	console.log("res",res)
	if(res.length){
		return res[0]
	}
	console.log("not find",id)
}


function addTable(item){
            const tbody = document.getElementById("table");
            const tr = document.createElement("tr");
            tr.innerHTML = 
    "<td>" + item.name_produit + "</td>" +
    "<td>" + item.prix + "</td>" +
    "<td>" + item.quantite + "</td>" +
    "<td>" + item.prix*item.quantite + "</td>";
            tbody.appendChild(tr)
        }


	</script>