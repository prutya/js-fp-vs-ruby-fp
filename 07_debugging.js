const { compose } = require('./shared')

const split = char => str =>
  str.split(char)

const lowerCase = str =>
  str.toLowerCase()

const map = cb => array =>
  array.map(cb)

const join = char => array =>
  array.join(char)

const trace = msg => x => (console.log(msg, x), x)

// const slugify = array =>
//   array.map(str => str.toLowerCase().split(' ').join('-'))

const slugify = map(
  compose(
    trace('after join'),
    join('-'),
    trace('before join'),
    split(' '),
    trace('before split'),
    lowerCase,
    trace('before lowercase')
  )
)

const bookTitles = [
  'Computer Networks',
  'The Stars My Destination',
  'Seven Eves'
]



console.log(slugify(bookTitles))
