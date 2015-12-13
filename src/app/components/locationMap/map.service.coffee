angular.module 'angularMapPrototype'
.service 'MapService', ($rootScope, $http, $q) ->
  'ngInject'

  service =
    getMap: ->
      if typeof @map == 'undefined'
        $rootScope.$emit 'amp.error', 'There was a problem with the map!'

      return @map
    getLocations: ->
      deferred = $q.defer()

      $http.get '/assets/data/locations.json'
        .success (data) ->
          deferred.resolve data

      return deferred.promise
    setMap: (inMap) ->
      @map = inMap
    markers: []
    visibleMarkers: []
    selection:
      top: []
      bottom: []

  applyFilters = ->
    result = []
    if service.selection.bottom.length == 0 and service.selection.top.length == 0
      service.visibleMarkers = service.markers
      return

    for i, location of service.markers
      match = false

      for j, filter of location.properties
        if (service.selection.top.indexOf filter) > -1 or (service.selection.bottom.indexOf filter) > -1
          result.push location
          match = true
          break

    service.visibleMarkers = result
    return

  $rootScope.$watch (-> service.selection), applyFilters, true
  return service