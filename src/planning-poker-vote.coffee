module.exports = (robot) ->
  return (res) ->
    story = res.match[1]
    vote = parseInt res.match[2]
    user = (res.match[3] or " -u #{res.message.user.name}").substr 4
    poker = robot.brain.get("poker-#{story}")

    if poker == null
      poker =
        votes: []
        start: new Date

    poker.votes[user] = vote
    robot.brain.set "poker-#{story}", poker

    res.send "#{user} has voted for story ##{story}"
