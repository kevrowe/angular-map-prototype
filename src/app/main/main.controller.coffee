angular.module 'angularMapPrototype'
  .controller 'MainController', ($rootScope, toastr) ->
    'ngInject'
    vm = this

    $rootScope.$on 'amp.error', ($event, data) ->
      toastr.error '<p>' + data + '</p>'

    return
