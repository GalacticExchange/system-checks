class Admin::ServersController < Admin::MyAdminBaseController
  autocomplete :server, :name, :full => true

# search
  search_filter :index, {save_session: true, search_method: :post_and_redirect, url: :admin_servers_url, search_url: :search_admin_servers_url , search_action: :search} do
    default_order "id", 'desc'

    # fields
    field :name, :string, :text, {label: 'name', default_value: '', condition: :like_full, input_html: {style: "width: 240px"}}
  end

  def model
    Server
  end

  def show
    id = params[:id]
    if id.nil?
      raise 'Bad input'
    end
    @team = model.find id
  end

  def index
    @items = model.by_filter(@filter)

  end

end
