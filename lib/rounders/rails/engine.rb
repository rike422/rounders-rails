module Rounders
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Rounders::Rails
    end
  end
end
