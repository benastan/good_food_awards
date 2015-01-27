require 'bundler'
Bundler.require
require 'pry'

describe GoodFoodAwards do
  subject { GoodFoodAwards::Year.new('2014') }

  specify do
    binding.pry
  end
end
