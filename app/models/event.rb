class Event < ApplicationRecord
  has_many :attendees, dependent: :destroy

  #Callbacks
# before_action :show, :inde

  # Validaciones
  validates :name, :date, presence: true

  # Scopes personalizados
  # Eventos futuros
  scope :future_events, -> { where('date >= ?', Time.now).order(date: :asc) }

  # Eventos pasados
  scope :past, -> { where('date < ?', Time.now).order(date: :desc) }

  # Eventos del mes actual
  scope :current_month, -> { where(date: Time.now.beginning_of_month..Time.now.end_of_month) }

  # Eventos que ocurren el miércoles
  scope :wednesday_events, ->(day) {
    where("EXTRACT(DOW FROM date) = ?", day)
  }

  # Eventos cuya descripción contenga la palabra "concierto"
  scope :description_concert, -> { where("LOWER(description) LIKE ?", "%concierto%") }
end
