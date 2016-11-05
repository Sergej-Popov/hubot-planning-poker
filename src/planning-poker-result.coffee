module.exports = (robot) ->
  return (res) ->
    story = res.match[1]
    showCards = res.match[2]
    poker = robot.brain.get("poker-#{story}")
    if !poker
      res.send "Story ##{story} not found ¯\\_(ツ)_/¯"
      return

    poker.end = new Date
    result = "```\n"

    result += "Result for story ##{story}\n"

    sum = 0

    for user of poker.votes
      voteLength = poker.votes[user].toString().length
      sum += poker.votes[user]

      if showCards
        result +=("#{user}:\n" +
            "+--#{'-'.repeat voteLength}--+\n" +
            "|  #{poker.votes[user]}  |\n" +
            "+--#{'-'.repeat voteLength}--+\n")

    avg = Math.round(sum / Object.keys(poker.votes).length * 100) / 100;
    avgLength = avg.toString().length

    all = Object.keys(poker.votes).map((v) => poker.votes[v])

    min = Math.min(all...);
    minLength = min.toString().length

    max = Math.max(all...);
    maxLength = max.toString().length

    if showCards
      result +=("avg#{' '.repeat avgLength}     " + "min#{' '.repeat minLength}     " + "max#{' '.repeat minLength}\n" +
          "+==#{'='.repeat avgLength}==+  " + "+==#{'='.repeat minLength}==+  " + "+==#{'='.repeat maxLength}==+\n" +
          "|  #{avg}  |  " + "|  #{min}  |  " + "|  #{max}  |\n" +
          "+==#{'='.repeat avgLength}==+  " + "+==#{'='.repeat minLength}==+  " + "+==#{'='.repeat maxLength}==+\n")
    else
      result +=("avg: #{avg}; min: #{min}; max: #{max};\n")


    stats = {}

    Object.keys(poker.votes).forEach (v) ->
      key = poker.votes[v].toString()

      if !stats[key]
        stats[key] = []

      stats[key].push v
      return

    result += 'stats:\n'
    for stat of stats
      result += "#{stat} x #{stats[stat].length} [#{stats[stat]}]\n"

    timeDiff = poker.end - poker.start;
    result += "time since start: #{Math.floor(timeDiff / 60000)} min, #{Math.floor(timeDiff % 60000 / 1000)} sec\n"
    result += "\n```"

    res.send(result)