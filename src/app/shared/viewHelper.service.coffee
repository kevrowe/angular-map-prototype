angular.module 'angularMapPrototype'
.service 'ViewHelperService', ->
  range: (from, to) ->
    response = []

    for i in [from...to] by 1
      response.push i
    return response

