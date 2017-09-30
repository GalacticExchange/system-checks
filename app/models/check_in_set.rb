class CheckInSet < ActiveRecord::Base
  self.table_name = 'checks_by_sets'

  belongs_to :checkset
  belongs_to :check

  def opts
    return @opts unless @opts.nil?

    @opts = JSON.parse(self.opts_data) rescue nil
    @opts = {'data'=>self.opts_data.to_s} if @opts.nil?

    @opts
  end

end
