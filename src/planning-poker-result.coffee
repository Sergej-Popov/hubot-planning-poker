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

    all = Object.keys(poker.votes).map((v) => poker.votes[v])
    res.send all
    min = Math.min(all...);
    minLength = min.toString().length

    max = Math.max(all...);
    maxLength = max.toString().length

    res.send("avg#{' '.repeat avgLength}     " + "min#{' '.repeat minLength}     " + "max#{' '.repeat minLength}\n" +
             "+==#{'='.repeat avgLength}==+  " + "+==#{'='.repeat minLength}==+  " + "+==#{'='.repeat maxLength}==+\n" +
             "|  #{' '.repeat avgLength}  |  " + "|  #{' '.repeat minLength}  |  " + "|  #{' '.repeat maxLength}  |\n" +
             "|  #{avg}  |  "                  + "|  #{min}  |  "                  + "|  #{max}  |\n"                  +
             "|  #{' '.repeat avgLength}  |  " + "|  #{' '.repeat minLength}  |  " + "|  #{' '.repeat maxLength}  |\n" +
             "+==#{'='.repeat avgLength}==+  " + "+==#{'='.repeat minLength}==+  " + "+==#{'='.repeat maxLength}==+\n")

    stats = {}

    Object.keys(poker.votes).forEach (v) ->
      key = poker.votes[v].toString()

      if !stats[key]
        stats[key] = []

      stats[key].push v
      return

    res.send 'stats:'
    for stat of stats
      res.send "#{stat} x #{stats[stat].length} [#{stats[stat]}]"

    timeDiff = poker.end - poker.start;
    res.send "time since start: #{Math.floor(timeDiff/60000)} min, #{Math.floor(timeDiff%60000/1000)} sec"