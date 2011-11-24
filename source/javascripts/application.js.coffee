#= require jquery

$(document).ready ->

  count = 0
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
    images.fadeOut(1000)
    $(".image-"+num).stop().fadeIn(1000)
    
  startstop = () ->
    clearInterval(ticker) if !pp
    ticker = null
    pp = !pp
    if (!pp)
      ticker = setInterval next, 2000
    
    
  $("#next").click(next)
  $("#prev").click(prev)
  
  $("#gallery").hover(startstop)

  show(count)
  ticker = setInterval next, 2000 if !pp