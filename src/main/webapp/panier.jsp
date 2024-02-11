<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>

	<jsp:include page="nav.jsp" />
	<ul class="breadcrumb">
		<li><a href="#">Acceuil</a></li>
		<li><a href="#">Panier</a></li>
		<li>Résumé</li>
	</ul>
	<div class="pannier">
		<section class="summary" id="list-items">
			<!-- <div class="summary-card">
				<img alt="" src="images/viandes/poulet.jpg">
				<ul>�

					<li>Nom <span class="data">Poulet</span></li>
					<li>Prix <span class="data">20,05 dhs</span></li>
					<li>Quantit� <span class="data">

							<button>
								<i class="fa fa-minus" aria-hidden="true"></i>
							</button> 2
							<button>
								<i class="fa fa-plus" aria-hidden="true"></i>
							</button>

					</span></li>
					<li>Total <span class="data">41,00 dhs</span></li>
					<li class="delete"><a class="delete" href="#"><i
							class="fa fa-trash" aria-hidden="true"></i></a></li>
				</ul>
			</div> -->

		</section>
		<section>
			<h1>Résumé du panier</h1>
			<table>
				<thead>
					<tr>
						<th>Produits</th>
						<th>Prix</th>
						<th>Quantité</th>
						<th>Sous Total</th>
					</tr>
				</thead>
				<tbody id="table">

				</tbody>
			</table>
			<a class="btn" href="<%=request.getContextPath()%>/commandes.jsp">Commander</a>

		</section>
	</div>

	<script>


        function addIems({ name_produit, prix, image_name, id, quantite }) {


            const section = document.getElementById("list-items");
            const div = document.createElement("div");
            div.className = "summary-card"
            const img = document.createElement("img");
            img.src = "upload/" + image_name,
                div.appendChild(img);
            const ul = document.createElement("ul");

            const datas = {
                "Nom": name_produit,
                "Prix": prix + ` dhs`,
            }

            for (const key in datas) {

                const li = document.createElement("li");
                const span = document.createElement("span");
                span.className = "data";
                span.innerText = datas[key];
                li.innerText = key;
                li.appendChild(span);
                ul.appendChild(li);

            }

            let li = document.createElement("li");
            let span = document.createElement("span");
            span.className = "data";

            span.innerHTML = "<button onclick=\"changeQuantite({\'id\':"+id+",\'op\':0})\" class='qte'><i class='fa fa-minus' aria-hidden='true'></i></button>"+
                       quantite+
                       "<button class='qte' onclick=\"changeQuantite({\'id\':"+id+",\'op\':1})\"><i class='fa fa-plus' aria-hidden='true'></i></button>"



            li.innerText = "Quan ";
            li.appendChild(span);
            ul.appendChild(li);

            div.appendChild(ul);



            // Totals

            li = document.createElement("li");
            span = document.createElement("span");
            span.className = "data";
            span.innerText = quantite * prix;
            li.innerText = "Total"
            li.appendChild(span);
            ul.appendChild(li);


            console.log("section", section);

            // delete btn
            li = document.createElement("li");
            li.innerHTML = "<a class='delete' onclick=\"DeleteItem({\'id\':"+id+"})\"><i class='fa fa-trash' aria-hidden='true'></i>"
            ul.append(li)

            section.appendChild(div);
        }
        //


        function updateSection() {
            const section = document.getElementById("list-items");
            const tbody = document.getElementById("table");
            section.innerHTML = "";
            tbody.innerHTML = "";
            for (const item of list) {
                addIems(item);
                addTable(item)
            }
            span_el.innerText = getAllQuantities(list); 
            localStorage.setItem("list",JSON.stringify(list));
        }


        function changeQuantite(arg){
		console.log("arga",arg);
		
		const item = getItem(arg.id);
		console.log("item",item);
		if(!item)return;
		if(arg.op == 0){
				item.quantite -= 1
		}else{
			item.quantite +=1
		}
		updateSection()
	}
    function DeleteItem({id}){
        list = list.filter((e)=>e.id !=id);
        updateSection();
    }
        updateSection();
    </script>

</body>