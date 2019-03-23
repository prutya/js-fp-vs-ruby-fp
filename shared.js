const scream  = str => str.toUpperCase()
const exclaim = str => `${str}!`
const repeat  = str => `${str} ${str}`

const compose = (...fns) => x =>
  fns.reduceRight((acc, fn) => fn(acc), x)

const pipe = (...fns) => x =>
  fns.reduce((acc, fn) => fn(acc), x)

module.exports = {
  scream,
  exclaim,
  repeat,
  compose,
  pipe
}
