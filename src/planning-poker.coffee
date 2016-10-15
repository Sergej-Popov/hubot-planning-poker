module.exports = (robot) ->
  robot.hear /poker vote #(\d+) (\d+)(\s-u .*)?/i, require('./planning-poker-vote')(robot)

  robot.hear /poker result #(\d+)(\s-c)?/i, require('./planning-poker-result')(robot)

  robot.hear /poker clear #(\d+)/i, require('./planning-poker-clear')(robot)

  robot.hear /poker (help|-h)/i, require('./planning-poker-help')(robot)