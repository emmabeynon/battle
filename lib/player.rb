class Player
  attr_reader :name, :hp, :computer, :poisoned

  DEFAULT_DAMAGE = 10
  DEFAULT_HP = 50

  def initialize(name, computer=false, hp=DEFAULT_HP)
    @name = name
    @computer = computer
    @hp = hp
    @poisoned = false
    @asleep = false
  end

  def receive_damage(max_damage)
    @hp -= Kernel.rand(max_damage)
  end

  def receive_poison
    @poisoned = true
  end

  def receive_sleep_attack
    sleep = Kernel.rand(0..5)
    sleep.even? ? @asleep = true : @asleep = false
  end

end
