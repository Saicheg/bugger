window.app.controller 'DatabaseController', ($scope, Database) ->

  $scope.visible = {_destroy: '0'}

  Database.query().then (database) ->
    $scope.database = database
    console.log $scope.database

  $scope.save = ->
    $scope.database.save().then -> alert("Done!")

  $scope.addChild = ->
    $scope.database.children.push {_destroy: '0'}

  $scope.removeChild = (child) ->
    child._destroy = '1'
