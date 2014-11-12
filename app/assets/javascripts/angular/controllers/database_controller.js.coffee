window.app.controller 'DatabaseController', ($scope, Database) ->

  $scope.visible = {_destroy: '0'}

  Database.query().then (database) ->
    $scope.database = database
    $scope.database.children ||= []

  $scope.new = ->
    if confirm 'Are you sure?'
      database = new Database()
      database.save().then  (data) ->
        $scope.database = data
        $scope.database.children ||= []

  $scope.save = ->
    $scope.database.save().then -> alert("Done!")

  $scope.addChild = ->
    $scope.database.children.push {_destroy: '0'}

  $scope.removeChild = (child) ->
    child._destroy = '1'
