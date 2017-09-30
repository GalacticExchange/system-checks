module SystemInfo
  module Processes
    class ProcessUtils

      def self.processes_running(session, name)
        #output = session.exec!("pgrep #{name}")
        output = session.exec!("ps aux | grep #{name}")
        pids = output.split /\n|\r\n/

        pids[0...-2]
      end
    end
  end
end

