class SickSlider
  
  constructor: (@images) ->
    @images.each (idx) -> $(images[idx]).addClass("image-"+idx)
    @length = @images.length
    @count = 0
    @transition = 1000
    @interval = 4000
    @pause = false
    @ticker = null
    @autoloop = true
    @cicle = true
    
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
     
$(document).ready ->
  slider = new SickSlider($("#gallery img"))