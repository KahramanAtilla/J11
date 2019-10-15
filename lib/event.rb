require 'time'
require 'pry'

class Event
  attr_accessor :date, :duree, :titre, :invites
  
  def initialize(date, duree, titre, invites)
    @start_date =  Time.parse(date)
    @duration = duree
    @title = titre
    @attendees = invites
  end

  def postpone_24h
    @start_date = @start_date + 24*60*60
  end

  def end_date
    end_date = @start_date + @duration*60
  end

  def is_past?
    @start_date < Time.now
  end

  def is_futur?
    @start_date > Time.now
  end

  def is_soon?
    @start_date + 30*60 < Time.now
  end

  def to_s
    puts ">Title : #{@title}"
    puts ">Start date : #{@start_date}"
    puts ">Duration : #{@duration}"
    puts ">Guests : #{@attendees}"
  end
end
