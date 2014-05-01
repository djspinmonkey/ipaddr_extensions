# ipaddr_extensions

Extensions to Ruby's IPAddr class for working with CIDR blocks.

```ruby
require 'extensions/ipaddr'

ip    = IPAddr.new '1.2.3.4'
block = IPAddr.new '1.2.3.0/24'

ip.prefix_length      # -> 32
block.prefix_length   # -> 24

ip.cidr_block?        # -> false
block.cidr_block?     # -> true

ip.cidr_notation      # -> '1.2.3.4/32'
block.cidr_notation   # -> '1.2.3.0/24'
```
