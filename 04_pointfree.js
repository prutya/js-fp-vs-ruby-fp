const map = cb => array => array.map(cb)
const double = x => x * 2

const array = [1, 2, 3]
console.log(map(double)(array))
