window.app = angular.module('Bugger', ['ng-rails-csrf', 'ui.bootstrap', 'rails', 'xeditable'])

window.app.run (editableOptions) -> editableOptions.theme = 'bs3'
