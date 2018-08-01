<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="assets/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="assets/css/styles.css" rel="stylesheet">
<title>Items Preview</title>
</head>

<body>
	<nav role="navigation">
		<div id="menuToggle">
			<input type="checkbox" /> <span></span> <span></span> <span></span>
			<ul id="menu">
				<li>
					<form action="ItemController" method="GET">
						<input type="hidden" name="command" value="VIEWBILL">
						<button>Bill</button>
					</form>
				</li>
				<li><form action="ItemController" method="GET">
						<input type="hidden" name="command" value="LISTACCOUNTS">
						<button>Accounts</button>
					</form></li>
				<li><form action="UserController" method="GET">
						<input type="hidden" name="command" value="UPDATEPROFILE">
						<button>Profile</button>
					</form></li>
				<li><form action="UserController" method="GET">
						<input type="hidden" name="command" value="LOGOUT">
						<button>Logout</button>
					</form></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<form action="ItemController" method="POST">
			<table class="table">
				<tr>
					<th>S No.</th>
					<th>Stuff</th>
					<th>Quantity</th>
					<th>Unit</th>
					<th>Price</th>
				</tr>
				<c:forEach var="tempItem" items="${ITEMS_PREVIEW}" varStatus="loop">
					<tr>
						<td>${loop.count}</td>
						<td><input name="stuff${loop.count }" type="text"
							value="${tempItem.stuff}"></td>
						<td><input name="quantity${loop.count }" type="text"
							value="${tempItem.quantity}"></td>
						<td><input name="unit${loop.count }" type="text"
							value="${tempItem.unit}"></td>
						<td>Rs. <input name="price${loop.count }" type="text"
							value="${tempItem.price}"></td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>Total</td>
					<td><%= request.getAttribute("TOTAL_AMOUNT") %></td>
				</tr>
			</table>

			<div class="container my-3" id="input-div">
				<input type="hidden" name="command" value="SAVE"> <input
					type="hidden" class="form-control my-1" name="customerName"
					placeholder="Customer's Name"
					value="<%= request.getAttribute("CUSTOMER_NAME") %>"> <input
					type="hidden" class="form-control my-1" name="customerMobile"
					placeholder="Customer's Mobile Number"
					value="<%= request.getAttribute("CUSTOMER_MOB") %>"> <input
					type="hidden" class="form-control my-1" name="input-items"
					id="input-items" placeholder="Enter here"
					value="<%= request.getAttribute("INPUT_ITEMS") %>"> <input
					type="number" name="paid" placeholder="Paid Amount"
					class="form-control" required>
			</div>
			<button class="btn btn-primary my-2" type="submit">Save</button>
		</form>


		<button onclick="window.location.href='dashboard.jsp'; return false;"
			class="btn btn-primary mx-auto">Back</button>
	</div>

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="assets/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="assets/js/mdb.min.js"></script>
</body>

</html>