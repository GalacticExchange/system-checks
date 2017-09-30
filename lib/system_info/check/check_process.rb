module SystemInfo
  module Check
    class CheckProcess < CheckBase

      def name
        'process'
      end


      def run_in_session(session)
        return nil if opts.nil?
        name = opts['name'] || opts['data']
        return nil if name.nil?

        # do the work
        pids = SystemInfo::Processes::ProcessUtils.processes_running(session, name)

        if pids.nil? || pids.empty?
          self.status = STATUS_ERROR
        else
          self.status = STATUS_OK
        end

        self.output = pids.join(',')
      end


    end
  end
end
