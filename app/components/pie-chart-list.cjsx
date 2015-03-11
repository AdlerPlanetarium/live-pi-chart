React = require 'react/addons'
questionDefinitions = require '../lib/questions'
{ chartsToDisplay } = require '../lib/config-all'
PieChart = require './pie-chart'

PieChartList = React.createClass
  displayName: 'PieChartList'

  render: ->
    pieCharts = for question, i in questionDefinitions
      continue unless i in chartsToDisplay
      <div className="pie-chart-list-item" key={i}>
        <h5 className="center">{ question.question }</h5>
        <PieChart key={i} question={question} />
      </div>

    <div className="pie-chart-list">
      {pieCharts}
    </div>

module.exports = PieChartList
