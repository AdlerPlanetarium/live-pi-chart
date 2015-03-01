# @cjsx React.DOM
React = require 'react/addons'
_ = require 'underscore'
{ questionsRef } = require '../stores/db'
questionDefinitions = require '../lib/questions'

Question = React.createClass
  displayName: 'Question'

  getInitialState: ->
    answered: false
    question: _.find questionDefinitions, (question) => question.slug is @props.params.questionSlug

  handleVote: (i) ->
    @setState answered: true
    questionsRef.child(@props.params.questionSlug).child(i).transaction (currentVotes) ->
      (currentVotes || 0) + 1

    setInterval =>
      @setState answered: false
    , 5000

  render: ->
    optionNodes = for option, i in @state.question.options
      boundVote = @handleVote.bind @, i
      <div className="option" key={i} onClick={boundVote}>
        {option}<br />
        Vote!
      </div>

    displayNodes = if @state.answered
      <h2>Thank you!</h2>
    else
      <h2>{@state.question.question}</h2>
      <div className="options-list">{optionNodes}</div>

    <div className="question">{displayNodes}</div>

module.exports = Question
