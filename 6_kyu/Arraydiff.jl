function arraydiff(a, b)
  filter(it -> it ∉ b, a)
end