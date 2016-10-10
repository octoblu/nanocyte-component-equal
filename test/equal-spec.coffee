ReturnValue = require 'nanocyte-component-return-value'
Equal = require '../src/equal'

describe 'Equal', ->
  beforeEach ->
    @sut = new Equal

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an equal left and right', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 2, right: 2}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'

    describe 'when called with an unequal left and right', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 1, right: 2}, message: 'anything'

      it 'should nothing', ->
        expect(@result).not.to.exist

    describe 'when left and right are gregorically equal', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: 'Jan 1, 2012', right: '2012-01-01'}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'

    describe 'when left and right are numerically equal', ->
      beforeEach ->
        @result = @sut.onEnvelope config: {left: '1', right: '1.0'}, message: 'anything'

      it 'should return the message', ->
        expect(@result).to.deep.equal 'anything'


    describe 'when left and right are objectorially equal', ->
        beforeEach ->
          @result = @sut.onEnvelope config: {left: {name: 'Aaron', height: '5 feet tall'}, right: { name: 'Aaron', height: '5 feet tall'}}, message: 'anything'

        it 'should return the message', ->
          expect(@result).to.deep.equal 'anything'

      describe 'when left and right are objectorially nonequal', ->
        beforeEach ->
          @result = @sut.onEnvelope config: {left: {name: 'Aaron', height: '11 feet tall'}, right: { name: 'Aaron', height: '5 feet tall'}}, message: 'anything'

        it 'should not return the message', ->
          expect(@result).not.to.exist
