class Server < ActiveRecord::Base

  #
  searchable_by_simple_filter

  #
  def opts
    return @opts unless @opts.nil?

    @opts = JSON.parse(self.opts_data) rescue nil
    @opts = {} if @opts.nil?

    @opts
  end
end
