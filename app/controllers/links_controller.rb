class LinksController < ApplicationController
  before_action :authenticate_user!, except: :redirect
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = current_user.links.all.order('updated_at DESC')
    @host = request.host
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @host = request.host
  end

  def about
    
  end
  
  def redirect
    short_url = params[:url]
    @link = current_user.links.where(short_url: short_url).first
    #raise @link.original_url
    if @link.nil?
      raise "Route not found."
    end
    
    @link.increase_count!
    
    redirect_to @link.original_url, status: 301
  end
  # GET /links/new
  def new
    @link = current_user.links.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    #@link = Link.new(link_params)
   #@link =Link.first_or_create(original_url: params[:original_url])
    #raise format
    @link = current_user.links.where(original_url: link_params[:original_url]).first_or_initialize
    #raise link_params[:original_url]
    @host = request.host
    respond_to do |format|
      if @link.new_record?
        @link.save!
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { redirect_to @link, notice: 'Link was created.'}
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = current_user.links.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:original_url, :short_url)
    end
end
