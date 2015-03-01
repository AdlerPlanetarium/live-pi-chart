# @cjsx React.DOM
React = require 'react/addons'
questionDefinitions = require '../lib/questions'
PieChart = require './pie-chart'

PieChartList = React.createClass
  displayName: 'PieChartList'

  render: ->
    pieCharts = for question, i in questionDefinitions
      <PieChart key={i} question={question} />

    <div className="pie-chart-list">
      {pieCharts}
    </div>

module.exports = PieChartList
