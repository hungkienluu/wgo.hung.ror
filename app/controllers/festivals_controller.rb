class FestivalsController < ApplicationController

  # GET /users
  # GET /users.json
  # http://wgo-hung-ror.herokuapp.com/users/insertUser//changed to blooming something heroku
  def index
    @offset, @limit = api_offset_and_limit
    @festivals =  Festival.find :all,
                        :limit  =>  @limit,
                        :offset =>  @offset
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => {:Success => true, :Data => @festivals}, :callback => params[:callback] }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @festival = Festival.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @festival }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @festival = Festival.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @festival }
    end
  end

  # GET /users/1/edit
  def edit
    @festival = Festival.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @festival = Festival.new(params[:festival])

    respond_to do |format|
      if @festival.save
        format.html { redirect_to @festival, notice: 'User was successfully created.' }
        format.json { render json: @festival, status: :created, location: @festival }
      else
        format.html { render action: "new" }
        format.json { render json: @festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @festival = Festival.find(params[:id])

    respond_to do |format|
      if @festival.update_attributes(params[:festival])
        format.html { redirect_to @festival, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # http://localhost:3000/users/destroy/1
  # http://wgo-hung-ror.herokuapp.com/users/destroy/1
  # This URL is used to delete or destroy a particular user
  def destroy
    @festival = Festival.find(params[:id])
    @festival.destroy

    respond_to do |format|
      format.html { redirect_to festivals_url }
      format.json { head :no_content }
    end
  end
end