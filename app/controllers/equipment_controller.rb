class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :update, :destroy]

  # GET /equipment
  def index
    equipment = Equipment.includes(:category).order(:name)
    equipment = equipment.where(status: params[:status]) if params[:status].present?

    render json: equipment.map { |e| equipment_index_json(e) }
  end

  # GET /equipment/:id
  def show
    render json: {
      id:            @equipment.id,
      name:          @equipment.name,
      serial_number: @equipment.serial_number,
      status:        @equipment.status,
      category: {
        id:   @equipment.category.id,
        name: @equipment.category.name
      },
      maintenance_records: @equipment.maintenance_records
                                     .order(performed_at: :desc)
                                     .map { |r| record_summary(r) },
      created_at: @equipment.created_at,
      updated_at: @equipment.updated_at
    }
  end

  # POST /equipment
  def create
    equipment = Equipment.new(equipment_params)

    if equipment.save
      render json: equipment, status: :created
    else
      render json: { errors: equipment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /equipment/:id
  def update
    if @equipment.update(equipment_params)
      render json: @equipment
    else
      render json: { errors: @equipment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /equipment/:id
  def destroy
    @equipment.destroy
    head :no_content
  end

  private

  def set_equipment
    @equipment = Equipment.includes(:category, :maintenance_records).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Equipment not found" }, status: :not_found
  end

  def equipment_params
    params.require(:equipment).permit(:name, :serial_number, :status, :category_id)
  end

  def equipment_index_json(e)
    {
      id:            e.id,
      name:          e.name,
      serial_number: e.serial_number,
      status:        e.status,
      category_name: e.category.name
    }
  end

  def record_summary(r)
    {
      id:           r.id,
      description:  r.description,
      performed_at: r.performed_at
    }
  end
end
