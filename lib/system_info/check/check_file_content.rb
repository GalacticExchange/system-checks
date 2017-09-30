module SystemInfo
  module Check
    class CheckFileContent < CheckBase

      def name
        'file_content'
      end


      def run_in_session(session)
        return nil if opts.nil?
        filename = opts['filename'] || opts['data']
        return nil if filename.nil?

        # do the work
        cmd = "cat #{filename}"
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
