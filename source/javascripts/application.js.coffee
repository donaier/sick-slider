#= require jquery

$(document).ready ->

  count = 0
  images = $("#gallery img")
  
  
  ($(images[i]).addClass("image-"+i) for i in [0..(images.length-1)])

  next = () ->
    if (count < (images.length-1)) 
      count += 1
    else 
      count = 0
    show (count)
    
  show = (num) ->
    images.fadeOut(1000)
    $(".image-"+num).stop().fadeIn(1000)

  $("#gallery").click(next)

  show(count)
  setInterval next, 4000