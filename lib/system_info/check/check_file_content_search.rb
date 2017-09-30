module SystemInfo
  module Check
    class CheckFileContentSearch < CheckBase

      def run_in_session(session)
        return nil if opts.nil?
        filename = opts['filename'] || opts['data']
        return nil if filename.nil?

        #
        line = opts['line'] || []

        # do the work
        # search line
        #line.gsub! /\\/, '\\\\'
        #line.gsub!('\\') { '\\\\' }
        cmd = "cat #{filename} | grep \""+line+'"'
        #cmd = "cat #{filename} | grep \"server_name \\w+"+'"'

        self.output, self.stderr_data, self.exit_code, self.exit_signal = session.exec!("#{cmd}")

        output_lines = output.split /\n|\r\n/

        if self.exit_code.to_i>0 || output_lines.length==0
          self.status = STATUS_ERROR
        else
          self.status = STATUS_OK
        end

      end

    end

  end
end
