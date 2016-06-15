var app = angular.module('customers', []);
app.controller("CustomerSearchController", ["$scope", "$http",
  function($scope, $http){
    var page = 0;
    $scope.search = function(searchTerm){
      if(searchTerm.length < 3){
        return;
      }
      $scope.searchedFor = searchTerm;
      $http.get("customers.json",{"params":{"keywords": searchTerm, "page": page}})
	   .success(function(data){
	     $scope.customers = data;
	   })
	   .error(function(response){
	     alert("There was a problem: " + response.data);
	   });
    }
    $scope.previousPage = function() {
      if(page > 0){
        page = page - 1;
	$scope.search($scope.keywords);
      }
    }
    $scope.nextPage = function() {
      page = page + 1;
      $scope.search($scope.keywords);
    }
  }
]);
