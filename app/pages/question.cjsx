# @cjsx React.DOM
React = require 'react/addons'
Router = require 'react-router'
_ = require 'underscore'
{ Navigation } = require 'react-router'
{ questionsRef } = require '../stores/db'
questionDefinitions = require '../lib/questions'

Question = React.createClass
  displayName: 'Question'
  mixins: [Navigation, Router.State]

  getInitialState: ->
    @getQuestionToDisplay()

  componentWillReceiveProps: ->
    @setState @getQuestionToDisplay()

  getQuestionToDisplay: ->
    index = 0
    return {
      question: _.find questionDefinitions, (question, i) => 
        index = i
        question.slug is @getParams().questionSlug
      index: index
      answered: false
    }

  handleVote: (i) ->
    @setState answered: true
    questionsRef.child(@getParams().questionSlug).child(i).transaction (currentVotes) ->
      (currentVotes || 0) + 1

    setTimeout =>
      # Next question
      if @state.index + 1 >= questionDefinitions.length
        @transitionTo 'app'
      else
        @transitionTo 'question', { questionSlug: questionDefinitions[@state.index + 1].slug}
    , 1500

  render: ->
    optionNodes = for option, i in @state.question.options
      boundVote = @handleVote.bind @, i
      <div className="option" key={i} onClick={boundVote}>
        {option}<br />
        <button className="vote">Vote!</button>
      </div>

    displayNodes = if @state.answered
      <h2>Thank you!</h2>
    else
      <div className="question-container">
        <h2>{@state.index + 1}. {@state.question.question}</h2>
        <div className="options-list">{optionNodes}</div>
      </div>

    <div className="question">{displayNodes}</div>

module.exports = Question
