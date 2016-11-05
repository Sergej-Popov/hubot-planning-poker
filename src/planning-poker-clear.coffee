module.exports = (robot) ->
  return (res) ->
    story = res.match[1]
    poker = robot.brain.remove("poker-#{story}")
    res.send "Story ##{story} cleared"