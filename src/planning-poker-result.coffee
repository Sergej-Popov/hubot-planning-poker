module.exports = (robot) ->
  return (res) ->

    story = res.match[1]
    poker = robot.brain.get("poker-#{story}")
    if !poker
      res.send 'Story not found'
      return

    poker.end = new Date

    res.send "Result for story ##{story}"

    sum = 0

    for user of poker.votes
      voteLength = poker.votes[user].toString().length
      sum += poker.votes[user]

      res.send("#{user}:\n" +
          "+--#{'-'.repeat voteLength}--+\n" +
          "|  #{' '.repeat voteLength}  |\n" +
          "|  #{poker.votes[user]}  |\n" +
          "|  #{' '.repeat voteLength}  |\n" +
          "+--#{'-'.repeat voteLength}--+\n")

    avg = Math.round(sum / Object.keys(poker.votes).length * 100) / 100;
    avgLength = avg.toString().length

    res.send('average:\n' +
        "+==#{'='.repeat avgLength}==+\n" +
        "|  #{' '.repeat avgLength}  |\n" +
        "|  #{avg}  |\n" +
        "|  #{' '.repeat avgLength}  |\n" +
        "+==#{'='.repeat avgLength}==+\n")

    timeDiff = poker.end - poker.start;
    res.send "time since start: #{Math.floor(timeDiff/60000)} min, #{Math.floor(timeDiff%60000/1000)} sec"