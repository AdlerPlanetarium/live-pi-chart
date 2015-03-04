# @cjsx React.DOM
React = require 'react'
{ Routes, Route, DefaultRoute, Link, Navigation } = require 'react-router'
_ = require 'underscore'

Question = require './pages/question'
QuestionsList = require './pages/questions-list'
PieChartList = require './components/pie-chart-list'

{ ref } = require './stores/db'

App = React.createClass
  displayName: 'App'
  mixins: [Navigation]

  render: ->
    <div className="app">
      <h1 className="center">Pi Day!</h1>

      <div className="app-container">
        <@props.activeRouteHandler/>
      </div>
    </div>

Home = React.createClass
  displayname: 'Home'

  render: ->
    <div className="home">
      <PieChartList />
      <p className="center"><Link to="questions">Question List</Link></p>
    </div>

Router =
  <Routes>
    <Route name="app" path="/" handler={ App }>
      <Route name="questions" handler={ QuestionsList } />
      <Route name="question" path="questions/:questionSlug" handler={ Question } />
      <DefaultRoute handler={ Home } />
    </Route>
  </Routes>

React.renderComponent Router, document.body
window.React = React
