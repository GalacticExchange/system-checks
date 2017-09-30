module SystemInfo
  module Check
    class CheckLogTail < CheckBase

      def name
        'log_tail'
      end


      def run_in_session(session)
        filename = opts['filename']
        n = opts['n'] || 10

        # do the work
        cmd = "sudo tail -n #{n} #{filename}"
        self.output, self.stderr_data, self.exit_code, self.exit_signal = session.exec!("#{cmd}")

        #lines = output.split /\r\n|\n/

        self.status = STATUS_INFO

      end


    end
  end
end
