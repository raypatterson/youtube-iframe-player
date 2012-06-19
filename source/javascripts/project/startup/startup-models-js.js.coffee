_NS = @__get_project_namespace__()

_log = _NS.log "Models"

_models = @__get_project_namespace__ [ "Models" ]
  
_addModels = (callback) ->
  
  _models.mainModel = new _NS.MainModel
  
  url = _NS.Config.FilePaths.mainData
  
  _NS.Loader.getJSON url, ((data) ->
    
    callback()
    
    ), (error) ->
      _log "[ Main data failed to load ]"
      callback()

_init = (callback) ->
  
  callback()
  
  # Nimble.parallel [
    # _addModels
  # ], callback
  
  @
  
_ob = @__get_project_namespace__ [ "Startup" ]
_ob.add _init