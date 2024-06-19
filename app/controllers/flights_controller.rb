class FlightsController < ApplicationController
  def index
    @airports = Airport.all.pluck(:code, :id)
    @departure_dates = departure_dates

    if search_params_present?
      @search_results = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id],
        departure_datetime: parsed_departure_date.all_day
      )
    else
      @search_results = Flight.none
    end
  end

  private

  def departure_dates
    Flight.order(:departure_datetime).pluck(:departure_datetime).map(&:to_date).uniq
  end

  def parsed_departure_date
    @parsed_departure_date ||= begin
      Date.parse(params[:departure_date]) rescue nil
    end
  end

  def search_params_present?
    params[:departure_airport_id].present? &&
    params[:arrival_airport_id].present? &&
    params[:departure_date].present? &&
    params[:tickets].present?
  end
end
