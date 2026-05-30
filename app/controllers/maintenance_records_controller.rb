class MaintenanceRecordsController < ApplicationController
  before_action :set_record, only: [ :show, :update, :destroy ]

  # GET /maintenance_records
  def index
    records = MaintenanceRecord.includes(:equipment).order(performed_at: :desc)
    records = records.where(equipment_id: params[:equipment_id]) if params[:equipment_id].present?

    render json: records.map { |r| record_index_json(r) }
  end

  # GET /maintenance_records/:id
  def show
    render json: {
      id:             @record.id,
      description:    @record.description,
      performed_at:   @record.performed_at,
      equipment_id:   @record.equipment_id,
      equipment_name: @record.equipment.name,
      created_at:     @record.created_at,
      updated_at:     @record.updated_at
    }
  end

  # POST /maintenance_records
  def create
    record = MaintenanceRecord.new(record_params)

    if record.save
      render json: record, status: :created
    else
      render json: { errors: record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /maintenance_records/:id
  def update
    if @record.update(record_params)
      render json: @record
    else
      render json: { errors: @record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /maintenance_records/:id
  def destroy
    @record.destroy
    head :no_content
  end

  private

  def set_record
    @record = MaintenanceRecord.includes(:equipment).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Maintenance record not found" }, status: :not_found
  end

  def record_params
    params.require(:maintenance_record).permit(:description, :performed_at, :equipment_id)
  end

  def record_index_json(r)
    {
      id:             r.id,
      description:    r.description,
      performed_at:   r.performed_at,
      equipment_name: r.equipment.name
    }
  end
end
