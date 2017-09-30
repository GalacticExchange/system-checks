module SystemInfo
  module Check
    class CheckRemotePortOpen < CheckBase

      def name
        'remote_port_open'
      end


      def run_in_session(session)
        self.logs ||= ""

        host = opts['host']
        port = opts['port'] || opts['data']


        # do the work
        #host = 'proxy.gex'
        #port = '5121'

        cmd = "nc -z #{host} #{port}"
        self.logs << "command: #{cmd}\n"
        self.output, self.stderr_data, self.exit_code, self.exit_signal = SystemInfo::ChecksLib.ssh_exec!(session, cmd)

        if self.exit_code.to_i>0
          self.status = STATUS_ERROR
        else
          self.status = STATUS_OK
        end

      end


    end
  end
end
