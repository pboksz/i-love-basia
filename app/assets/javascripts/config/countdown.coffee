$(document).on 'ready page:load', ->
  updateCountdown()
  setInterval((-> updateCountdown()), 1000)

updateCountdown = ->
  element = $('.countdown')
  dateNow = new Date()
  dateWedding = new Date('2015.05.30 15:00:00')
  delta = (dateWedding - dateNow) / 1000

  secondsPerDay = 60*60*24
  days = delta / secondsPerDay
  delta = delta % secondsPerDay

  secondsPerHour = 60*60
  hours = delta / secondsPerHour
  delta = delta % secondsPerHour

  secondsPerMinute = 60
  minutes = delta / secondsPerMinute
  seconds = delta % secondsPerMinute

  element.find('.days .value').text(asTime(days))
  element.find('.hours .value').text(asTime(hours))
  element.find('.minutes .value').text(asTime(minutes))
  element.find('.seconds .value').text(asTime(seconds))

asTime = (value) ->
  value = Math.round(value).toString()
  if value.length > 1 then value else "0#{value}"
