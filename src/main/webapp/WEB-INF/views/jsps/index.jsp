<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,com.covid9.stats.model.Data"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Coronvirus Tracker</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
</head>
<style>
.stick {
	background: white;
	top: 0;
	box-shadow: 0 2px 2px -1px rgba(0, 0, 0, 0.4);
}

.hideDistrictdata {
	display: none;
}

.row {
	border-style: outset;
	border-width: 1px;
	padding: 10px;
}
</style>

<script type="text/javascript">
    function showDistrictData(districtId) {
    	
    	var districtBlockId = districtId+'districtData'
    	
    	 if( $('#'+districtBlockId).css('display').toLowerCase() == 'block') {
    		$('#'+districtBlockId).css("display", "none");  
    	}else{
        	$('div[id$="districtData"]').css("display", "none");
    		$('#'+districtBlockId).css("display", "block"); 
    		$('#'+districtBlockId).css("background-color","rgb(244, 247, 250)");
    	}

    }
</script>
<body>

	<div class="container-fluid">
		<table class="table stick">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">State/UT</th>
					<th scope="col">Confirmed</th>
					<th scope="col">Active</th>
					<th scope="col">Recovered</th>
					<th scope="col">Deceased</th>
				</tr>
			</thead>
		</table>

		<c:forEach var="data" items="${dataListByState}" varStatus="dataloop">
			<div class="row text-monospace" >
				<div class="col-1">
					<b> <a href='javascript:void();' id="${dataloop.index}"
						onclick="showDistrictData(${dataloop.index})" title="Click to show district wise"> > </a></b>
				</div>
				<div class="col">${data.state}</div>
				<div class="col">${data.totalConfirmed}</div>
				<div class="col">${data.totalActive}</div>
				<div class="col">${data.totalRecovered}</div>
				<div class="col">${data.totalDeceased}</div>
			</div>


			<div id="${dataloop.index}districtData"	class="hideDistrictdata">
					<hr />
				<p class="text-center text-monospace">
					<b>District Data Starts</b>
				</p>
				
				<table class="table stick">
					<thead>
						<tr>
							<th scope="col">District</th>
							<th scope="col">Confirmed</th>
							<th scope="col">Active</th>
							<th scope="col">Recovered</th>
							<th scope="col">Deceased</th>
						</tr>
					</thead>
				</table>

				
				<c:forEach var="districtData" items="${data.districtData}"
					varStatus="districtDataloop">
					<div class="row  text-monospace font-weight-bold">
						<div class="col">${districtData.district}</div>
						<div class="col">${districtData.confirmed}</div>
						<div class="col">${districtData.active}</div>
						<div class="col">${districtData.recovered}</div>
						<div class="col">${districtData.deceased}</div>
					</div>
				</c:forEach>
				<hr />
				<p class="text-center text-monospace">
					<b>District Data Ends</b>
				</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>