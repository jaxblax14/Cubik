class UnitsController < ApplicationController
  before_action(:set_unit, only: [:edit, :update])
  def index
    @units = Unit.all.order(:index_order)
  end

  def new
    @units = Unit.new
    @form_path = units_create_path
  end

  def edit
    @form_path = units_update_path(@units)
  end
  
  def create
    unit = Unit.new(unit_params)
    if unit.name.blank? 
      flash[:notice] = 'Debes completar todos los campos obligatorios'
      redirect_back(fallback_location: request.referer) and return
    end
    if unit.save
      unit.update(index_order: Unit.count)
      flash[:notice] = 'Unidad creada exitosamente'
      redirect_back(fallback_location: request.referer)
    else
      flash[:notice] = 'Error al crear unidad'
      redirect_back(fallback_location: request.referer)
    end
  end

  def update
    if unit_params[:name].blank?
      flash[:notice] = 'Debes completar todos los campos obligatorios'
      redirect_back(fallback_location: request.referer) and return
    end
    # Edicion de la  etapa
    if @units.update(unit_params)
      flash[:notice] = 'Etapa modificada exitosamente'
      redirect_back(fallback_location: request.referer)
    else
      flash[:alert] = 'Error al modificar etapa'
      redirect_back(fallback_location: request.referer)
    end
  end

  private

  def set_unit
    @units = Unit.find(params[:unit_id])
  end
  def unit_params
    params.require(:unit).permit(:name)
  end

end