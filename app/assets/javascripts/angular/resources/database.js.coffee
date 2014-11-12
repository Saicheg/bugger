app.factory 'Database', (railsResourceFactory, railsSerializer) ->
  railsResourceFactory
    url: '/database/{{id}}'
    name: 'database'
    serializer: railsSerializer ->
      @nestedAttribute "husband"
      @nestedAttribute "wife"
      @nestedAttribute "children"
