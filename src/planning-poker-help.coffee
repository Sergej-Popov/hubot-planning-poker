module.exports = (robot) ->
  return (res) ->
    res.send '```' +
        'Hubot script for poker planning\n\n' +
        'poker vote #<story_number> \<vote> [-u \<username>]\n' +
        '  [-u \<username>] allows to override default name. Useful for testing.\n\n' +
        'poker clear #\<story_number>\n\n' +
        'poker result #\<story_number> [-c]\n' +
        '  [-c] pretty prints vote results as cards. Might display incorrectly if font in output is not monospaced' +
        '```'
