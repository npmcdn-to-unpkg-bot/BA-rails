var bravoAlberto = angular.module('bravoAlberto', ['ngAnimate', 'ngResource'
  'infinite-scroll'
]);

bravoAlberto.controller('infinite-scroll-bravo', function($scope) {

  $scope.loadMore = function() {
    console.log("Load More!!!");
    $scope.contacts.loadMore();
  };

});
