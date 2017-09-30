module SystemInfo
  module Check
    class CheckFileExist < CheckBase

      def name
        'file_exist'
      end


      def run_in_session(session)
        filename = opts['filename'] || opts['data']

        # do the work

        # v1 - use [ -f filename]
        # NOT WORK
=begin
        # [ -f /opt/openresty/nginx/sites-enabled/31.conf ] && echo "found" || echo "not found"
        cmd = "[ -f #{filename} ] && echo \"1\" || echo \"0\" "

        self.output, self.stderr_data, self.exit_code, self.exit_signal = SystemInfo::ChecksLib.ssh_exec!(session, cmd)
        s = self.output.strip

        if self.exit_code.to_i>0 || s=='0'
          self.status = STATUS_ERROR
        else
          self.status = STATUS_OK
        end
=end

        # v2
        cmd = "sudo ls -l #{filename}"
        #cmd = "ls -la "

        self.output, self.stderr_data, self.exit_code, self.exit_signal = SystemInfo::ChecksLib.ssh_exec!(session, cmd)
        output_lines = self.output.split /\n|\r\n/

        if self.exit_code.to_i>0 || output_lines.length==0
          self.status = STATUS_ERROR
        else
          self.status = STATUS_OK
        end

      end


    end
  end
end
