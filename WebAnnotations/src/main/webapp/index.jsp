<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="org.hibernate.*,
org.hibernate.boot.*,
org.hibernate.boot.registry.StandardServiceRegistryBuilder,
org.hibernate.cfg.Configuration,
java.util.*,
com.niit.techno.demo.Employee"%>
<html>
<head>
<title>Annotation Web</title>
</head>
<body>

	<%
		try {
			Configuration configuration = new Configuration();
			configuration.configure("hibernate.cfg.xml");
			SessionFactory factory = configuration
					.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
			Session sess = factory.openSession();
			sess.beginTransaction();
			Employee e1 = new Employee();
			//e1.setId(1);
			e1.setFirstName("Raj");
			e1.setLastName("GS");
			sess.save(e1);
			sess.getTransaction().commit();
			out.println("Successfully Inserted");
			out.println("<br>+*********************************+");

			Query query = sess.createQuery("from Employee");
			List<Employee> list = query.list();
			for (Employee emp : list)
				out.println("<br/>Id: \t" + emp.getId() + "\tFirst Name: \t" + emp.getFirstName()
						+ "\tLast name: \t" + emp.getLastName());

			sess.close();
			factory.close();
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>