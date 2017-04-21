class MockLog
  @@logs = []

  def debug?
    true
  end

  def debug(ss)
    @@logs << ss
  end

  def error(ss)
    @@logs << ss
  end

  def self.last
    @@logs.last
  end

  def self.all
    @@logs
  end
end
