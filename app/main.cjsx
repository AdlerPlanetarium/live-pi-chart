React = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, DefaultRoute, Link, Navigation } = require 'react-router'
_ = require 'underscore'

Question = require './pages/question'
QuestionsList = require './pages/questions-list'
PieChartList = require './components/pie-chart-list'

App = React.createClass
  displayName: 'App'
  mixins: [Navigation]

  render: ->
    <div className="app">
      <div className="app-container">
        <RouteHandler {...this.props} />
      </div>
    </div>

Home = React.createClass
  displayname: 'Home'

  render: ->
    <div className="home">
      <PieChartList />
      <p className="center"><Link to="questions">Question List</Link></p>
    </div>

routes =
  <Route name="app" path="/" handler={ App }>
    <Route name="questions" path="questions" handler={ QuestionsList } />
    <Route name="question" path="questions/:questionSlug" handler={ Question } />
    <DefaultRoute handler={ Home } />
  </Route>

Router.run routes, (Handler) ->
  React.render <Handler />, document.body
window.React = React
