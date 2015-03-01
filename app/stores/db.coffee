Firebase = require 'firebase'

questionsRef = new Firebase 'https://live-pi-chart.firebaseio.com/questions'

module.exports = { questionsRef }
