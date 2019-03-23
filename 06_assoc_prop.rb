# frozen_string_literal: true

scream  = ->(str) { str.upcase }
exclaim = ->(str) { "#{str}!" }
repeat  = ->(str) { "#{str} #{str}" }

compose = ->(*fns) {
  ->(x) {
    fns.reverse_each.reduce(x) { |acc, fn| fn.(acc) }
  }
}

with_exuberance = compose.(repeat, exclaim, scream)
repeat_excitedly = compose.(repeat, exclaim)

str = 'String'

puts with_exuberance.(str)
puts compose.(repeat_excitedly, scream).(str)
