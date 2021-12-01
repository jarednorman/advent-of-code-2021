require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'fileutils'

class AoC
  LOADER = Zeitwerk::Loader.new.tap do |loader|
    loader.push_dir(__dir__)
    loader.inflector.inflect("aoc" => "AoC")
    loader.setup
  end

  def initialize(day, part)
    @day = day
    @part = part
  end

  def run
    puts "\nSolution for day \u001b[36;1m#{day}\u001b[0m part \u001b[36;1m#{part}\u001b[0m: \u001b[33;1m#{klass.new.solution}\u001b[0m\n"
  end

  private

  attr_reader :day, :part

  def klass
    Kernel.const_get const_name
  end

  def const_name
    "AoC::Day#{day}Part#{part}"
  end
end
