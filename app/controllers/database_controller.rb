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
    create_and_store_database
    render :index
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

end
