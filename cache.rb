#! /usr/bin/env ruby

def p3
	a = [1, 4, 8, 5, 20, 17, 19, 56, 9, 11, 4, 43, 5, 6, 9, 17]
	h = []
	res = a.collect do |x|
		h[x%8] ||= []
		if h[x%8].include? x
			h[x%8].delete x
			t = "hit"
		else
			h[x%8].pop if h[x%8].size >= 2
			t = "miss"
		end
		h[x%8].unshift x
		t
	end
	h[7] = []
	h.each_with_index do |a, i|
		puts "\\hline"
		a = ["",""] if a.nil?
		puts "#{i} & #{a[0]} & #{a[1]}  \\\\"
	end
end

def p4
	a = [1, 4, 8, 5, 20, 17, 19, 56, 9, 11, 4, 43, 5, 6, 9, 17]
	h = []
	res = a.collect do |x|
		if h.include? x
			h.delete x
			t = "hit"
		else
			h.pop if h.size == 16
			t = "miss"
		end
		h.unshift x
		t
	end
	puts res
	i = 0
	p h
	h.each_slice(4) do |a|
		puts "\\hline"
		puts "NO. & #{i} & #{i+1} & #{i+2} & #{i+3}"
		puts "\\hline"
		puts "content & #{a[0]} & #{a[1]} & #{a[2]} & #{a[3]}"
		i+=4
	end
end

if $0 == __FILE__
	p4
end
