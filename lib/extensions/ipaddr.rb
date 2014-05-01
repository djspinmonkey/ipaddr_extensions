require 'ipaddr'

class IPAddr
  # Returns the length of the CIDR prefix.  Returns 32 for an individual IP
  # address.
  #
  def prefix_length
    0.upto(31) do |i|
      if @mask_addr[i] == 1
        return 32 - i
      end
    end
    return 0
  end

  # Returns true if this object represents a CIDR block of more than one
  # address, or false if it represents a single IP address.
  #
  def cidr_block?
    prefix_length != 32
  end

  # Returns a string containing the CIDR notation for this address or CIDR
  # block.  (For a single IP address, assumes a CIDR prefix length of 32.)
  #
  def cidr_notation
    "#{self.to_s}/#{self.prefix_length}"
  end
end
