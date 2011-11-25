#= require jquery

$(document).ready ->

  count = 0
  interval = 2000
  transition = 1000
  images = $("#gallery img")
  pp = false
  ticker = null
  
  ($(images[i]).addClass("image-"+i) for i in [0..(images.length-1)])

  next = () ->
    if (count < (images.length-1)) 
      count += 1
    else 
      count = 0
    show (count)
    
  prev = () ->
    if (count > 0)
      count -= 1
    else 
      count = images.length-1
    show (count)
    
  show = (num) ->
    images.fadeOut(transition)
    $(".image-"+num).stop().fadeIn(transition)
    
  startstop = () ->
    clearInterval(ticker) if !pp
    ticker = null
    pp = !pp
    if (!pp)
      ticker = setInterval next, interval
    
    
  $("#next").click(next)
  $("#prev").click(prev)
  
  $("#gallery").hover(startstop)

  show(count)
  ticker = setInterval next, interval if !pp