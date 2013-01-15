class EmployeesController < ApplicationController

	before_filter :authenticate_user!, :only => [:edit, :update, :destroy]

	def index
		@employees = Employee.all
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end
		
end
