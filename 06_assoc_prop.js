const { compose, scream, exclaim, repeat } = require('./shared')

const withExuberance = compose(repeat, exclaim, scream)

const repeatExcitedly = compose(repeat, exclaim)

const str = 'String'

console.log(withExuberance(str))
console.log(compose(repeatExcitedly, scream)(str))
