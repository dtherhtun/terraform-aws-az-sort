locals {
  alphabetize = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
  sorted = flatten(
    [
      for i in range(length(var.subnet_data)) :
      [
        for data in var.subnet_data :
        data.id if data.availability_zone == format("%s%s", var.region, local.alphabetize[i])
      ]
    ]
  )
}
