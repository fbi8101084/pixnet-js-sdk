# =================== common functions ======================
###
自幹工具區
###
class NoJquery
  _hasProp: {}.hasOwnProperty
  _extends: (child, parent)->
    for own key of parent
      child[key] = parent[key]
    child

  _defaultRequestOption: ()->
    return {
      done: ()->
      fail: ()->
    }

  _serialize: (data)=>
    dataString = ''
    if typeof data is 'object'
      for key, val of data
        if dataString is ''
          dataString += "?#{key}=#{val}"
        else
          dataString += "&#{key}=#{val}"
      return dataString
    else
      return dataString

  _getUrlPara: (name)=>
    url = window.location.search

    if -1 isnt url.indexOf("?")
      params = url.split("?")[1].split("&");
      for item in params
        para = item.split("=")
        if para[0] is name
          return para[1]
        else
          return undefined
    else
      return undefined

  _ajaxOpts:
    type: 'GET'
    url: ''
    data: {}
    dataType: 'text'
    charset: 'UTF-8'
    enctype: 'application/x-www-form-urlencoded'

  _get: (url, opts)=>
    opts.url = url
    return @_ajax(opts)

  _ajax: (opts)=>
    opts = @_extends(@_ajaxOpts, opts)

    switch opts.type
      when 'GET'
        opts.url += @_serialize(opts.data)
        params = ""
      else
        params = JSON.stringify(opts.data)


    done = opts.done || opts.success || ()->
    fail = opts.fail || opts.error   || ()->
    request = new XMLHttpRequest()
    request.open(opts.type, opts.url, true)
    request.setRequestHeader('Content-Type', "#{opts.enctype}; charset=#{opts.charset}")
    request.onload = ()->
      if request.status >= 200 && request.status < 400
        resp = request.responseText
        resp = JSON.parse(resp) if opts.dataType is 'json'
        done(resp) if typeof done is 'function'
      else
        resp = request.responseText
        fail(resp) if typeof fail is 'function'



    request.send(params)
    return request

class PixConsole
  _log: (msg)->
    console.log("PixApi Log:", msg)
  _error: (msg)->
    console.error("PixApi Error", msg)

class Container extends SuperClass
  @include(PixConsole)
  @include(NoJquery)

# =================== common functions ======================

class PixApi extends Container
  data:
    app:
      code: ''
      consumerKey: ''
      consumerSceret: ''
      callbackUrl: ''
      isLogin: false
      loginOpts:
        type: 'onepage' # onepage, popwin, custom
        popwin: undefined

  getData: =>
    @data

  setSceret: (sceret)=>
    @data.app.consumerSceret = sceret
    return @

  setKey: (key)=>
    @data.app.consumerKey = key
    return @

  setCode: (code)=>
    @data.app.code = code
    return @

  init: (options)->
    @data.app.consumerKey    = options.consumerKey    if options.consumerKey
    @data.app.consumerSecret = options.consumerSecret if options.consumerSecret
    @data.app.callbackUrl    = options.callbackUrl    if options.callbackUrl
    @login(@data.app.loginOpts) if options.login is true
    return @

  login: (opts)=>
    opts = @_extends(@data.app.loginOpts, opts)
    callbackUrl = opts.callbackUrl || @data.app.callbackUrl
    consumerKey = @data.app.consumerKey
    # 驗證是否有寫入所需資訊
    @_error('callbackUrl is not defined') if not callbackUrl
    @_error('consumerKey is not defined') if not consumerKey

    # 取得 code 的時候
    if @_getUrlPara('code') and opts.type isnt 'custom'
      @data.app.code    = @_getUrlPara('code')
      @data.app.isLogin = true
      # 如果有 callback 就呼叫
      opts.onGetCode.call(@, @data.app.code) if opts.onGetCode
      @getTokens(opts) # 直接執行取得 Token 的動作

    # 還沒取得 code ，正要去取的時候
    else
      url = "https://emma.pixnet.cc/oauth2/authorize?redirect_uri=#{callbackUrl}&client_id=#{consumerKey}&response_type=code"
      switch opts.type
      # 使用者自定函數去取得授權 code
        when 'custom'
          @_error('You must set a custom function for getting code from oauth2') if not opts.custom
          opts.custom.apply(@, arguments)

      # 使用跳出視窗
        when 'popwin'
          @data.app.loginOpts.popwin = window.open(url, 'getCodeWindow')

      # 預設單一頁面換頁
        else
          location.href = url
    return @

  getTokens: (opts)=>
    data = @_extends(@data.app, opts.data)

    @_error('consumerSecret is not defined') if not data.consumerSecret

    done = opts.onGetTokens || ()->
    fail = opts.fail || ()->

    @_get('https://emma.pixnet.cc/oauth2/grant', {
      data:
        redirect_uri: data.callbackUrl
        client_id: data.consumerKey
        client_secret: data.consumerSecret
        code: data.code
        grant_type: "authorization_code"
      done: done
      fail: fail
    })

window.PixApi = new PixApi()