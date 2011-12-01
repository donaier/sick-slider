#= require jquery-1.4.3.min.js

$(document).ready ->

  count = 0
  interval = 2000
  transition = 1000
  images = $("#gallery img")
  thumbs = $("#thumbs img")
  pp = false
  ticker = null
  
  ($(images[i]).addClass("image-"+i) for i in [0..(images.length-1)])
  
  ($(thumbs[i]).addClass("thumb-"+i) for i in [0..(thumbs.length-1)])

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
    movethumbs(num)
    $(".image-"+num).fadeIn(transition)
    
  startstop = () ->
    clearInterval(ticker) if !pp
    ticker = null
    pp = !pp
    if (!pp)
      ticker = setInterval next, interval
      
  movethumbs = (num) ->
    thumbs.animate({"left": "+=240px"}, {500}, {"swing"}, hideyo(3))
    if (num == 0)
      $(".thumb-2").animate({"left": "-=960px"}, {500}, {"swing"}, showit(2))
    if (num == 1)
      $(".thumb-3").animate({"left": "-=960px"}, {500}, {"swing"}, showit(3))
    if (num == 2)
      $(".thumb-0").animate({"left": "-=960px"}, {500}, {"swing"}, showit(0))
    if (num == 3)
      $(".thumb-1").animate({"left": "-=960px"}, {500}, {"swing"}, showit(1))
      
  hideyo = (num) ->
    $(".thumb-"+num).hide()
    
  showit = (num) ->
    $(".thumb-"+num).show()
    
  $("#next").click(next)
  $("#prev").click(prev)
  
  $("#gallery").hover(startstop)

  show(count)
  ticker = setInterval next, interval if !pp