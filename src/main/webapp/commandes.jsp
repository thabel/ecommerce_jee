<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<jsp:include page="nav.jsp" />
	<ul class="breadcrumb">
		<li><a href="#">Acceuil</a></li>
		<li><a href="#">Paniers</a></li>
		<li>Commandes</li>
	</ul>
	<div class="pannier">
		<section class="command-details">
			<h1>Enregistrer pour passer votre commande</h1>
			<form action="AddCommande" onsubmit="return handleSubmit()"
				method="post">
				<div>
					<label for="name">Nom</label> <input id="name" name="name" required>
				</div>
				<div>
					<label for="email">Email</label> <input id="email" type="email"
						name="email" required>
				</div>
				<div>
					<label for="tel">Telephone</label> <input id="tel" type="tel"
						name="tel" required>
				</div>
				<div>
					<label for="adresse">Adresse</label> <input id="adresse"
						type="text" name="adresse" required>
				</div>
				<div>
					<label for="carte">Carte de crÃ©dit </label>
					<!-- //TODO: Proposer une autre maniere de faire plus fancy -->
					<input id="carte" type="text" name="carte" required> <input
						type="text" name="achats" id="achats">
				</div>

				<input type="submit" value="Enregistrer" class="btn enregistrer">
			</form>
		</section>
		<section>
			<h1>Facture de la commande</h1>
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




		</section>
	</div>
	<script>
		function handleSubmit(){
			achats.value = localStorage.getItem("list")?.toString();
			console.log("achat",achats);

			return true;
		}
		const achats = document.getElementById("achats");
		achats.style.display = "none";

		function updateSection() {
        
            const tbody = document.getElementById("table");
         
            tbody.innerHTML = "";
            for (const item of list) {
                addTable(item)
            }
            span_el.innerText = getAllQuantities(list); 
            localStorage.setItem("list",JSON.stringify(list));
        }
		updateSection();

	</script>
</body>