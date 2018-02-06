require 'daemons'

PID_FILE = 'tmp/rounders.pid'.freeze

namespace :rounders do
  rounders_task = %i[start stop restart status]
  rounders_task.each do |task_name|
    if task_name == :status
      desc 'Check the status of the Rounders service'
    else
      desc "#{task_name.to_s.camelize} the Rounders service"
    end
    task task_name do
      Daemons.run_proc(Rounders::Rails.daemon_name, ARGV: [task_name.to_s], dir: 'tmp/pids', dir_mode: :normal) do
        $stderr.reopen("#{Rails.root}/log/#{Rounders::Rails.daemon_name}.stderr.log", 'w')
        $stdout.reopen("#{Rails.root}/log/#{Rounders::Rails.daemon_name}.stdout.log", 'w')
        chdir Rails.root.to_s
        Rake::Task['rounders'].invoke
      end
    end
  end
end

task rounders: :environment do
  Rounders::Application.config.logger = Logger.new("#{Rails.root}/log/rounders.#{Rails.env}.log")
  Rounders::Rails.start!
end
