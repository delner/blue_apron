module BlueApron::Moves
  def self.add(name, move)
    self.all[name] = move
  end
  def self.all
    @moves ||= {}
  end
  def self.by_name(name)
    self.all[name]
  end
end