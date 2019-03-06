require_relative "methods_tic_tac_toe"

RSpec.describe "test #methods_tic_tac_toe" do
  obj = TicTacToe.new(3)
  it "validate user can't win" do
    expect(obj.validate_winner("1")).to eq("")
  end

  it "validate computer can't win" do
    expect(obj.validate_winner("0")).to eq("")
  end

  it "validate user win" do
    obj.array_move[0], obj.array_move[1], obj.array_move[2] = Array.new(3,"1")
    expect(obj.validate_winner("1")).to eq("1")
  end

  it "validate computer win" do
    obj.array_move[0], obj.array_move[1], obj.array_move[2] = Array.new(3,"0")
    expect(obj.validate_winner("0")).to eq("0")
  end
end