# frozen_string_literal: true

compose = ->(*fns) {
  ->(x) {
    fns.reverse_each.reduce(x, &->(acc, fn) { fn.(acc) })
  }
}

split    = ->(char) { ->(str) { str.split(char) } }
downcase = ->(str) { str.downcase }
map      = ->(cb) { ->(array) { array.map(&cb) } }
join     = ->(char) { ->(array) { array.join(char) } }

trace = ->(msg) {
  ->(x) {
    puts "#{msg} #{x}"
    x
  }
}

slugify = map.(
  compose.(
    trace.('after join'),
    join.('-'),
    trace.('before join'),
    split.(' '),
    trace.('before split'),
    downcase,
    trace.('before lowercase')
  )
)

book_titles = [
  'Computer Networks',
  'The Stars My Destination',
  'Seven Eves'
]

puts slugify.(book_titles)
