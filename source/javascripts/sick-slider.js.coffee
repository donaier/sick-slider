#= require jquery

window.SickSlider ||= {}

class window.SickSlider
  
  constructor: (opts = {} ) ->
    
    @autoloop = if opts.autoloop? then opts.autoloop else true
    @cicle = if opts.cicle? then opts.cicle else true
    @transition = if opts.transition? then opts.transition else 1000
    @interval = if opts.interval? then opts.interval else 4000
    @images = if opts.images? then opts.images else $("#gallery img")
    
    @count = 0
    @pause = false
    @ticker = null
    
    @images.each (idx) => $(@images[idx]).addClass("image-"+idx)
    @length = @images.length
    
    @show(@count)
    @ticker = setInterval @ticker_kicker, @interval, @ if @autoloop
      
    $("#next").click =>
      @next()
    $("#prev").click =>
      @prev()
    $("#gallery").hover =>
      @startstop()
    
  
  show: (num) ->
    @check_arrow_visibility(num) if !@cicle
    @images.fadeOut(@transition)
    $(".image-"+num).fadeIn(@transition)
    
  next: ->
    if (@count < (@images.length-1)) 
      @count += 1
      @show (@count)
    else
      if (@cicle)
        @count = 0
        @show (@count)
  
  prev: ->
    if (@count > 0)
      @count -= 1
      @show (@count)
    else
      if @cicle
        @count = @images.length-1
        @show (@count)
        
  check_arrow_visibility: (count) ->
    if ((count+1) >= @images.length)
      $('#next').hide()
    else
      $('#next').show()

    if (count == 0)
      $('#prev').hide()
    else
      $('#prev').show()
      
  startstop: ->
    clearInterval(@ticker) if !@pause
    @ticker = null
    @pause = !@pause
    if (!@pause)
      @ticker = setInterval @ticker_kicker, @interval, @ if @autoloop
      
  ticker_kicker: (_at) ->
    _at.next()
