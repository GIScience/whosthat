const fs = require('fs')
const split = require('binary-split')

let skipnext = false
fs.createReadStream(process.argv[2])
  .pipe(split('\n'))
  .on('data', line => {
    line.forEach((x, idx) => {
      if (skipnext) return skipnext = false
      if (x === 92 /* \ */) {
        const next = line[idx+1]
        if (next === 39 /* ' */) return process.stdout.write("'")
        if (next === 34 /* " */) return
        if (next === 92 /* \ */) return skipnext = true
      }
      process.stdout.write(Buffer.from([x]))
    })
    process.stdout.write('\n')
  })
