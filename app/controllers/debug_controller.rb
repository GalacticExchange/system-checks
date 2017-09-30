class DebugController < ApplicationController

  def test1

    host = '51.0.12.120'
    ssh_user = 'vagrant'
    ssh_pass = 'vagrant'

    Net::SSH.start(host, ssh_user, :password => ssh_pass) do |ssh|
      # capture all stderr and stdout output from a remote process
      output = ssh.exec!("route")
      puts output

      #
      #s = output.split /\n|\r\n/
      #s.each do |line|
      #  puts "l== #{line}"
      #end

      ### process
      opts = {name: 'sshd'}
      check = SystemInfo::Check::CheckProcess.new(ssh, opts)

      res = check.run

      puts "opts== #{opts.inspect}"
      puts "res== #{res.inspect}"


    end

  end

end
