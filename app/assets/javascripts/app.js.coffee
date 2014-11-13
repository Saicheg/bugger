window.app = angular.module('Bugger', ['ng-rails-csrf', 'ui.bootstrap', 'rails', 'xeditable', 'angular-flash.service', 'angular-flash.flash-alert-directive'])

window.app.run (editableOptions) -> editableOptions.theme = 'bs3'

window.app.config (flashProvider) ->
  flashProvider.errorClassnames.push('alert-danger')
