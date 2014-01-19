#!/usr/bin/env ruby

class Dessert
	attr_accessor :name
	attr_accessor :calories
		
	def initialize(name, calories)
		@name = name
		@calories = calories
	end

	def healthy?
		@calories < 200
	end

	def delicious?
		true
	end
end

class JellyBean < Dessert
	attr_accessor :flavor
	def initialize(name, calories, flavor)
		super(name, calories)
		@flavor = flavor
	end

	def delicious?
		self.flavor == "black licorice" ? false : super
	end
end

if __FILE__ == $0
	puts Dessert.new('test', 10).name
	puts Dessert.new('test', 10).calories
	puts Dessert.new('test', 10).healthy?
	puts Dessert.new('test', 10).delicious?
	puts Dessert.new('test', 500).healthy?
	
	puts JellyBean.new('test', 100, 'testing').name
	puts JellyBean.new('test', 100, 'testing').calories
	puts JellyBean.new('test', 100, 'testing').healthy?
	puts JellyBean.new('test', 100, 'testing').delicious?
	
	puts JellyBean.new('test', 100, 'black licorice').healthy?
	puts JellyBean.new('test', 500, 'black licorice').healthy?
	puts JellyBean.new('test', 500, 'black licorice').delicious?
	puts JellyBean.new('test', 100, 'black licorice').delicious?
end
