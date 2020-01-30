require_relative "appointment.rb"

class Patient
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
            appointment_object.patient == self
        end
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def doctors
        self.appointments.map do |appointment_object|
            appointment_object.doctor
        end
    end
end