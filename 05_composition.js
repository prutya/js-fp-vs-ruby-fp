const scream  = str => str.toUpperCase()
const exclaim = str => `${str}!`
const repeat  = str => `${str} ${str}`

const compose = (...fns) => x =>
  fns.reduceRight((acc, fn) => fn(acc), x)

const pipe = (...fns) => x =>
  fns.reduce((acc, fn) => fn(acc), x)

const withExuberance     = compose(repeat, exclaim, scream)
const withExuberancePipe = pipe(scream, exclaim, repeat)

console.log(withExuberance('JS FP is nice'))
console.log(withExuberancePipe('JS FP is nice'))
