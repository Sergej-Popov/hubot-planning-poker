module.exports = (robot) ->
  return (res) ->

    res.send ''
    res.send 'Hubot script for poker planning'
    res.send ''
    res.send 'poker vote #<story_number> \<vote> [-u \<username>]'
    res.send '  [-u \<username>] allows to override default name. Useful for testing.'
    res.send ''
    res.send 'poker clear #\<story_number>'
    res.send ''
    res.send 'poker result #\<story_number> [-c]'
    res.send '  [-c] pretty prints vote results as cards. Might display incorrectly if font in output is not monospaced'
    res.send ''