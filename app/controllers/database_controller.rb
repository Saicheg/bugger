class DatabaseController < ApplicationController

  helper_method :database

  def index
    respond_to do |format|
      format.json
      format.html
      format.dat do
        data = Base64.encode64(Rabl::Renderer.json(database, 'database/export', view_path: 'app/views'))
        send_data data, filename: 'database.dat'
      end
    end
  end

  def create
    respond_to do |format|
      format.json do
        create_and_store_database
        render :index
      end
      format.dat do
        database = Database.create!(database_import_params)
        session[:database_id] = database.id
        redirect_to database_index_path
      end
    end
  end

  def update
    database.update_attributes(database_params)
    render :index
  end

  def database
    @database ||= if database_id.blank?
                    create_and_store_database
                  else
                    Database.find(database_id)
                  end
  end

  def create_and_store_database
    database = Database.create
    session[:database_id] = database.id
    database
  end

  def database_id
    session[:database_id]
  end

  def database_params
    params.require(:database).permit(:description, :mariage_date,
                                     husband_attributes: [:id, :first_name, :last_name, :middle_name, :birthday],
                                     wife_attributes: [:id, :first_name, :last_name, :middle_name, :birthday],
                                     children_attributes: [:id, :name, :height, :birthday, :_destroy])

  end

  def database_import_params
    return @database_import_params if @database_import_params
    data = HashWithIndifferentAccess.new(JSON.parse(Base64.decode64(params[:file].read)))
    data[:husband_attributes] ||= {}
    data[:wife_attributes] ||= {}
    data[:children_attributes] ||= []
    @database_import_params = data
    data
  end

end
