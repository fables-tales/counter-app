require "sinatra/base"


class CounterApp < Sinatra::Base
  def initialize
    super
    @counts = Hash.new { |h, k| h[k] = 0 }
  end

  get "/" do
    "hi"
  end

  get "/:key" do
    @counts.fetch(params.fetch("key"), 0).to_s
  end

  post "/:key" do
    @counts[params.fetch("key")] += 1
    ""
  end

  run! if app_file == $0
end

