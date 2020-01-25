class Patient 
  attr_accessor :name
 
  @@all = []
 
  def initialize(name)
    @name = name
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def appointments #the patient is going to look at all of the appointments, and then select only the ones that belong to them, if they know the name of the doctor of their last visit they can leave them a good review. 
      Appointment.all.select do |appointment|
        appointment.patient == self
      end
  end
  
  def new_appointment(doctor, date) #grants the/a patient the ability to create a new appointment. it automatically associates each new appointment with the patient that created it. 
    Appointment.new(date, self, doctor) 
  end
  
    
  def doctors
    appointments.map do |appointment| #same as self.appoint. -- Ruby
      appointment.doctor
    end
  end
end