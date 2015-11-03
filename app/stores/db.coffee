Firebase = require 'firebase'
questionsRef = new Firebase 'https://live-pi-chart.firebaseio.com/questions'
questions = require '../lib/questions'

URL_PARAM_FOR_QUESTIONS = 'q'
DELIMITER = ','

questionsToDisplay = if location.search.indexOf(URL_PARAM_FOR_QUESTIONS) > -1
  obj = {}

  location.search.slice(1).split('&').forEach (params) ->
    [key, value] = params.split '='
    obj[key] = value

  obj[URL_PARAM_FOR_QUESTIONS].split(DELIMITER).map (n) -> +n

else
  [1..questions.length]

module.exports = {
  questionsRef,
  questionsToDisplay
}
