class PixAlbum
  getAlbumMain: (callback, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._get('https://emma.pixnet.cc/album/main', {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @getAlbumMain.apply(@, args)
        , data, args)
    })
    return @

  getAlbumSetfolders: (callback, userName, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      user: userName
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._get('https://emma.pixnet.cc/album/setfolders', {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @getAlbumSets.apply(@, args)
        , data, args)
    })
    return @

  sortSetFolders: (callback, ids, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      ids: ids
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post('https://emma.pixnet.cc/album/setfolders/position', {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @sortSetFolders.apply(@, args)
        , data, args)
    })
    return @

  getAlbumSets: (callback, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/sets", pixnet._defaultXHROptions(data, callback)
    return @

  getAlbumSet: (callback, id, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/sets/#{id}", pixnet._defaultXHROptions(data, callback)
    return @

  getAlbumSetElements: (callback, setId, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/sets/#{setId}", pixnet._defaultXHROptions(data, callback)
    return @

  getAlbumSetComments: (callback, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/set_comments", pixnet._defaultXHROptions(data, callback)
    return @

  createAlbumSet: (callback, title, description, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      title: title
      description: description
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post('https://emma.pixnet.cc/album/sets', {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @createAlbumSet.apply(@, args)
        , data, args)
    })
    return @

  updateAlbumSet: (callback, id, title, description, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      title: title
      description: description
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/sets/#{id}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @updateAlbumSet.apply(@, args)
        , data, args)
    })
    return @

  deleteAlbumSet: (callback, id, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._delete("https://emma.pixnet.cc/album/sets/#{id}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @deleteAlbumSet.apply(@, args)
        , data, args)
    })
    return @

  sortAlbumSets: (callback, parentId, ids, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      parent_id: parentId
      ids: ids
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/sets/position", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @sortAlbumSets.apply(@, args)
        , data, args)
    })
    return @

  getAlbumSetsNear: (callback, userName, lat_y, lon_x, optionData)->
    data =
      user: userName
      lat: lat_y
      lon: lon_x
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/sets/nearby", pixnet._defaultXHROptions(data, callback)
    return @

  getAlbumFolders: (callback, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/folders", pixnet._defaultXHROptions(data, callback)
    return @

  getAlbumFolder: (callback, id, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/folders/#{id}", pixnet._defaultXHROptions(data, callback)
    return @

  getAlbumFolderSets: (callback, id, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/folders/#{id}/sets", pixnet._defaultXHROptions(data, callback)
    return @

  createAlbumFolder: (callback, title, description, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      title: title
      description: description
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post('https://emma.pixnet.cc/album/folders', {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @createAlbumFolder.apply(@, args)
        , data, args)
    })
    return @

  updateAlbumFolder: (callback, id, title, description, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      title: title
      description: description
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/folders/#{id}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @updateAlbumFolder.apply(@, args)
        , data, args)
    })
    return @

  deleteAlbumFolder: (callback, id, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._delete("https://emma.pixnet.cc/album/folders/#{id}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @deleteAlbumFolder.apply(@, args)
        , data, args)
    })
    return @

  getAlbumElements: (callback, setId, userName, optionData)->
    data =
      user: userName
      set_id: setId
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/elements", pixnet._defaultXHROptions(data, callback)
    return @

  getElement: (callback, elementId, userName, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      user: userName
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._get("https://emma.pixnet.cc/album/elements/#{elementId}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @getElement.apply(@, args)
        , data, args)
    })
    return @

  getElementComments: (callback, elementId, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/elements/#{elementId}/comments", pixnet._defaultXHROptions(data, callback)
    return @

  createElement: (callback, setId, uploadFile, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      set_id: setId
      upload_file: uploadFile
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments

    data.upload_file = uploadFile.replace('data:image/png;base64,', '') if data.upload_method is "base64"

    pixnet._upload("https://emma.pixnet.cc/album/elements", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @createElement.apply(@, args)
        , data, args)
    })
    return @

  updateElement: (callback, id, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/elements/#{id}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @updateElement.apply(@, args)
        , data, args)
    })
    return @

  deleteElement: (callback, id, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._delete("https://emma.pixnet.cc/album/elements/#{id}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @deleteElementt.apply(@, args)
        , data, args)
    })
    return @

  sortElement: (callback, setId, ids, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      set_id: setId
      ids: ids
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/elements/position", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @sortElement.apply(@, args)
        , data, args)
    })
    return @

  getElementCommentsNear: (callback, userName, lat_y, lon_x, optionData)->
    data =
      user: userName
      lat: lat_y
      lon: lon_x
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/elements/nearby", pixnet._defaultXHROptions(data, callback)
    return @


  getSetComments: (callback, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/set_comments", pixnet._defaultXHROptions(data, callback)
    return @

  getSetComment: (callback, id, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/set_comments/#{id}", pixnet._defaultXHROptions(data, callback)
    return @

  createSetComment: (callback, setId, userName, body, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      set_id: setId
      user: userName
      body: body
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/set_comments", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @createSetComments.apply(@, args)
        , data, args)
    })
    return @

  markSetCommentSpam: (callback, id, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/set_comments/#{id}/mark_spam", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @markCommentSpam.apply(@, args)
        , data, args)
    })
    return @

  markSetCommentHam: (callback, id, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/set_comments/#{id}/mark_ham", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @markCommentSpam.apply(@, args)
        , data, args)
    })
    return @

  deleteSetComment: (callback, id, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._delete("https://emma.pixnet.cc/album/set_comments/#{id}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @deleteSetComment.apply(@, args)
        , data, args)
    })
    return @

  getComments: (callback, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/comments", pixnet._defaultXHROptions(data, callback)
    return @

  getComment: (callback, id, userName, optionData)->
    data =
      user: userName
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/comments/#{id}", pixnet._defaultXHROptions(data, callback)
    return @

  createElementComment: (callback, elementId, userName, body, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      element_id: elementId
      user: userName
      body: body
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/comments", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @createElementComments.apply(@, args)
        , data, args)
    })
    return @

  markElementCommentSpam: (callback, commentId, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/comments/#{commentId}/mark_spam", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @markElementCommentSpam.apply(@, args)
        , data, args)
    })
    return @

  markElementCommentHam: (callback, commentId, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/comments/#{commentId}/mark_ham", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @markElementCommentSpam.apply(@, args)
        , data, args)
    })
    return @

  deleteElementComment: (callback, commentId, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._delete("https://emma.pixnet.cc/album/comments/#{commentId}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @deleteElementComment.apply(@, args)
        , data, args)
    })
    return @

  createFace: (callback, userName, elementId, posX, posY, width, height, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      user: userName
      element_id: elementId
      x: posX
      y: posY
      w: width
      h: height
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/faces", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @createFace.apply(@, args)
        , data, args)
    })
    return @

  updateFace: (callback, faceId, userName, elementId, posX, posY, width, height, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      user: userName
      element_id: elementId
      x: posX
      y: posY
      w: width
      h: height
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._post("https://emma.pixnet.cc/album/faces/#{faceId}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @updateFace.apply(@, args)
        , data, args)
    })
    return @

  deleteFace: (callback, faceId, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._delete("https://emma.pixnet.cc/album/faces/#{faceId}", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @deleteFace.apply(@, args)
        , data, args)
    })
    return @

  getConfig: (callback, optionData)->
    if not pixnet.isLogin
      pixnet._error 'Need login'
      return @

    data =
      access_token : pixnet.getData('accessToken')
    data = pixnet._extends(data, optionData)
    args = arguments
    pixnet._get("https://emma.pixnet.cc/album/config", {
      data: data
      done: (data)=>
        callback(data) if callback
      fail: (data)=>
        pixnet.apiInvalidGrantFunc(()=>
          @getConfig.apply(@, args)
        , data, args)
    })
    return @

  getSiteCategories: (callback, optionData)->
    data = {}
    data = pixnet._extends(data, optionData)
    pixnet._get "http://emma.pixnet.cc/album/site_categories", pixnet._defaultXHROptions(data, callback)
    return @

pixnet.album = new PixAlbum()
