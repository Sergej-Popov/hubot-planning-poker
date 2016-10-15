# hubot planning poker
Hubot script for poker planning

## Installation

```
npm install hubot-planning-poker --save
```

Add "hubot-planning-poker" to external-scripts.json:

```json
[
  "hubot-planning-poker"
]
```

## Usage

### Vote

Records user vote

**poker vote #\<story_number> \<vote> [-u \<username>]**

```
hubot> poker vote #4264 3
hubot> UserA has voted for story #123
```

### Clear

Deletes user story

**poker result #\<story_number>**

```
hubot> poker clear #4264
```

### Result

Prints all votes and statistics

**poker result #\<story_number>**

```
hubot> poker result #4264
hubot> Result for story #4264
       rob:
       +-----+
       |     |
       |  5  |
       |     |
       +-----+
       
       bob:
       +-----+
       |     |
       |  8  |
       |     |
       +-----+
       
       mob:
       +-----+
       |     |
       |  8  |
       |     |
       +-----+
       
       hob:
       +------+
       |      |
       |  13  |
       |      |
       +------+
       
       avg        min      max
       +=======+  +=====+  +======+
       |       |  |     |  |      |
       |  8.5  |  |  5  |  |  13  |
       |       |  |     |  |      |
       +=======+  +=====+  +======+
       
       stats:
       5 x 1 [rob]
       8 x 2 [bob,mob]
       13 x 1 [hob]
       time since start: 0 min, 34 sec
```