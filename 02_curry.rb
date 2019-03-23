add = ->(x) { ->(y) { x + y } }

add_3 = add.(3)

puts add_3.(5)
puts add_3.(10)
puts add_3.(12)
