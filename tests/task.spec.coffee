chai = require 'chai'
chai.should()

Task = require '../src/scripts/task/task'

describe 'Task instance', ->
  task1 = null
  it 'should have a name', ->
    task1 = new Task 'hello world'
    task1.name.should.equal 'hello world'
  it 'should be initially incomplete', ->
    task1.status.should.equal 'incomplete'
  it 'should be able to be completed', ->
    task1.complete().should.be.true
    task1.status.should.equal 'complete'