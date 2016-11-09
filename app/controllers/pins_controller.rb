class PinsController < ApplicationController
  load_and_authorize_resource
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :getbycategory]
  respond_to :js

  # GET /pins
  # GET /pins.json
  def index
    @pins = Pin.all.order("created_at desc")
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  # GET /pins/new
  def new
    @pin = Pin.new
    @formToshow = "newform"
    @formTohide = "pinform"
  end

  # POST /pin/getinfo
  def getinfo
    @pin = Pin.new
    @formToshow = "pinform"
    @formTohide = "newform"
    # begin
      @pin.pin_url = params[:pin_url];
      @pin.category_id = params[:category_id]
      @pin.board_id = params[:board_id]
      remotePin = MetaInspector.new(params[:pin_url],download_images: false)
      @pin.description = remotePin.meta['description']
      @pin.remote_image_url = remotePin.meta['og:image']
      @pin.title = remotePin.best_title
      @pin.host = remotePin.host
      case remotePin.host
      when "www.instagram.com"
        instClient = InstaApi.new
        instInfo = instClient.fetch(@pin.pin_url)
        @pin.oembed_str = instInfo["html"]
        @pin.parent_provider = instInfo["provider_name"]
        @pin.description = instInfo["title"]
      when "www.youtube.com"
        ytClient = YoutubeApi.new
        ytinfo = ytClient.fetch(@pin.pin_url)
        @pin.oembed_str = ytinfo["html"]
        @pin.parent_provider = ytinfo["provider_name"]
      when "vine.co"
        vine = VineApi.new
        vineInfo = vine.fetch(@pin.pin_url)
        @pin.oembed_str = vineInfo["html"]
        @pin.title = vineInfo["title"]
        @pin.parent_provider = vineInfo["provider_name"]
      when "soundcloud.com"
        soundcloud = SoundcloudApi.new
        soundcloudInfo = soundcloud.fetch(@pin.pin_url)
        @pin.title = soundcloudInfo["title"]
        @pin.oembed_str = soundcloudInfo["html"]
        @pin.parent_provider = soundcloudInfo["provider_name"]
      end

    # rescue
    #   @pin = Pin.new
    #   flash[:error] = "Something went wrong please try again"
    # end
    respond_to do |format|
      format.html { render :new }
      format.json { render json: @pin }
    end
  end

  #GET /pins/category/:category_id
  def getbycategory
    if params[:page] == nil
      @paginate = true
    else
      @paginate = false
    end
    @pins = Pin.where(category_id: params[:category_id]).paginate(:page => params[:page]).order("created_at desc")
  end


  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = current_user.pins.build(pin_params)
    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    # ! @pin, :update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.username), notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.includes(:user).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin)
          .permit(
                  :genre_list,
                  :title,
                  :description,
                  :board_id,
                  :image,
                  :remote_image_url,
                  :pin_url,
                  :oembed_str,
                  :parent_provider
                )
    end
end
