class Admin::ChecksetsController < Admin::MyAdminBaseController
  #autocomplete :server, :name, :full => true

  # search
  search_filter :index, {save_session: true, search_method: :post_and_redirect, url: :admin_checksets_url, search_url: :search_admin_checksets_url , search_action: :search} do
    default_order "id", 'desc'

    # fields
    field :name, :string, :text, {label: 'name', default_value: '', condition: :like_full, input_html: {style: "width: 240px"}}
  end

  def model
    Checkset
  end

  def index
    @items = model.by_filter(@filter)

  end


  def show
    @item = model.find(params[:id])
  end


  def new
    @item = model.new
  end

  def edit
    @item = model.find(params[:id])
  end


  def create
    # input
    @option = Option.new(item_params)

    @res = @option.save

    respond_to do |format|
      if @res

        format.html {
          #redirect_to @user, notice: 'User was successfully created.'
          redirect_to admin_options_path, notice: 'Congratulations! You just create option!'
        }

      else
        format.html {
          render :new
        }

      end
    end
  end

  def update
    @id = params[:id]

    @item = model.find(@id)

    @res = @item.update(item_params)

    respond_to do |format|
      if @res
        format.html {
          redirect_to edit_admin_checkset_path(@item), notice: 'Saved'
        }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def item_params
    params.require(:checkset).permit(
        :description, :title,
        check_in_sets_attributes: [:id, :name, :title, :type_name, :server, :opts_data, :_destroy])
    #params.require(:project).permit(:name, :description, tasks_attributes: [:id, :description, :done, :_destroy])
  end
end
