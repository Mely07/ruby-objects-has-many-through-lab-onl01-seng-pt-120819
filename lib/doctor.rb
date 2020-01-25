class Doctor
  attr_accessor :name 
  
  @@all = []
 
  def initialize(name)
    @name = name
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def appointments
    Appointment.all.select do |appointment|
      appointment.doctor == self #doctor checks for all of the appointment they have ever scheduled 
    end
  end
  
  def new_appointment(patient, date)#grants the/a doctor the ability to create a new appointment. it automatically associates each new appointment with the doctor. 
    Appointment.new(date, patient, self) 
  end
  
  def patients 
    appointments.map do |appointment| #same as self.appoint. (appoint. method) -- Ruby
      appointment.patient 
    end
  end

end

