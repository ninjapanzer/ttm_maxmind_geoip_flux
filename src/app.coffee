define [
  'geoip2'
  'jQuery'
  './dispatcher'
  './store'
  './cookiejar'
],
(
  geoip2
  jQuery
  dispatcher
  store
  cookieJar
)->
  dispatcher.register (payload)->
    switch payload.actionType
      when "locale-commited"
        verify_locale()

  jQuery ->
    jQuery.cookie.raw = true
    store.locate()
    jQuery('.geoswitch--reset').click cookieJar.clearUserSelection

  verify_locale = ->
    locale = cookieJar.readLocale()
    unless locale.userSelected
      jQuery('.geoswitch--select').val(locale.code + ":" + locale.name)
      jQuery('.geoswitch--wrapper').toggleClass('is-shown')
      jQuery('.geoswitch--select').chosen()
      jQuery('.geoswitch--accept').on('click', accept_locale)

  accept_locale = (cookie_path, cookie_domain)->
    $select = jQuery('.geoswitch--select');
    codeAndName = $select.val().split(':');
    cookieJar.commitUserSelection
      code: codeAndName[0]
      name: codeAndName[1]
    window.location = window.location;
