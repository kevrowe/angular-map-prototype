angular.module 'angularMapPrototype'
  .config ($logProvider, toastrConfig) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # Set options third-party lib
    toastrConfig.allowHtml = true
    toastrConfig.timeOut = 3000
    toastrConfig.positionClass = 'toast-top-right'
    toastrConfig.preventDuplicates = false
  .config (uiGmapGoogleMapApiProvider) ->
    uiGmapGoogleMapApiProvider.configure
      key: 'AIzaSyAfJgEuirb_4v4Adr91ivE_wsEbKRiCjZI'
      v: '3.20'
      libraries: 'weather,geometry,visualization'
    return