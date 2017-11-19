class Path < ApplicationRecord
	attr_accessor :next_zero, :next_one
	belongs_to :story



end
