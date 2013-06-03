#! /usr/bin/env ruby
class MyArray < Array
	def initialize(capicity)
		@capicity = capicity
		@hit = 0
		@miss = 0
	end
	def lookup(x)
		if(include? x)
			@hit += 1
			str = "hit"
		else
			str = "miss"
			@miss += 1
			push x unless include? x
			shift if size > @capicity
		end
		puts "#{x} & #{self.join(',')} & #{str} \\\\ \\hline"
	end
	def stat
		puts "miss:#{@miss}  hit:#{@hit}"
	end
end

if $0 == __FILE__
	seq = [1,2,3,4,5,6,7,8,9,1,2,3,10,11,1,2,3,12,13,14,15,16,17,10,11]
	a = MyArray.new(8)
	b = MyArray.new(9)
	seq.each { |e|
		a.lookup e

		puts
	}
	seq.each { |e| b.lookup e; puts }
	a.stat
	b.stat
end

