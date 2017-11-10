


class Zombie
  # # Class Variables
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  # # Instance Variables
  def initialize (speed, strength)
    @speed = speed
    if speed > @@max_speed
      return @speed = @@default_speed
    end
    @strength = strength
    if strength > @@max_strength
      return @strength = @@default_strength
    end
  end

  # # Class Methods
  def self.all
    @@horde
  end

  def self.spawn

    @speed = rand(1..@@max_speed)
    @strength = rand(1..@@max_strength)
new_zombie = Zombie.new(@speed, @strength)
    rand(@@plague_level+1).times do
      @@horde << new_zombie
    end

    return new_zombie
  end
  #
  def self.new_day
    some_die_off
    increase_plague_level
    spawn
  end

  def self.increase_plague_level
    @@plague_level += rand(0..2)
  end

  def self.some_die_off
    rand(@@plague_level + 1).times do @@horde.shift
    end
  end
  # # Instance Variables
  def encounter
    if outrun_zombie?
      puts "You escaped!"
    elsif survive_attack?
      @@horde << Zombie.new(@speed, @strength)
      puts "You are now a zombie!"
    else
      puts "you died!"
    end
  end


  def outrun_zombie?
  my_speed = rand(@@max_speed + 1)
    if my_speed > @speed
      return true
    else
      return false
    end
  end
#
  def survive_attack?
    my_strengh = rand(@@max_strength + 1)
    if my_strengh > @strength
      return true
    else
      return false
    end
  end
end



puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
