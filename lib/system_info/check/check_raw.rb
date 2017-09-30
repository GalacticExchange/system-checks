module SystemInfo
  module Check
    class CheckRaw < CheckBase

      def name
        'raw'
      end


      def run_in_session(session)
        cmd = opts['cmd'] || opts['data']

        # do the work
        self.output = session.exec!("#{cmd}")
        self.status = STATUS_INFO

        #
        #self.output, self.stderr_data, self.exit_code, self.exit_signal = session.exec!("#{cmd}")

        #if self.exit_code.to_i>0
        #  self.status = STATUS_INFO
        #else
        #  self.status = STATUS_OK
        #end
      end


    end
  end
end
