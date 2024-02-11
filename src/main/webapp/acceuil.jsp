<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>

	<jsp:include page="nav.jsp" />
	<section class="cta">
		<h1>Heureux de vous acceuillir !</h1>
		<p>Notre boutique en ligne vous offre des produits frais bio qui
			seront livrés chez vous. Pour choisir une catégorie cliquez sur l'une
			des images suivantes</p>
	</section>
	<section>
		<div class="card-container">
			<div class="card">
				<img alt="" src="images/meat.png">
				<div class="card-details">
					<span class="title">viandes</span> <span> <i class="number">30</i>
						produits
					</span> <a
						href="<%=request.getContextPath()%>/produits.jsp?categorie=Viandes">
						<button class="btn">Voir plus</button>
					</a>

				</div>

			</div>
			<div class="card">
				<img alt="" src="images/baguettes.svg">
				<div class="card-details">
					<span class="title">Baguettes</span> <span> <i
						class="number">12</i> produits
					</span> <a
						href="<%=request.getContextPath()%>/produits.jsp?categorie=Pain">
						<button class="btn">Voir plus</button>
					</a>
				</div>
			</div>

			<div class="card">
				<img alt="" src="images/legumes.svg">
				<div class="card-details">
					<span class="title">Legumes</span> <span> <i class="number">15</i>
						produits
					</span> <a
						href="<%=request.getContextPath()%>/produits.jsp?categorie=Legumes">
						<button class="btn">Voir plus</button>
					</a>
				</div>
			</div>
			<div class="card">
				<img alt="" src="images/fromage.svg">
				<div class="card-details">
					<span class="title">Fromages</span> <span> <i class="number">10</i>
						produits
					</span> <a
						href="<%=request.getContextPath()%>/produits.jsp?categorie=Fromages">
						<button class="btn">Voir plus</button>
					</a>
				</div>
			</div>
		</div>
	</section>

</body>


<!-- viandes



 -->
</html>