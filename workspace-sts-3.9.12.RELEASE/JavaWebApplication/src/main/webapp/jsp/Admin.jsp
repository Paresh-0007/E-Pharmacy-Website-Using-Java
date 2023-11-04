<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javaapplication.controller.JWAView" %>
<%@ page import="javawebapplication.bean.*" %>
<%@ page import="javawebapplication.model.ProductModel" %>
<%@ page import="java.util.*" %>
<%@ page import="javawebapplication.utility.JDBCDataSource" %>
<%
SignUpBean user = (SignUpBean)session.getAttribute("current-user");

if(user==null){

	session.setAttribute("message","You arre not Logged In!!! Please Login First ");
	response.sendRedirect("/JavaWebApplication/jsp/Login.jsp");
	return;
}else{
	if(user.getUsertype().equals("normal")){
		session.setAttribute("message","You are not a Admin ! Access Denied.");
		response.sendRedirect("/JavaWebApplication/jsp/Login.jsp");
	return;
	}
}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <!-- <link rel="stylesheet" href="/JavaWebApplication/css/style.css"/> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" media="screen"/>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

	<style type="text/css">
	/* admin */

.admin-page{
  position: absolute;
  top: 50px;
  bottom: 50px;
  left: 50px;
  right: 50px;
}

.menu > img{
  max-width: 75px;
  margin-bottom: 5px;
}
                     
.card-body{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.card-body > h1{
  font-size: large;
}

.count{
  font-size: small;
}

.admin .card{
  border: 1px solid #45a049;
}

.admin .card:hover{
  background: #e2e2e2;
  cursor: pointer;
}

/*modal*/
.form-group{
  margin: 5px;
}

search-bar form {
  background: #dadada;
  width: 600px;
  height: 50px;
  display: flex;
  border-radius: 15px;
}

.search-bar form input {
  background-color: #dadada;
  flex: 1;
  border: none;
  outline: none;
  border-radius: 15px;
}

.search-bar form button {
  background: #90d4c5;
  font-weight: bold;
  padding: 10px 32px;
  border: none;
  outline: none;
  color: black;
  letter-spacing: 1px;
  cursor: pointer;
  border-top-right-radius: 15px;
  border-bottom-right-radius: 15px;
}

.search-bar form .fa-magnifying-glass {
  align-self: center;
  padding: 10px 20px;
  color: black;
}
	
	</style>

</head>
<body class="admin-page">
    <div class="menu admin">
        <div class="row mt-3">

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="menu">
                            <img class="img-fluid rounded-circle" src="/JavaWebApplication/image/users.png" alt="">
                        </div>
                        <a style="text-decoration: none;" href="<%=JWAView.UserListCTL%>"><h1 class="text-uppercase text-muted">View Users</h1></a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="menu">
                            <img class="img-fluid rounded-circle" src="/JavaWebApplication/image/categories.png" alt="">
                        </div>
                        <h1 class="cout">005</h1>
                        <h1 class="text-uppercase text-muted">Catorgies</h1>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="menu">
                            <img class="img-fluid rounded-circle" src="/JavaWebApplication/image/products.png" alt="">
                        </div>
                        <h1 class="cout">030</h1>
                        <h1 class="text-uppercase text-muted">Products</h1>
                    </div>
                </div>
            </div>

        </div>

        <div class="row mt-3">

            <div class="col-md-6">
                <div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                    <div class="card-body text-center">
                        <div class="menu">
                            <img class="img-fluid rounded-circle" src="/JavaWebApplication/image/add-categories.png" alt="">
                        </div>
                        <h1 class="cout">000</h1>
                        <p class="mt-2">Click here to add categories</p>
                        <h1 class="text-uppercase text-muted">Add Catorgies</h1>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                    <div class="card-body text-center">
                        <div class="menu">
                            <img class="img-fluid rounded-circle" src="/JavaWebApplication/image/add-product.png" alt="">
                        </div>
                        <h1 class="cout">000</h1>
                        <p class="mt-2">Click here to add products</p>
                        <h1 class="text-uppercase text-muted">Add Products</h1>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Add categories modal -->
  
  <!-- Modal -->
  <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Fill categories Detials</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          
            <form action="#">
                <div class="form-group">
                    <input type="text" class="form-control" name="catTitle" placeholder="Enter Catorgory Name" required>
                </div> 

                <div class="form-group">
                    <textarea style="height: 150px;" class="form-control" name="catDescription" id="" placeholder="Enter Catorgory Description" required></textarea>
                </div>

                <div class="modal-conatiner text-center">
                    <button class="btn btn-outline-success">Add Catorgory</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>

      </div>
    </div>
  </div>

    <!-- End add categories -->


    <!-- Add products modal -->
  
  <!-- Modal -->
  <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Product Detials</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          
            <form action="#">
                <div class="form-group">
                    <input type="text" class="form-control" name="proNam" placeholder="Enter Medicine Name">
                </div> 
                <div class="form-group">
                    <input type="text" class="form-control" name="proPrice" placeholder="Enter Medicine Price" required>
                </div>

                <div class="modal-conatiner text-center">
                    <button class="btn btn-outline-success">Add Product</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
        
      </div>
    </div>
  </div>

    <!-- End add products -->
</body>
</html>