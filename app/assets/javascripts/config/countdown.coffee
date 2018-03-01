$(document).on 'ready page:load', ->
  updateCountdown()
  setInterval((-> updateCountdown()), 1000)

updateCountdown = ->
  element = $('.countdown')
  dateNow = new Date()
  dateWedding = new Date('2015.05.30 15:00:00 GMT+01:00')
  delta = (dateNow - dateWedding) / 1000

  secondsPerYear = 60*60*24*365
  years = Math.floor(delta / secondsPerYear)
  delta = delta % secondsPerYear

  secondsPerWeek = 60*60*24*7
  weeks = Math.floor(delta / secondsPerWeek)
  delta = delta % secondsPerWeek

  secondsPerDay = 60*60*24
  days = Math.floor(delta / secondsPerDay)
  delta = delta % secondsPerDay

  secondsPerHour = 60*60
  hours = Math.floor(delta / secondsPerHour)
  delta = delta % secondsPerHour

  secondsPerMinute = 60
  minutes = Math.floor(delta / secondsPerMinute)
  seconds = delta % secondsPerMinute

  element.find('.years .value').text(asTime(years))
  element.find('.weeks .value').text(asTime(weeks))
  element.find('.days .value').text(asTime(days))
  element.find('.hours .value').text(asTime(hours))
  element.find('.minutes .value').text(asTime(minutes))
  element.find('.seconds .value').text(asTime(seconds))

asTime = (value) ->
  return "00" if value <= 0
  value = Math.round(value).toString()
  if value.length > 1 then value else "0#{value}"
