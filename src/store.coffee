define 'store', [
  'geoip2'
  'jQuery'
  './dispatcher'
  './cookiejar'
],
(
  geoip2
  jQuery
  dispatcher
  cookieJar
)->
  Location = -> {
    data: {}
    stateName: ''
    stateCode: ''
    userSelected: null
    cookiesSet: false

    locate: ->
      locale = cookieJar.readLocale()
      if locale.code && locale.name
        dispatcher.dispatch
          actionType: "locale-commited"
          locale: locale
      else
        console.log('Retrieving location')
        geoip2.city(@save, @error)

    save: (location)->
      @data = location
      subdivision = location.subdivisions[0]
      @stateName  = subdivision.names.en
      @stateCode  = subdivision.iso_code
      cookieJar.commitLocale
        name: @stateName
        code: @stateCode

    error: ->
      console.log "ERROR"
  }

  Store = new Location()
  Store
