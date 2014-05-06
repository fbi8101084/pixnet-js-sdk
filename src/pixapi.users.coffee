class PixUsers
  getAccount: (callback)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')

    pixnet._get('https://emma.pixnet.cc/account', {
      data: data
      done: (data)=>
        callback(JSON.parse(data)) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @getAccount.apply(@, arguments)
        , data)
    })
    return @

  getUser: (callback, userName)->

    data = {}

    pixnet._get "https://emma.pixnet.cc/users/#{userName}", pixnet._defaultXHROptions(data, callback)
    return @

pixnet.users = new PixUsers()