class SeatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_seat, only: %i[show edit update destroy]
  before_action :admin_only, only: %i[admin_index destroy]

  # Alle Sitzplätze des aktuellen Benutzers anzeigen
  def index
    @seats = current_user.seats
  end

  # Admin-Seite: Alle Sitzplätze anzeigen
  def admin_index
    @seats = Seat.all
  end

  # Einzelnen Sitzplatz anzeigen
  def show
  end

  # Neues Sitzplatz-Formular
  def new
    @seat = current_user.seats.build
  end

  # Sitzplatz bearbeiten
  def edit
    redirect_to seats_path, alert: "Access denied!" unless @seat.user == current_user || current_user.admin?
  end

  # Sitzplatz erstellen
  def create
    @seat = current_user.seats.build(seat_params)
    if @seat.save
      redirect_to @seat, notice: "Seat was successfully created."
    else
      render :new
    end
  end

  # Sitzplatz aktualisieren
  def update
    if @seat.user == current_user || current_user.admin?
      if @seat.update(seat_params)
        redirect_to @seat, notice: "Seat was successfully updated."
      else
        render :edit
      end
    else
      redirect_to seats_path, alert: "Access denied!"
    end
  end

  # Sitzplatz löschen
  def destroy
    @seat.destroy

    Rails.logger.debug("Params: #{params.inspect}") # Füge dies hinzu

    if params[:from] == "admin"
      redirect_to admin_seats_url, notice: "Sitzplatz wurde erfolgreich gelöscht."
    else
      redirect_to seats_url, notice: "Sitzplatz wurde erfolgreich gelöscht."
    end
  end

  private

  def set_seat
    @seat = Seat.find(params[:id])
  end

  def seat_params
    params.require(:seat).permit(:train, :wagons, :current_wagon, :seat_number, :floor)
  end

  def admin_only
    redirect_to(root_path, alert: "Access denied!") unless current_user.admin?
  end
end
