# Description:
#   Hubot script for poker planning
#
# Configuration:
#   None
#
# Commands:
#   poker vote #<story_number> \<vote> [-u \<username>]\n - vote for story;[-u \<username> - override username]
#   poker clear #\<story_number> - clear votes
#   poker result #\<story_number> [-c] - print results; [-c - pretty prints with ASCII cards]
#   poker help - print help
#
# Author:
# Sergej Popov <sergejpopov@outlook.com>

module.exports = (robot) ->
  robot.hear /poker vote #(\d+) (\d+)(\s-u .*)?/i, require('./planning-poker-vote')(robot)

  robot.hear /poker result #(\d+)(\s-c)?/i, require('./planning-poker-result')(robot)

  robot.hear /poker clear #(\d+)/i, require('./planning-poker-clear')(robot)

  robot.hear /poker (help|-h)/i, require('./planning-poker-help')(robot)