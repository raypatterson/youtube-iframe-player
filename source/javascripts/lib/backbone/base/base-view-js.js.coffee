_NS = @__get_project_namespace__()
_MODELS = @__get_project_namespace__ [ "Models" ]
_HELPERS = @__get_project_namespace__ [ "Helpers" ]

class _NS.BaseView extends Backbone.View
  
  className : "BaseView"
  NS : _NS
  MODELS : _MODELS
  ROUTER : undefined
  EVENT : undefined
    
  initialize : ->
    # @className = if @el then "#{@className} #{@el.nodeName} ##{@el.id}" or "#{@className} #{@el.nodeName} .#{el.className}" else @className
    @className = if @el then "#{@className} ##{@el.id}" or "#{@className} .#{el.className}" else @className
    @log = _NS.log @className
    @ROUTER = _NS.navigationRouter
    @EVENT = _NS.eventBus
    @touchOS = _NS.Config.touchOS
    @moveY = _HELPERS.transition.moveY
    _NS.eventBus.bind 'window:resize', (w, h) => @resize w,h
  
  resize: (w, h) ->
    # @log "width: #{w}, height: #{h}"
  
  initResize: ->
    w = $(window).width()
    h = $(window).height()
    @resize w,h