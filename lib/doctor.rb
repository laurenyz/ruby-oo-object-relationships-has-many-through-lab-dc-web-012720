require_relative "appointment.rb"
require_relative "patient.rb"
require 'pry'

class Doctor
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |appointment_object|
            appointment_object.doctor == self
        end
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
        # binding.pry
    end

    def patients
        self.appointments.map do |appointment_object|
            appointment_object.patient
        end
    end

end