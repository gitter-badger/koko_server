class BeaconsController < ApplicationController
  before_action :set_beacon, only: [:show, :edit, :update, :destroy]
  before_action :set_beacon_remote, only: [:remote]

  # GET /beacons
  # GET /beacons.json
  def index
    @beacons = Beacon.all
  end

  # GET /beacons/1
  # GET /beacons/1.json
  def show
  end

  # GET /beacons/find/<uuid>.JSON
  def remote
  end

  # GET /beacons/new
  def new
    @beacon = Beacon.new
  end

  # GET /beacons/1/edit
  def edit
  end

  # POST /beacons
  # POST /beacons.json
  def create
    @beacon = Beacon.new(beacon_params)

    respond_to do |format|
      if @beacon.save
        format.html { redirect_to @beacon, notice: 'Beacon was successfully created.' }
        format.json { render :show, status: :created, location: @beacon.board }
      else
        format.html { render :new }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beacons/1
  # PATCH/PUT /beacons/1.json
  def update
    respond_to do |format|
      if @beacon.update(beacon_params)
        format.html { redirect_to @beacon, notice: 'Beacon was successfully updated.' }
        format.json { render :show, status: :ok, location: @beacon }
      else
        format.html { render :edit }
        format.json { render json: @beacon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beacons/1
  # DELETE /beacons/1.json
  def destroy
    @beacon.destroy
    respond_to do |format|
      format.html { redirect_to beacons_url, notice: 'Beacon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beacon
    # if params[:id].match(/%d/)
    # begin
    @beacon = Beacon.find(params[:id])
    # rescue
    #   @beacon = Beacon.find_by(:uuid => params[:id])
    #   @remote = true
    # end
  end

  # Setup for remote queries.
  def set_beacon_remote
    @beacon = Beacon.find_by(uuid: params[:uuid])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def beacon_params
    params.require(:beacon).permit(:uuid, :board_id)
  end
end
