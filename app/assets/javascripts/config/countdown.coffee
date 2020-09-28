$(document).on 'ready page:load', ->
  updateCountdown()
  setInterval((-> updateCountdown()), 1000)

updateCountdown = ->
  dateNow = moment()
  dateWedding = moment.tz('2015-05-30 15:00:00', 'Europe/Warsaw')
  duration = moment.duration(dateNow.diff(dateWedding))

  years = Math.floor(duration.asYears())
  duration = duration.add(-years, 'years')

  months = Math.floor(duration.asMonths())
  duration = duration.add(-months, 'months')

  days = Math.floor(duration.asDays())
  duration = duration.add(-days, 'days')

  hours = Math.floor(duration.asHours())
  duration = duration.add(-hours, 'hours')

  minutes = Math.floor(duration.asMinutes())
  durations = duration.add(-minutes, 'minutes')

  seconds = Math.floor(duration.asSeconds())

  element = $('.countdown')
  element.find('.years .value').text(asTime(years))
  element.find('.months .value').text(asTime(months))
  element.find('.days .value').text(asTime(days))
  element.find('.hours .value').text(asTime(hours))
  element.find('.minutes .value').text(asTime(minutes))
  element.find('.seconds .value').text(asTime(seconds))

asTime = (value) ->
  return "00" if value <= 0
  value = Math.round(value).toString()
  if value.length > 1 then value else "0#{value}"
