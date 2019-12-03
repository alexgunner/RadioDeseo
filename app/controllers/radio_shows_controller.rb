class RadioShowsController < ApplicationController
  before_action :set_radio_show, only: [:show, :edit, :update, :destroy, :schedules, :new_schedule, :create_schedule]

  # GET /radio_shows
  # GET /radio_shows.json
  def index
    @radio_shows = RadioShow.all.reverse
  end

  # GET /radio_shows/1
  # GET /radio_shows/1.json
  def show
  end

  # GET /radio_shows/new
  def new
    @radio_show = RadioShow.new
    @hosts = RadioHost.all.reverse
    
  end

  # GET /radio_shows/1/edit
  def edit
    @hosts = RadioHost.all.reverse
    
  end

  # POST /radio_shows
  # POST /radio_shows.json
  def create
    @radio_show = RadioShow.new(radio_show_params)

    respond_to do |format|
      if @radio_show.save
        params[:hosts].each do |host|
          ShowHost.register @radio_show, host
        end
        format.html { redirect_to radio_shows_url, notice: 'Radio show was successfully created.' }
        format.json { render :show, status: :created, location: @radio_show }
      else
        format.html { render :new }
        format.json { render json: @radio_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radio_shows/1
  # PATCH/PUT /radio_shows/1.json
  def update
    respond_to do |format|
      if @radio_show.update(radio_show_params)
        # We remove all the hosts
        @radio_show.show_hosts.delete_all
        if !params[:hosts].nil?
          params[:hosts].each do |host|
            ShowHost.register @radio_show, host
          end
        end
        format.html { redirect_to radio_shows_url, notice: 'Radio show was successfully updated.' }
        format.json { render :show, status: :ok, location: @radio_show }
      else
        format.html { render :edit }
        format.json { render json: @radio_show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radio_shows/1
  # DELETE /radio_shows/1.json
  def destroy
    @radio_show.destroy
    respond_to do |format|
      format.html { redirect_to radio_shows_url, notice: 'Radio show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def schedules
    @schedules = @radio_show.show_schedules
  end

  def new_schedule
    @days = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]
  end

  def create_schedule
    days_number = ""
    days_result = fixed_array(7, ["0", "0", "0", "0", "0", "0", "0"])
    start_time = params[:start_time]
    end_time = params[:end_time]
    days = params[:days]
    days.each do |day|
      days_result[day.first.to_i] = "1"
    end
    days_result.each do |result|
      days_number += result
    end
    radio_schedule = RadioSchedule.create starts_at: start_time, ends_at: end_time, days: days_number.to_i(2)

    ShowSchedule.create radio_show: @radio_show, radio_schedule: radio_schedule
    redirect_to '/radio_shows/' + @radio_show.id.to_s + '/schedules'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radio_show
      @radio_show = RadioShow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def radio_show_params
      params.require(:radio_show).permit(:name)
    end

    def fixed_array(size, other)  
       Array.new(size) { |i| other[i] }
    end
end
