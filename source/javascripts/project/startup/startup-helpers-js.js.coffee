_NS = @__get_project_namespace__()

_log = _NS.log "Helpers"

_helpers = @__get_project_namespace__ [ "Helpers" ]

_init = (callback) ->
  # _log "init"
  callback()
  
_ob = @__get_project_namespace__ [ "Startup" ]
_ob.add _init