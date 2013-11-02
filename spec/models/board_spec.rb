require 'spec_helper'

describe Board do
	before { @board = Board.new(name: "shop") }
	subject { @board }

	it { should respond_to(:name) }
	
end
