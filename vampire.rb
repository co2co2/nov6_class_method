
class Vampire
  @@all_vampire = []

  def initialize(name, age)
    @name = name
    @age = age
    @in_coffine = true
    @drank_blood_today = true
  end

  def self.create(name,age)
    new_vampire = Vampire.new(name,age)
    @@all_vampire << new_vampire
    return  new_vampire
  end

  def self.all
    @@all_vampire
  end

  def self.sunrise
    puts "the sun is rising..."
    @@all_vampire = @@all_vampire.select{ |current_vampire| current_vampire.drank_blood_today? == true && current_vampire.in_coffine_before_sunrise? == true}
  end
  #.each + delete didnt worl well coz delete shorten the array!!!

  def self.sunset
    puts "the sun is setting..."
    @@all_vampire.each do |current_vampire|
      puts "please go out for foods!"
      current_vampire.out_of_blood
      current_vampire.leave_home
    end
  end

  def go_home
    @in_coffine = true
  end

  def leave_home
    @in_coffine = false
  end

  def drink_blood
    @drank_blood_today = true
  end

  def out_of_blood
    @drank_blood_today = false
  end

  def drank_blood_today?
    @drank_blood_today
  end

  def in_coffine_before_sunrise?
    @in_coffine
  end
end
coco = Vampire.create('Coco', 3)
raymond = Vampire.create('Raymond',9)
wilson = Vampire.create('Wilson',1)
dan = Vampire.create('Dan',99)
livia = Vampire.create('Livian', 18)
puts Vampire.all

# Vampire.sunset
coco.out_of_blood
Vampire.sunrise
puts Vampire.all
# wilson.leave_home
