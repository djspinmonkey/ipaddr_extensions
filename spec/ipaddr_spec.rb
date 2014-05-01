require 'spec_helper'

describe IPAddr do
  let(:ip)    { IPAddr.new '1.2.3.4' }
  let(:block) { IPAddr.new '1.2.3.0/24' }

  describe '#prefix_length' do
    context 'on a CIDR block' do
      it 'returns the CIDR prefix length of the block' do
        block.prefix_length.should eq 24
      end
    end

    context 'on an individual IP address' do
      it 'returns 32' do
        ip.prefix_length.should eq 32
      end
    end
  end

  describe '#cidr_block?' do
    context 'on a CIDR block' do
      subject { block.cidr_block? }
      it { should be_true }
    end

    context 'on an individual IP address' do
      subject { ip.cidr_block? }
      it { should be_false }
    end
  end

  describe '#cidr_notation' do
    it 'returns the cidr notation' do
      block.cidr_notation.should eq '1.2.3.0/24'
      ip.cidr_notation.should eq '1.2.3.4/32'
    end
  end
end
