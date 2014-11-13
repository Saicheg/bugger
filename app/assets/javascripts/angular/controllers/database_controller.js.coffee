window.app.controller 'DatabaseController', ($scope, flash, Database) ->

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
    $scope.database.save().then ->
      flash.success = 'Saved!'
    , ->
      flash.error = 'Error!'

  $scope.addChild = ->
    $scope.database.children.push {_destroy: '0'}

  $scope.removeChild = (child) ->
    child._destroy = '1'

  $scope.showPicker = (obj, $event) ->
    $event.preventDefault()
    $event.stopPropagation()

    obj.isOpen = true if obj?

  $scope.showPickerWife = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()

    $scope.database.wifeIsOpen = true

  $scope.$watch 'database.husband.birthday', (newValue) ->
    if newValue?
      a = moment()
      b  = moment(newValue)
      diff = a.diff(b, 'years')

      $scope.database.husband.age = diff

  $scope.$watch 'database.wife.birthday', (newValue) ->
    if newValue?
      a = moment()
      b  = moment(newValue)
      diff = a.diff(b, 'years')

      $scope.database.wife.age = diff if diff > 0
