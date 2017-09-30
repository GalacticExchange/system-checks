class Admin::RunnerController < Admin::MyAdminBaseController

  def index


  end


  def run
    # input
    @set_id = (params[:checkset_id] || params[:check][:checkset_id] rescue nil)
    @server_id = params[:server_id] || params[:check][:server_id]
    @extra_opts = (params[:check][:extra_opts] rescue nil)

    #
    @server = Server.find(@server_id)

    @checkset = Checkset.where(id: @set_id).first
    @checks = @checkset.check_in_sets

    # opts
    @extra_opts ||= (session[:extra_opts] || '{}')
    session[:extra_opts] = @extra_opts

    #
    @sets_all = Checkset.all

    #
    @check_results = []

  end

  def get_info
    # input
    @check_id = params[:check_id]
    @server_id = params[:server_id]

    @checkset_name = params[:checkset_name]
    @server_name = params[:server_name]


    # data
    @server = Server.where(id: @server_id).first || Server.where(name: @server_name).first
    @check_info = CheckInSet.where(id: @check_id).first || Checkset.where(name: @checkset_name).first


    #
    @s_extra_opts = session[:extra_opts] || "{}"
    @extra_opts = (JSON.parse(@s_extra_opts) rescue nil)
    @extra_opts ||= {}



    # run
    @check_result = SystemInfo::ChecksLib.run_check(@server, @check_info, @extra_opts)
    # success, info, warning, danger

    respond_to do |format|
      format.html{}
      format.json {
        render :json => @check_result
      }
    end



  end


  def update_check_server
    # input
    @set_id = (params[:check][:checkset_id] rescue nil)
    @server_id = params[:server_id] || params[:check][:server_id]
    @extra_opts = (params[:check][:extra_opts] rescue nil)

    #
    @server = Server.find(@server_id)

    @checkset = Checkset.where(id: @set_id).first
    @checks = @checkset.check_in_sets

    # opts
    @extra_opts ||= (session[:extra_opts] || '{}')
    session[:extra_opts] = @extra_opts

    # redirect
    redirect_to checks_path(:server_id=>@server.id, :checkset_id=>@checkset.id)
  end


  ### set checks params and redirect to show checks
  def set
    # input
    @checkset_name = params[:checkset_name]
    @server_name = params[:server_name]
    @extra_opts_url = params[:extra_opts_url]

    #
    @server = Server.where(name: @server_name).first
    @checkset = Checkset.where(name: @checkset_name).first

    # opts
    @extra_opts = params[:extra_opts]
    if @extra_opts.nil? && @extra_opts_url.present? && @extra_opts_url!=''
      # get from url
      resp_data = SystemInfo::ApiService.api_do_request(@extra_opts_url, :get, {})

      if resp_data.present?
        @extra_opts = resp_data['data']
      end


      #resp_data = JSON.parse(@extra_opts)
      #if resp_data.has_key?('res')
      #  @extra_opts = resp_data['data']
      #else
      #  @extra_opts = resp_data
      #end
    end

    session[:extra_opts] = @extra_opts



    respond_to do |format|
      format.html{
        redirect_to checks_url(server_id: @server.id, checkset_id: @checkset.id)
      }
      format.json {
        render :json => {res: 1}
      }
    end


  end
end
