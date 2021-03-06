React = require 'react/addons'
nv = window.nv
{ questionsRef } = require '../stores/db'

module.exports = React.createClass
  displayName: 'PieChart'

  getInitialState: ->
    results = []

    for option in @props.question.options
      results.push {
        label: option,
        value: 0
      }

    chart: null
    results: results

  componentDidMount: ->
    nv.addGraph =>
      chart = nv.models.pieChart()
        .x((d) -> return d.label)
        .y((d) -> return d.value)
        .showLabels(true)

      @setState chart: chart, =>
        questionsRef.child(@props.question.slug).on 'child_added', @handleUpdate
        questionsRef.child(@props.question.slug).on 'child_changed', @handleUpdate

  componentWillUnmount: ->
    questionsRef.child(@props.question.slug).off 'child_added', @handleUpdate
    questionsRef.child(@props.question.slug).off 'child_changed', @handleUpdate

  draw: ->
    d3.select("##{@props.question.slug} svg")
      .datum(@state.results)
      .transition()
      .duration(350)
      .call(@state.chart)

  handleUpdate: (snapshot) ->
    return unless @state.chart

    index = snapshot.name()
    votes = snapshot.val()
    @state.results[index].value = votes

    @draw()

  render: ->
    <div className="pie-chart">
      <div id={@props.question.slug}><svg></svg></div>
    </div>
