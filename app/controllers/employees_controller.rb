class EmployeesController < ApplicationController

	before_filter :authenticate_user!, :only => [:edit, :update, :destroy, :new, :create]

	def index
		@employees = Employee.all
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(params[:employee])
		respond_to do |format|
    		if @employee.save
      			format.html  { redirect_to(employees_path,
                    :notice => 'Desenvolvedor cadastrado com sucesso! :) ') }
      			format.json  { render :json => @employee,
                    :status => :created, :location => @employee }
    		else
      			format.html  { render :action => "new" }
      			format.json  { render :json => @employee.errors,
                    :status => :unprocessable_entity }
    		end
  		end
	end

	def show
		@employee = Employee.find(params[:id])

		respond_to do |format|
    		format.html  
    		format.json  { render :json => @post }
    	end
  	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update
		@employee = Employee.find(params[:id])
		@employee.update_attributes(params[:employee])
		redirect_to employees_path, :notice => "Alterado com sucesso! :)"
	end

	def destroy
		@employee = Employee.find(params[:id])
		if @employee.destroy
			redirect_to :back, :notice => "Deletado com sucesso!"
		else
			redirect_to :back, :notice => "Erro ao deletar"
		end		
	end
		
end
