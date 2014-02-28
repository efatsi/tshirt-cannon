class Left
  include DataMapper::Resource

  property :id, Serial
  property :count, Integer

  def self.increment
    first.update(:count => first.count+1)
  end
end
