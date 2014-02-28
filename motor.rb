require 'bundler'
Bundler.setup(:default)
Bundler.require

load 'models/left.rb'
load 'models/right.rb'

DataMapper.setup(:default, 'postgres://efatsi@localhost/tshirt_cannon')
DataMapper.finalize

@board = Dino::Board.new(Dino::TxRx::Serial.new)
@servo = Dino::Components::Servo.new(pin: 9, board: @board, position: 90)

def move(amount)
  if amount > 0
    @servo.position = 101
    sleep(0.2)
    @servo.position = 90
  elsif amount < 0
    @servo.position = 84
    sleep(0.2)
    @servo.position = 90
  end
end

@left  = Left.first.count
@right = Right.first.count

while true do
  puts "Checking"
  new_lefts  = Left.first.count - @left
  new_rights = Right.first.count - @right
  puts "new_lefts: #{new_lefts}. new_rights: #{new_rights}"

  move(new_rights - new_lefts)

  @left  = Left.first.count
  @right = Right.first.count

  sleep 0.5
end
