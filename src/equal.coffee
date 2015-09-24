ReturnValue = require 'nanocyte-component-return-value'
moment      = require 'moment'
_           = require 'lodash'

class Equal extends ReturnValue

  isDate: (value) =>
    moment(value).isValid()

  isNumeric: (value) =>
    return false if _.isNaN parseFloat value
    return (value - parseFloat(value) + 1) >= 0

  areEqualDates: (a,b) =>
    moment(a).milliseconds() == moment(b).milliseconds()

  areEqualNumbers: (a,b) =>
    parseFloat(a) == parseFloat(b)

  onEnvelope: (envelope) =>
    {config,message} = envelope
    {left,right} = config
    return message if left == right
    return message if @isNumeric(left) && @isNumeric(right) && @areEqualNumbers(left,right)
    return message if @isDate(left) && @isDate(right) && @areEqualDates(left,right)

module.exports = Equal
