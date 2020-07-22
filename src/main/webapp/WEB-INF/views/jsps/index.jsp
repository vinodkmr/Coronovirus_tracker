<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,com.covid9.stats.model.Data"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" name="viewport"
	content="width=device-width, initial-scale=1">
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

/* .resize{
font-size: calc(7% + 0.8vw + 0.8vh);
} */
.boldsize {
	font-size: calc(50% + 1vw + 1vh);
}

.break {
	word-wrap: break-word;
}

@media ( min-width : 320px) {
	.resize {
		font-size: 0.8rem;
	} /*1rem = 16px*/
	.header {
		font-size: 0.65rem;
		font-weight: 700;
	}
}

@media ( min-width : 544px) {
	.resize {
		font-size: 1rem;
	} /*1rem = 16px*/
	.header {
		font-size: 1rem;
		font-weight: 700;
	}
}

/* Large devices (desktops, 992px and up) */
@media ( min-width : 992px) {
	.resize {
		font-size: 2rem;
	}
	.header {
		font-size: 2rem;
		font-weight: 700;
	}
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
		<div class="row">
			<div class="col">
				<h1 class="float-left" style="padding-top:25px; font-weight:700;"><a href= "#" onclick="location.reload();">Covid - 19 Tracker</a></h1>
				<a href="https://github.com/vinodkmr/Coronovirus_tracker">
				 <img src="images/GitHub-Mark-120px-plus.png" class="float-right img-fluid"
					alt="click to go to github repo">
				</a>
			</div>
		</div>
		<div class="row resize">
			<div class="col-3 header">State/UT</div>
			<div class="col header">Confirmed</div>
			<div class="col header">Active</div>
			<div class="col header">Recovered</div>
			<div class="col header">Deceased</div>

		</div>

		<c:forEach var="data" items="${dataListByState}" varStatus="dataloop">
			<div id="${dataloop.index}"
				onclick="showDistrictData(${dataloop.index})"
				class="row text-monospace">

				<div class="col-3 resize" title="click to show district wise" >${data.state}</div>
				<div class="col resize">${data.totalConfirmed}</div>
				<div class="col resize">${data.totalActive}</div>
				<div class="col resize">${data.totalRecovered}</div>
				<div class="col resize">${data.totalDeceased}</div>
			</div>


			<div id="${dataloop.index}districtData" class="hideDistrictdata">
				<hr />
				<p class="text-center text-monospace header">
					<b>District Data Starts</b>
				</p>
				<div class="row">
					<div class="col-3 header">District</div>
					<div class="col header">Confirmed</div>
					<div class="col header">Active</div>
					<div class="col header">Recovered</div>
					<div class="col header">Deceased</div>
				</div>

				<c:forEach var="districtData" items="${data.districtData}"
					varStatus="districtDataloop">
					<div class="row  text-monospace">
						<div class="col-3 resize break">${districtData.district}</div>
						<div class="col resize">${districtData.confirmed}</div>
						<div class="col resize">${districtData.active}</div>
						<div class="col resize">${districtData.recovered}</div>
						<div class="col resize">${districtData.deceased}</div>
					</div>
				</c:forEach>
				<hr />
				<p class="text-center text-monospace header">
					<b>District Data Ends</b>
				</p>
			</div>
		</c:forEach>
	</div>

</body>
</html>