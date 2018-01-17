'use strict';

angular.module('myApp').factory('HotelService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'https://demo-rest-1.herokuapp.com/getOffers/v1';

    
    var factory = {
    		getHotelsOffers: getHotelsOffers ,
    		getHotelsOffersWithFilter:getHotelsOffersWithFilter
    };

    return factory;

    function getHotelsOffers() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
            
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
   

    function getHotelsOffersWithFilter(queryStr) {
        var deferred = $q.defer();
        
        console.log(queryStr)
        
        $http.get(REST_SERVICE_URI,{params: queryStr})
            .then(
            function (response) {
            
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching offers');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }
    
    
    
    
    

    function createUser(user) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateUser(user, id) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+id, user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function deleteUser(id) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+id)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while deleting User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

}]);
