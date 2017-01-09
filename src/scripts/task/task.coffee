class Task
  constructor: (@name) ->
    @status = 'incomplete'

  complete: ->
    @status = 'complete'
    true
module.exports = Task