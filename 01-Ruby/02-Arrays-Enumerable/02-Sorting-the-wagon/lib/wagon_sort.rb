def wagon_sort(students)
  # TODO: return (not print!) a copy of students, sorted alphabetically
  students.sort_by { |n| [n.downcase, n] }
end