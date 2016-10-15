# hubot planning poker
Hubot script for poker planning

## Install

```
npm install hubot-planning-poker --save
```

Add "hubot-planning-poker" to external-scripts.json:

```json
[
  "hubot-planning-poker"
]
```

## Use

### Vote

**poker vote #\<story_number> \<vote> [-u \<username>]**

```
hubot> poker vote #123 3
hubot> UserA has voted for story #123
```

### Result

**poker result #\<story_number>**

```
hubot> poker result #123
hubot> Result for story #123
John:
+-----+
|     |
|  1  |
|     |
+-----+

average:
+=====+
|     |
|  1  |
|     |
+=====+

time since start: 2 min, 58 sec
```