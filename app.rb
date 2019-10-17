require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

require 'app/board'
require 'app/game'
require 'app/boardcase'
require 'app/player'
require 'app/application'

Application.new.perform