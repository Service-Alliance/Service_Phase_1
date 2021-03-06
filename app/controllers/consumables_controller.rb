class ConsumablesController < ApplicationController
  before_action :set_consumable, only: [:show, :edit, :update, :destroy]

  # GET /consumables
  # GET /consumables.json
  def index
    @consumables = Consumable.name_ordered
  end

  # GET /consumables/1
  # GET /consumables/1.json
  def show
  end

  # GET /consumables/new
  def new
    @consumable = Consumable.new
  end

  # GET /consumables/1/edit
  def edit
  end

  # POST /consumables
  # POST /consumables.json
  def create
    @consumable = Consumable.new(consumable_params)

    respond_to do |format|
      if @consumable.save
        format.html { redirect_to @consumable, notice: 'Consumable was successfully created.' }
        format.json { render :show, status: :created, location: @consumable }
      else
        format.html { render :new }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumables/1
  # PATCH/PUT /consumables/1.json
  def update
    respond_to do |format|
      if @consumable.update(consumable_params)
        format.html { redirect_to @consumable, notice: 'Consumable was successfully updated.' }
        format.json { render :show, status: :ok, location: @consumable }
      else
        format.html { render :edit }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumables/1
  # DELETE /consumables/1.json
  def destroy
    @consumable.destroy
    respond_to do |format|
      format.html { redirect_to consumables_url, notice: 'Consumable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_consumable
    @consumable = Consumable.find(params[:id])
  end

  def consumable_params
    params.require(:consumable).permit(:name, :purchase_unit, :cost_per_purchase_unit, :purchase_unit_quantity)
  end
end
