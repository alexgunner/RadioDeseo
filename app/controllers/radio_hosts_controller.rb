class RadioHostsController < ApplicationController
  before_action :set_radio_host, only: [:show, :edit, :update, :destroy]

  # GET /radio_hosts
  # GET /radio_hosts.json
  def index
    @radio_hosts = RadioHost.all
  end

  # GET /radio_hosts/1
  # GET /radio_hosts/1.json
  def show
  end

  # GET /radio_hosts/new
  def new
    @radio_host = RadioHost.new
  end

  # GET /radio_hosts/1/edit
  def edit
  end

  # POST /radio_hosts
  # POST /radio_hosts.json
  def create
    @radio_host = RadioHost.new(radio_host_params)

    respond_to do |format|
      if @radio_host.save
        format.html { redirect_to @radio_host, notice: 'Radio host was successfully created.' }
        format.json { render :show, status: :created, location: @radio_host }
      else
        format.html { render :new }
        format.json { render json: @radio_host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radio_hosts/1
  # PATCH/PUT /radio_hosts/1.json
  def update
    respond_to do |format|
      if @radio_host.update(radio_host_params)
        format.html { redirect_to @radio_host, notice: 'Radio host was successfully updated.' }
        format.json { render :show, status: :ok, location: @radio_host }
      else
        format.html { render :edit }
        format.json { render json: @radio_host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radio_hosts/1
  # DELETE /radio_hosts/1.json
  def destroy
    @radio_host.destroy
    respond_to do |format|
      format.html { redirect_to radio_hosts_url, notice: 'Radio host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio_host
      @radio_host = RadioHost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def radio_host_params
      params.require(:radio_host).permit(:name)
    end
end
