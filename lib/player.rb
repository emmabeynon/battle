class Player
  attr_reader :name, :hp, :computer

  DEFAULT_DAMAGE = 10
  DEFAULT_HP = 50

  def initialize(name, computer=false, hp=DEFAULT_HP)
    @name = name
    @computer = computer
    @hp = hp
  end

  def receive_damage
    @hp -= Kernel.rand(1..10)
  end
end
