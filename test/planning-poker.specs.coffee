chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'poker vote', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/planning-poker')(@robot)

  it 'registers a hear listener for vote', ->
    expect(@robot.hear).to.have.been.calledWith(/poker vote #(\d+) (\d+)(\s-u .*)?/i)

  it 'registers a hear listener for result', ->
    expect(@robot.hear).to.have.been.calledWith(/poker result #(\d+)/i)

  it 'registers a hear listener for clear', ->
    expect(@robot.hear).to.have.been.calledWith(/poker clear #(\d+)/i)
