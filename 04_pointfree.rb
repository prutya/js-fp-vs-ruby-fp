# frozen_string_literal: true

map = ->(cb) { ->(arr) { arr.map(&cb) } }
double = ->(x) { x * 2 }

array = [1, 2, 3, 4, 5]

puts map.(double).(array)
