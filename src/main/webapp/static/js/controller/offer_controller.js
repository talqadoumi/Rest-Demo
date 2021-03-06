'use strict';

angular.module('myApp').controller('HotelController',
		[ '$scope', 'HotelService', function($scope, HotelService) {
			$scope.showModel=false;
			$scope.selectedInfo={}
			$scope.destinationLlongName='destinationLlongName'
$scope.decode = function(url) {
	return decodeURIComponent(url)
}
		
$scope.getAllInfo = function(allInfo) 
{
	
	
	$scope.selectedInfo =allInfo;
	$scope.test =allInfo.destination.longName;
	//$scope.destinationLlongName=allInfo.destination.longName
	
	
	
	$('#infoModel').modal('show')	
	
	
}
			   
	
			
			$scope.param = {regionIds:null,address:null};
			$scope.hotels = [];
			$scope.submit = function() {

				    var queryStr = {};
								 
				    for (var key in $scope.param) {
				        if ($scope.param[key]) {
				            queryStr[key] = $scope.param[key];
				        }
				    }
					 console.log(queryStr);
					 fetchAllOffers(queryStr);

							    };


							    fetchAllOffers({});
			
			 
			

				function fetchAllOffers(queryStr) 
				{

					HotelService.getHotelsOffersWithFilter(queryStr).then(function(d) {
						$scope.hotels = d.offers.Hotel;
						
				    //    console.log(d.offers.Hotel[0].destination.longName)
				       
						
					}, function(errResponse) {

						console.error('Error while fetching Hotels Offers');
					});
				}
			 
			 
			 


		} ]);
