# Implement String#ipv4_address?, which should return true if given object is an IPv4 address - four numbers (0-255) separated by dots.

# It should only accept addresses in canonical representation, so no leading 0s, spaces etc.

def ipv4?(string)
  !!string.match(/(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/)
end

p ipv4?("255.255.255.255")  # => true
p ipv4?("10.20.030.40")     # => false
p ipv4?("0.0.0.0")          # => true
p ipv4?("127.0.1")          # => false
p ipv4?("127.0.0.1")        # => true
p ipv4?("10.256.30.40")     # => false
p ipv4?("127.0.0.0.1")      # => false