class HomeController < ApplicationController
	def index
		
	end
	def test
		
	end
	def barchart
		@b = Barchart.all.select('date,jodhpur,bikaner,jaipur').to_json
		# respond_to do |format|
		# 	format.json { render :json => {:data => @b} }
		# end
		render :text => @b
	end
	def multilinechart
		@m =Multilinechart.all.select('month,expenses').to_json
		# @m =Multilinechart.pluck(:month,:expenses)
		# respond_to do |format|
		# 	format.js {render :json => {:data => @m}}
		# end
		render :text => @m
	end
	def piechart
		@p =Piechart.all.select('label,value').to_json
		render :text => @p
	end
end
