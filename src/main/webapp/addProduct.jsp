<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="head_admin.jsp">
	<jsp:param name="admin" value="true" />
</jsp:include>

<section class="admin-section">
	<section class="admin-nav">
		<ul>
			<li class="active"><a href="#" class="active">Ajouter
					Produit</a></li>
			<li><a href="#">Tous les Produits</a></li>
			<li><a href="#">Viandes</a></li>
			<li><a href="#">Fromages</a></li>
			<li><a href="#">Pains</a></li>
		</ul>
	</section>
	<section class="command-details">
		<h1>Enregistrer un nouveau produit</h1>
		<form action="AddProduct" enctype="multipart/form-data" method="post">
			<div>
				<label for="name">Nom</label> <input id="name" type="text"
					name="name" required>
			</div>
			<div>
				<label for="cat_name">Catégorie</label> <select name="cat_name">
					<option value="Viandes">Viandes</option>
					<option value="Legumes">Legumes</option>
					<option value="Pain">Pains</option>
					<option value="Fromages">Fromages</option>
				</select>

			</div>
			<div>
				<label for="price">Prix au Kg</label> <input id="price"
					type="number" name="price" value="0" required="required">
			</div>
			<div>
				<label for="file">Image</label> <input id="file" type="file"
					name="multiPartServlet">
			</div>

			<input type="submit" value="Ajouter" class="btn enregistrer">
		</form>
	</section>
</section>

