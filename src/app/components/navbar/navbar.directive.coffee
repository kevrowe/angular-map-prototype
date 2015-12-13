angular.module 'angularMapPrototype'
.directive 'navbar', (ViewHelperService, MapService) ->
  NavbarController = () ->
    'ngInject'
    vm = this
    vm.selection = MapService.selection
    vm.topFilters = ViewHelperService.range(1,10)
    vm.bottomFilters = ViewHelperService.range(11,20)

    vm.toggleFilter = (filter, group) ->
      if (vm.selection[group].indexOf filter) > -1
        MapService.selection[group] = MapService.selection[group].filter (e) ->
          return e != filter
      else
        MapService.selection[group].push filter

      vm.selection = MapService.selection
      return
    return

  directive =
    name: 'navbar'
    restrict: 'E'
    templateUrl: 'app/components/navbar/navbar.html'
    scope: creationDate: '='
    controller: NavbarController
    controllerAs: 'vm'
    bindToController: true
