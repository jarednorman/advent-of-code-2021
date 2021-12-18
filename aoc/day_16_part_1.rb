class AoC::Day16Part1
  HEX_MAP = {
    "0" => %w(0 0 0 0),
    "1" => %w(0 0 0 1),
    "2" => %w(0 0 1 0),
    "3" => %w(0 0 1 1),
    "4" => %w(0 1 0 0),
    "5" => %w(0 1 0 1),
    "6" => %w(0 1 1 0),
    "7" => %w(0 1 1 1),
    "8" => %w(1 0 0 0),
    "9" => %w(1 0 0 1),
    "A" => %w(1 0 1 0),
    "B" => %w(1 0 1 1),
    "C" => %w(1 1 0 0),
    "D" => %w(1 1 0 1),
    "E" => %w(1 1 1 0),
    "F" => %w(1 1 1 1)
  }
  class Packet
    def initialize
      self.subpackets = []
    end

    attr_accessor(
      :type,
      :version,
      :length_type_id,
      :length,
      :subpacket_count,
      :subpackets,
      :value
    )

    def version_sum
      version + subpackets.sum(&:version_sum)
    end

    def evaluate
      case type
      when 0 # sum
        subpackets.sum(&:evaluate)
      when 1 # product
        subpackets.map(&:evaluate).inject(:*)
      when 2 # minimum
        subpackets.map(&:evaluate).min
      when 3 # maximum
        subpackets.map(&:evaluate).max
      when 4 # literal
        value
      when 5 # greater than
        if subpackets.first.evaluate > subpackets.last.evaluate
          1
        else
          0
        end
      when 6 # less than
        if subpackets.first.evaluate < subpackets.last.evaluate
          1
        else
          0
        end
      when 7 # equal to
        if subpackets.first.evaluate == subpackets.last.evaluate
          1
        else
          0
        end
      end
    end
  end

  def initialize(input = File.read("data/day16.txt"))
    @binary = input.split('').flat_map { |c| HEX_MAP[c] }
  end

  def solution
    parse_packet(@binary).version_sum
  end

  private

  def parse_packet(packet_data)
    Packet.new.tap do |packet|
      binding.pry if packet_data.nil?
      packet.version = packet_data.shift(3).join.to_i(2)
      packet.type = packet_data.shift(3).join.to_i(2)

      if packet.type != 4
        packet.length_type_id = packet_data.shift.to_i(2)

        if packet.length_type_id == 0
          packet.length = packet_data.shift(15).join.to_i(2)

          subpacket_data = packet_data.shift(packet.length)

          until subpacket_data.empty?
            packet.subpackets << parse_packet(subpacket_data)
          end
        else
          packet.subpacket_count = packet_data.shift(11).join.to_i(2)

          until packet.subpackets.count == packet.subpacket_count
            packet.subpackets << parse_packet(packet_data)
          end
        end
      else
        value = []

        loop do
          check, *chunk = packet_data.shift(5)
          value += chunk

          break if check == "0"
        end

        packet.value = value.join.to_i(2)
      end
    end
  end
end
