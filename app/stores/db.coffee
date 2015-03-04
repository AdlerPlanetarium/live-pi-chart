Firebase = require 'firebase'

ref = new Firebaes 'https://live-pi-chart.firebaseio.com/'
questionsRef = new Firebase 'https://live-pi-chart.firebaseio.com/questions'

module.exports = { ref, questionsRef }
