class Player
  attr_reader :name, :hp

  DEFAULT_DAMAGE = 10
  DEFAULT_HP = 50

  def initialize(name, hp=DEFAULT_HP)
    @name = name
    @hp = hp
  end

  def receive_damage
    @hp -= Kernel.rand(1..10)
  end
end
