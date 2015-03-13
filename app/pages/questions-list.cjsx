# @cjsx React.DOM
React = require 'react/addons'
{ Link, Navigation } = require 'react-router'

questionsDefinitions = require '../lib/questions'

QuestionsList = React.createClass
  displayName: 'QuestionList'
  mixins: [Navigation]

  render: ->
    questionNodes = questionsDefinitions.map (question, i) ->
      <div className="question" key={i}><Link to="question" params={questionSlug: question.slug}>{question.title}</Link></div>

    <div className="questionsList">
      <h1 className="center"><Link to="question" params={{questionSlug: questionsDefinitions[0].slug}}>Start!</Link></h1>
      <br/><br/><br/>
      {questionNodes}
    </div>

module.exports = QuestionsList
