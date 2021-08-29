var lazyApp =  angular.module("lazyApp", []);

/*
    @Directive   : lazy-Loading
    @Date        : 06/05/2016
    @Author      : BiswaRanjan Samal
    @Email       : bichhubiswa@gmail.com

    @Description : This directive is developed for implementing the lazy-loading or On-Scroll loading of the data.
                   When the user scrolls down about 30% of the window the data gets loaded by calling the function which is given in the html.

    @Example     : <div  ng-controller="lazyLoadingController" lazy-Loading="loadData()">

    @Explantion  : Above is an Example which shows how to use this directive . "loadData()" ,is the function which will be called
                   when the user scrolls down. The data fetching function should be wriiten in this function,
                   the function name is user defiened , one can use its own function name but the function name should be replaced with "loadData()" .

*/

lazyApp.directive('lazyLoading', function($rootScope, $window){
    return function(scope, element, attr){
    	console.log("lazyLoading Directive is called ........");
        var lastScrollTop = 0;
        var container = angular.element($window);
        var scrollDownHandler = function(e){
            var scrollTop = $(window).scrollTop();
            var docHeight = $(document).height();
            var winHeight = $(window).height();
            var scrollPercent = (scrollTop) / (docHeight - winHeight);
            var scrollPercentRounded = Math.round(scrollPercent*100);
            var pageYoffset =  window.pageYOffset;
            var direction = ""
            if (scrollTop > lastScrollTop){
               direction = "down";
            } else {
              direction = "up";
            }
            lastScrollTop = scrollTop;

            if((scrollPercentRounded >= 30 && scrollPercentRounded <= 40)&& direction == "down"){
                scope.$apply(attr.lazyLoading)
            }
            
        }// End of scrollDownHandler() 

        container.bind("scroll", scrollDownHandler);
    }

})// End of  whenScrolledDown() directive



lazyApp.controller("lazyLoadingController", function($scope,$q,$http){
	$scope.completeData = [];
	$scope.subData = [];

	// Function developed for fetdhing Data from the Json File (data.json) Present inside the "data" folder.
	$scope.fetchData = function(){
		var defered = $q.defer() ;
        $http({
            method : 'POST',
            url : "./data/data.json",
        })
        .success(function(data, status, header, config) {
            //resolve the promise
            defered.resolve(data);
            
        })
        .error(function(data, status, header, config) {
            //reject the promise
            defered.reject('ERROR');
            console.log("Error Occured ......");
        });
        //return the promise

   		return defered.promise;

	}// End of $scope.fetchData()

	// Function to be called for loading and fetching dynamically data 
	$scope.loadData = function(){

		$scope.subData = $scope.subData.concat($scope.completeData.splice($scope.subData.length,10));

	}// End of $scope.loadData()

	var getAjaxStatus = $scope.fetchData();
    getAjaxStatus.then(function(resolve){
        //console.log("Ajax Returned Succesfully ....", resolve);
        $scope.completeData = resolve;
        $scope.subData = $scope.completeData.splice(0,100);
    },function(reject){
        console.log("Ajax Failure Occured ....", reject);
    });

})// End of lazyLoadingController()