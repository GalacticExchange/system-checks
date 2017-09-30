module SystemInfo
  module Check
    class CheckBase

      #attr_accessor :session
      attr_accessor :check_info
      attr_accessor :opts
      attr_accessor :status
      attr_accessor :output, :stderr_data, :exit_code, :exit_signal
      attr_accessor :logs

      STATUS_OK = 1
      STATUS_WARNING = 2
      STATUS_ERROR = 3
      STATUS_INFO = 4

      STATUS_TITLES = {STATUS_OK => 'success', STATUS_ERROR =>'danger', STATUS_WARNING=>'warning', STATUS_INFO=>'info'}

      def initialize(_check_info, _opts)
        self.check_info = _check_info

        #self.session = _session

        # opts
        self.opts = _opts

        self.opts.each do |opt_name, v|
          self.opts[opt_name] = eval_option_value(v.to_s)
        end

      end

      def run(_server, _opts={})

      end

      def run_in_session(session, _opts={})

      end

      def status_title
        STATUS_TITLES[self.status]
      end

      def result_to_json
        {status: self.status_title, output: self.output, opts: self.opts, check_name: '', logs: self.logs}
      end


      ### options
      def eval_option_value(s)
        #s = '"server #{opts[\'api_domain\']} "'
        #v = eval s

        # v2
        #s = 'server $api_domain '

        v = s.gsub(/\$[a-z_]+/) do |k|
          name = k.clone
          name[0]=''
          opts[name]
        end

        v
      end

    end
  end
end
