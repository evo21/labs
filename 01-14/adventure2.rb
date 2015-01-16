require 'pry'

module Killable
  def alive?
    self.health > 0
  end

  def dead?
    not self.alive?
  end
end

class BadDude
  attr_reader :name, :weapon
  attr_accessor :health, :level, :reputation, :damage
  include Killable

  def initialize(name, level=1)
    @health_per_level ||= 10
    @damage_per_level ||= 2
    @reputation_per_level ||= 5
    @level = level
    @name = name
    @health = level * @health_per_level
    @reputation = level * @reputation_per_level
    @damage = damage * @damage_per_level
  end
  
  def to_s
    @name
  end

  def max_damage
    @level * @damage_per_level
  end

  def damage
    rand(1..max_damage)
  end

  def bad_word
    [
      "a Girly-man", 
      "a Party Pooper",
      "a Nark",
      "a Stool Pigeon"
      ].sample
  end

  def insult(other)
    puts "#{self} calls #{other} #{bad_word} to his face.\n
    #{self}'s reputation: (+) to #{self.reputation}.\n
    #{other}'s reputation: (-) to #{other.reputation}."
    damage = self.level
    other.reputation -= (damage / 4 + 4)
    self.reputation += (damage / 6 + 4)
  end

  def rat_on(other)
    puts "#{self} informs the police on #{other} for -#{damage} health.\n
          #{other}'s rep: (+) to #{other.reputation}.\n
          #{self} loses #{damage} reputation for a total of #{self.reputation}."
    damage = self.level
    other.health -= damage
    other.reputation += (damage / 4 + 1)
    self.reputation -= damage * rand(1..3)
  end
  
  def attack(other)
    if other.respond_to?(:health=)
      damage = self.damage
      other.health -= damage
    
      if damage > 10
        descriptor = "uses a flying elbow on"
      elsif damage > 3
        descriptor = "strikes with a kick to"
      else
        descriptor = "slaps"
      end
    
    puts "#{self} #{descriptor} #{other}'s #{other.body_part} for #{damage} damage."
    
      if other.dead?
        puts "#{other} has died..."
      end

    else
      puts "You can't attack #{other}!"
    end
  end

  def super_attack(other)
    num_attacks = (@level / 3) + 1
    num_attacks.times { self.attack(other) }
  end
end

class Thug
  attr_reader :name
  attr_accessor :health, :level, :reputation

  include Killable

  def initialize(level)
    @level = level
    @name = "Lvl-#{level} Thug"
    @health = 0
    level.times { @health += rand(7..12) }
    @reputation = level * rand(7..12)
  end
  
  def body_part
    [
      "head",
      "neck",
      "groin",
      "knee"
    ].sample
  end
  
  def attack(other)
    damage = rand(1..4)
    puts "#{self} viciously assaults #{other} for #{damage} damage."
    other.health -= damage
    if other.dead?
      puts "#{other} has died..."
    end
  end

  def to_s
    @name
  end
end

class Guy < BadDude
  def initialize(name, weapon, level=1)
    @weapon = weapon
    @damage_per_level = 2
    @health_per_level = 20
    @reputation_per_level = 7
    super(name, level)
  end

  def rage_attack(other)
    damage = rand(1..4) * 4
    puts "#{self} uses his #{self.weapon.to_s} to rake #{other} for #{damage} damage."
    other.health -= damage
    if other.dead?
      puts "#{other} has died..."
    end
  end
end

class Girl < BadDude
  def initialize(name, weapon, level=1)
    @weapon = weapon
    @damage_per_level = 3
    @health_per_level = 30
    @reputation_per_level = 10
    super(name, level)
  end

  def scream_attack(other)
    damage = rand(1..4) * 4
    puts "#{self} uses her screaming-#{self.weapon.to_s} to bewlider #{other} for #{damage} damage."
    other.health -= damage
    if other.dead?
      puts "#{other} has died..."
    end
  end
end

james = Guy.new 'James', 'brass knuckles', 5
maria = Girl.new 'Maria', 'chain', 5
thug5 = Thug.new 5

# for every attack by BadDudes.class, 'thug5.attack(same)'

binding.pry
