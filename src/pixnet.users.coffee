class PixUsers
  getAccount: (callback, optionData)->
    options = {
      'callback': callback
      'optionData': optionData
      'mainUri': 'account'
    }
    pixnet.getAuthApiFunc(@, @getAccount, arguments, options)
    return @

  updateAccount: (callback, password = '', optionData) ->
    data = {
      password: password
    }
    data = pixnet._extends(data, optionData)
    options = {
      'callback': callback
      'optionData': data
      'mainUri': 'account/info'
    }
    pixnet.postAuthApiFunc(@, @updateAccount, arguments, options)
    return @

  updatePassword: (callback, pwd, newPwd, optionData) ->
    if not pwd or not newPwd
      pixnet._error 'need password arguments'
      return @
    data = {
        password: pwd
        new_password: newPwd
    }
    data = pixnet._extends(data, optionData)
    options = {
      'callback': callback
      'optionData': data
      'mainUri': 'account/password'
    }
    pixnet.postAuthApiFunc(@, @updatePassword, arguments, options)
    return @

  getUser: (callback, userName, optionData)->
    data = {}
    data = pixnet._extends(data, optionData)
    pixnet._get "https://emma.pixnet.cc/users/#{userName}", pixnet._defaultXHROptions(data, callback)
    return @

  getAnalyticsData: (callback, optionData) ->
    options = {
      'callback': callback
      'optionData': optionData
      'mainUri': 'account/analytics'
    }
    pixnet.getAuthApiFunc(@, @getAnalyticsData, arguments, options)
    return @

  getNotifications: (callback, optionData) ->
    options = {
      'callback': callback
      'optionData': optionData
      'mainUri': 'account/notifications'
    }
    pixnet.getAuthApiFunc(@, @getNotifications, arguments, options)
    return @


pixnet.users = new PixUsers()