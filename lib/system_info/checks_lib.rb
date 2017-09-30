module SystemInfo
  class ChecksLib
    def self.run_all(server, checks, opts={})
      require 'net/ssh'

      res = {}

      # connect

      host = '51.0.12.120'
      ssh_user = 'vagrant'
      ssh_pass = 'vagrant'

      Net::SSH.start(host, ssh_user, :password => ssh_pass) do |ssh|
        checks.each do |check_info|
          name = check_info[:name]

          check = create_check_object(check_info)

          p = check_info[:params]

          s = check.run_in_session(ssh, p)


          res[name] = {check_info: check_info, output: s}
        end

      end

      res
    end

    def self.run_check(_server, check, extra_opts={})
      require 'net/ssh'

      res = {}

      # connect
      if check.server.present? && check.server!=''
        server = Server.where(name: check.server).first
      end

      server ||= _server

      #
      host = server.host

      if host=='localhost'
        ssh_user = 'mmx'
        ssh_pass = 'PH_GEX_PASSWD1'
      else
        ssh_user = 'vagrant'
        ssh_pass = 'vagrant'
      end

      # create check
      opts = check.opts.merge(server.opts).merge(extra_opts)
      check_obj = create_check_object(check, opts)


      # execute check
      res = nil
      Net::SSH.start(host, ssh_user, :password => ssh_pass) do |ssh|
        check_obj.run_in_session(ssh)
        res = check_obj.result_to_json
      end

      res
    end

    def self.ssh_exec!(ssh, command)
      stdout_data = ""
      stderr_data = ""
      exit_code = nil
      exit_signal = nil
      ssh.open_channel do |channel|
        channel.exec(command) do |ch, success|
          unless success
            abort "FAILED: couldn't execute command (ssh.channel.exec)"
          end
          channel.on_data do |ch,data|
            stdout_data+=data
          end

          channel.on_extended_data do |ch,type,data|
            stderr_data+=data
          end

          channel.on_request("exit-status") do |ch,data|
            exit_code = data.read_long
          end

          channel.on_request("exit-signal") do |ch, data|
            exit_signal = data.read_long
          end
        end
      end
      ssh.loop
      [stdout_data, stderr_data, exit_code, exit_signal]
    end


    def self.create_check_object(check_info, opts)
      cls = class_for_type(check_info.type_name)
      check = cls.new(check_info, opts)

      check
    end


    def self.class_for_type(type_name)
      "SystemInfo::Check::Check#{type_name.camelize}".constantize
    end


  end
end
