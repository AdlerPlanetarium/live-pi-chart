React = require 'react'
Router = { Route, RouteHandler, DefaultRoute, Link, Navigation } = require 'react-router'

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
    <Route name="questions" path="questions" handler={ require './pages/questions-list' } />
    <Route name="question" path="questions/:questionSlug" handler={ require './pages/question' } />
    <DefaultRoute handler={ Home } />
  </Route>

Router.run routes, (Handler) ->
  React.render <Handler />, document.body
