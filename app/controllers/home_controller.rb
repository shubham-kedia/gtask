class HomeController < ApplicationController
	def index
		
	end
	def barchart
		@b = Barchart.all.select('date,jodhpur,bikaner,jaipur').to_json
		# respond_to do |format|
		# 	format.json { render :json => {:data => @b} }
		# end
		render :text => @b
	end
	def multilinechart
		@m =Multilinechart.all.select('month,expenses')
		# @m =Multilinechart.pluck(:month,:expenses)
		respond_to do |format|
			format.js {render :json => {:data => @m}}
		end
	end
end
