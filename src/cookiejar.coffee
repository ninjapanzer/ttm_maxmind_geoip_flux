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
    commitLocale: (locale)->
      jQuery.cookie 'geoswitch_locale[code]', locale.code#, { expires: 3000, path: '/', domain: window.location.hostname }
      jQuery.cookie 'geoswitch_locale[name]', locale.name#, { expires: 3000, path: '/', domain: window.location.hostname }
      dispatcher.dispatch
        actionType: "locale-commited"
        locale: locale
    readLocale: ->
      code:         jQuery.cookie 'geoswitch_locale[code]'
      name:         jQuery.cookie 'geoswitch_locale[name]'
      userSelected: jQuery.cookie 'geoswitch_locale[user_selected]'
    commitUserSelection: (locale)->
      jQuery.cookie 'geoswitch_locale[user_selected]', true#, { expires: 3000, path: '/', domain: window.location.hostname }
      @commitLocale(locale)
      dispatcher.dispatch
        actionType: "locale-commited"
        locale: locale
    clearUserSelection: ->
      jQuery.removeCookie 'geoswitch_locale[code]'#,          { path: '/', domain: window.location.hostname }
      jQuery.removeCookie 'geoswitch_locale[name]'#,          { path: '/', domain: window.location.hostname }
      jQuery.removeCookie 'geoswitch_locale[user_selected]'#, { path: '/', domain: window.location.hostname }

  CookieJar
