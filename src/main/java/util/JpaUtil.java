package util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import static jakarta.persistence.Persistence.createEntityManagerFactory;

import java.util.List;
import java.util.function.Consumer;

import entities.Categorie;

public class JpaUtil {

	public static EntityManagerFactory entityManagerFactory = createEntityManagerFactory("org.hibernate.tutorial.jpa");;


	public static void inTransaction(Consumer<EntityManager> work) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction transaction = entityManager.getTransaction();
		try {
			transaction.begin();
			work.accept(entityManager);
			transaction.commit();
		}
		catch (Exception e) {
			if (transaction.isActive()) {
				transaction.rollback();
			}
			throw e;
		}
		finally {
			entityManager.close();
		}
	}


	
}
