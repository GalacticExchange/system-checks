module SystemInfo
  module Check
    class CheckPortOpen < CheckBase

      def name
        'port_open'
      end


      def run_in_session(session)
        self.logs ||= ""

        host = opts['host']
        port = opts['port']


        # do the work
        cmd = "sudo netstat -ntlp | grep :#{port}"
        self.logs << "command: #{cmd}\n"

        self.output, self.stderr_data, self.exit_code, self.exit_signal = session.exec!("#{cmd}")


        lines = output.split /\r\n|\n/


        if self.exit_code.to_i>0 || lines.length==0
          self.status = STATUS_ERROR
        else
          self.status = STATUS_OK
        end

      end


    end
  end
end
