# frozen_string_literal: true

scream  = ->(str) { str.upcase }
exclaim = ->(str) { "#{str}!" }
repeat  = ->(str) { "#{str} #{str}" }

compose = ->(*fns) {
  ->(x) {
    fns.reverse_each.reduce(x) { |acc, fn| fn.(acc) }
  }
}

pipe = ->(*fns) { ->(x) { fns.reduce(x) { |acc, fn| fn.(acc) } } }

with_exuberance_compose = compose.(repeat, exclaim, scream)
with_exuberance_pipe = pipe.(scream, exclaim, repeat)

puts with_exuberance_compose.('Ruby FP is ok')
puts with_exuberance_pipe.('Ruby FP is ok')
