module GoodFoodAwards
  class Application < Sinatra::Base
    get '/' do
      haml :index, locals: { awards: GoodFoodAwards::Year.new('2014').to_hash }
    end
  end
end