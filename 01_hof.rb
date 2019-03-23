# frozen_string_literal: true

with_count = ->(fn) {
  count = 0

  ->(*args) {
    puts "Call count: #{count += 1}"
    fn.(*args)
  }
}

add = ->(x, y) { x + y }

counted_add = with_count.(add)

puts counted_add.(1, 2)
puts counted_add.(2, 3)
puts counted_add.(10, 2)
