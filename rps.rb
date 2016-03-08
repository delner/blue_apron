lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blue_apron'
require 'pry'

strategy = BlueApron::Strategies.by_name(ARGV[0]).new
interface = BlueApron::Interfaces::Terminal.new
game = BlueApron::Game.new(interface: interface, strategy: strategy)
game.play