<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Expedia</title>
<style>
star-rating {
	line-height: 32px;
	font-size: 1.25em;
}

.star-rating .fa-star {
	color: yellow;
}



</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body ng-app="myApp" class="ng-cloak">
	<div class="generic-container" ng-controller="HotelController">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Hotel Offers </span>
			</div>
			<div class="formcontainer">
				<form name="myForm" class="form-horizontal">

					<div class="row">
						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Region
								ID </label>
							<div class="col-md-7">
								<input type="text" ng-model="param.regionIds"
									class="form-control input-sm" />
							</div>
						</div>

						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Destination
								City</label>
							<div class="col-md-7">
								<input type="text" ng-model="param.destinationCity"
									class="form-control input-sm" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Max Trip
								Start Date </label>
							<div class="col-md-7">
								<input type="text" ng-model="param.maxTripStartDate"
									placeholder="Format Example 2017-05-03"
									class="form-control input-sm" />
							</div>
						</div>

						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Min Trip
								Start Date </label>
							<div class="col-md-7">


								<input type="text" ng-model="param.minTripStartDate"
									placeholder="Format Example 2017-05-03"
									class="form-control input-sm" />
							</div>
						</div>
					</div>




					<div class="row">
						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Max Star
								Rating</label>
							<div class="col-md-7">


								<input type="text" ng-model="param.maxStarRating"
									class="form-control input-sm" />
							</div>
						</div>

						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Min Star
								Rating</label>
							<div class="col-md-7">


								<input type="text" ng-model="param.minStarRating"
									class="form-control input-sm" />
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Min
								Total Rating</label>
							<div class="col-md-7">


								<input type="text" ng-model="param.minTotalRating"
									class="form-control input-sm" />
							</div>
						</div>

						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Max
								Total Rating</label>
							<div class="col-md-7">


								<input type="text" ng-model="param.maxTotalRating"
									class="form-control input-sm" />
							</div>
						</div>
					</div>



					<div class="row">
						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Min
								Guest Rating</label>
							<div class="col-md-7">


								<input type="text" ng-model="param.minGuestRating"
									class="form-control input-sm" />
							</div>
						</div>

						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Max
								Total Rating</label>
							<div class="col-md-7">


								<input type="text" ng-model="param.maxGuestRating"
									class="form-control input-sm" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-6">
							<label class="col-md-4 control-lable" for="file">Length
								Of Stay </label>
							<div class="col-md-7">
								<input type="text" ng-model="param.lengthOfStay"
									class="form-control input-sm" />
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="Search"
								class="btn btn-primary btn-sm" ng-click="submit()"
								ng-disabled="myForm.$invalid">

						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="container"></div>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">List of Hotels </span>
			</div>





			<div class="tablecontainer row">

				<div class="card col-md-4 pb-2" ng-repeat="h in hotels">
				
					<img class="card-img-top" ng-src="{{h.hotelInfo.hotelImageUrl}}"
						alt="Card image cap">
					<div class="card-block">
						<h5 class="card-title ">{{h.hotelInfo.hotelName}}</h5>
					
						<p class="card-text">
						<ul>
							<li>Address : {{h.destination.longName}}</li>
							<li>Saving : {{h.hotelPricingInfo.percentSavings}} {{h.hotelPricingInfo.currency}}    </li>
						    <li>Star Rating : {{h.hotelInfo.hotelStarRating}}</li>
						    <li>Guest Rating : {{h.hotelInfo.hotelGuestReviewRating}}</li>
			  			
				
						</ul>

		
					</div>
          	<a href="{{decode(h.hotelUrls.hotelInfositeUrl)}}" target="blank"
						class="btn btn-primary">Visit Hotel</a>
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-primary"     ng-click="getAllInfo(h)">See More</button>


				</div>
			</div>

			
		</div>
		
			<!-- Modal -->
							<div  class="modal fade" id="infoModel" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title">{{selectedInfo.hotelInfo.hotelName}},{{selectedInfo.hotelInfo.hotelCity}}</h4>
										</div>
										<div class="modal-body" >
											
											
                             <ul class="list-group">
							<li class="list-group-item">Address : {{selectedInfo.destination.longName}}</li>
							  <li class="list-group-item">Start Date : {{selectedInfo.offerDateRange.travelStartDate}}</li>
							<li class="list-group-item">End Date : {{selectedInfo.offerDateRange.travelEndDate}} </li>
						   							<li class="list-group-item">Length Of Stay : {{selectedInfo.offerDateRange.lengthOfStay}} </li>
						   
						   
						   	<li class="list-group-item">Total Price Value : {{selectedInfo.hotelPricingInfo.totalPriceValue}} {{h.hotelPricingInfo.currency}}  </li>
						   
						   
						   <li class="list-group-item">Original Price Per Night : {{selectedInfo.hotelPricingInfo.originalPricePerNight}} {{h.hotelPricingInfo.currency}}  </li>
						   
						   
							<li class="list-group-item">Saving : {{selectedInfo.hotelPricingInfo.percentSavings}} {{h.hotelPricingInfo.currency}}    </li>
						    
						    <li class="list-group-item">Star Rating : {{selectedInfo.hotelInfo.hotelStarRating}}</li>
						    <li class="list-group-item">Guest Rating : {{selectedInfo.hotelInfo.hotelGuestReviewRating}}</li>
			  			
			</ul>
						</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>

								</div>
							</div>
		
		
	</div>
				
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.6/angular.js"></script>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/offer_service.js' />"></script>
	<script
		src="<c:url value='/static/js/controller/offer_controller.js' />"></script>
</body>
</html>