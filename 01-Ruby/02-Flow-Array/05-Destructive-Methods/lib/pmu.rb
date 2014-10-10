def pmu_format!(race_array)
  # TODO: modify the given array so that it is PMU-consistent. This method should return nil.
  array = race_array.reverse!
  array.map! do |x|
    "#{array.length - array.index(x)}-#{x}!"
  end
end





