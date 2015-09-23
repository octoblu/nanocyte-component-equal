ReturnValue = require 'nanocyte-component-return-value'

class Equal extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = Equal
