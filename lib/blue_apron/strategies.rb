module BlueApron::Strategies
  def self.add(name, strategy)
    self.all[name] = strategy
  end
  def self.all
    @strategies ||= {}
  end
  def self.by_name(name)
    self.all[name]
  end
end