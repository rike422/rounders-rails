require 'rounders'
require 'rounders/rails/engine'

module Rounders
  module Rails
    mattr_accessor :daemon_name

    self.daemon_name = 'rounders_daemon'

    class << self

      def ensure_rails_env
        raise 'please specify RAILS_ENV on the command line' if ::Rails.env.blank?
      end

      def start!
        r = Rounders::Rounder.new
        r.start
      end
    end
  end
end
