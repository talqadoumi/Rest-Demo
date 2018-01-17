'use strict';

angular.module('myApp').controller('HotelController',
		[ '$scope', 'HotelService', function($scope, HotelService) {

			
$scope.decode = function(url) {
	return decodeURIComponent(url)
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
