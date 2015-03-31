define 'cookiejar',
[
  'jQuery'
  './dispatcher'
],
(
  jQuery
  dispatcher
)->
  jQuery.cookie.raw = true;
  CookieJar =
    purgeLegacyCookies: ->
      jQuery.removeCookie('geoswitch_locale[code]', {domain: "." + window.location.hostname})
      jQuery.removeCookie('geoswitch_locale[name]', {domain: "." + window.location.hostname})
      jQuery.removeCookie('geoswitch_locale[user_selected]', {domain: "." + window.location.hostname})
    commitLocale: (locale)->
      jQuery.cookie 'geoswitch_locale[code]', locale.code, { expires: 3000 }
      jQuery.cookie 'geoswitch_locale[name]', locale.name, { expires: 3000 }
      dispatcher.dispatch
        actionType: "locale-commited"
        locale: locale
    readLocale: ->
      code:         jQuery.cookie 'geoswitch_locale[code]'
      name:         jQuery.cookie 'geoswitch_locale[name]'
      userSelected: jQuery.cookie 'geoswitch_locale[user_selected]'
    commitUserSelection: (locale)->
      jQuery.cookie 'geoswitch_locale[user_selected]', true, { expires: 3000 }
      @commitLocale(locale)
      dispatcher.dispatch
        actionType: "locale-commited"
        locale: locale
    clearUserSelection: ->
      jQuery.removeCookie 'geoswitch_locale[code]'
      jQuery.removeCookie 'geoswitch_locale[name]'
      jQuery.removeCookie 'geoswitch_locale[user_selected]'

  CookieJar
