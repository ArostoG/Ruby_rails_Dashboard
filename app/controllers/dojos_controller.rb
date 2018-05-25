class DojosController < ApplicationController
  def index
    @dojos= Dojo.all
    render "index"
  end

  def new
    render "new"
  end

  def create
    @dojos= Dojo.create(branch:params[:branch],street:params[:street],city:params[:city],state:params[:state])
    redirect_to '/dojos'
  end

  def edit
    @dojos=Dojo.find(params[:id])
    render "edit"
  end

  def show
    @dojos=Dojo.find(params[:id])
    @students=Student.where(dojo:Dojo.find(params[:id]))

    render "show"
  end

  def destroy
    @dojos=Dojo.find(params[:id])
    @dojos.destroy
    redirect_to '/dojos'
  end

  def update
    @dojos=Dojo.find(params[:id]).update(branch:params[:branch],street:params[:street],city:params[:city],state:params[:state])
    flash[:success]= "Successfully updated"
    redirect_to "/dojos/#{params[:id]}"
  end
  def newstudent
    @dojos=Dojo.find(params[:id])
    render "student"

  end
  def student

 @students =Student.create(dojo:Dojo.find(params[:id]),first_name:params[:first_name],last_name:params[:last_name],email:params[:email])

 #  below query is also working
     # @dojos=Dojo.find(params[:id])
#  @students =Student.create(dojo:@dojos,first_name:params[:first_name],last_name:params[:last_name],email:params[:email])
    redirect_to "/dojos/#{params[:id]}"
  end

  def showstudent
    @dojos = Dojo.find(params[:dojo_id])
    @students=Student.find(params[:id])
    render "showstudent"
  end
  def editstudent
    @dojos = Dojo.find(params[:dojo_id])
    @students=Student.find(params[:id])
    render "editstudent"
  end
def updatestudent
  @dojos = Dojo.find(params[:dojo_id])
  
  @students =Student.find(params[:id]).update(first_name:params[:first_name],last_name:params[:last_name],email:params[:email])
  redirect_to "/dojos/#{params[:dojo_id]}"
end

end
