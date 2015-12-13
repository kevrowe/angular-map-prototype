angular.module 'angularMapPrototype'
  .directive 'locationMap', ->
    LocationMapController = ($rootScope, MapService) ->
      'ngInject'
      vm = this
      vm.map =
        center:
          longitude: 101.5,
          latitude: 3.1
        options:
          panControl: false
          streetViewControl: false
          zoomControlOptions:
            style: 1 # Small
            position: 8 # Center right
        pan: true
        zoom: 10
        markers:
          models: []
          coords: 'coords'

      MapService.getLocations().then (data) ->
        MapService.markers = MapService.visibleMarkers = data

      $rootScope.$watch (-> MapService.visibleMarkers), ->
        vm.map.markers.models = MapService.visibleMarkers
      return

    directive =
      name: 'locationMap'
      restrict: 'E'
      templateUrl: 'app/components/locationMap/locationMap.html'
      controller: LocationMapController
      controllerAs: 'vm'
      bindToController: true