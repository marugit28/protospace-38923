class PrototypesController < ApplicationController
  before_action :authenticate_user!,only: [:new, :edit, :delete]
  # before_action :set_prototype,

def index
  @prototypes=Prototype.all
end

def new
  @prototype = Prototype.new
end

def create
  @prototype = current_user.prototypes.new(prototype_params)
  if @prototype.save
    redirect_to root_path
  else
    render :new
  end
end

def show
  @prototype =Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)

end

def edit
  @prototype = Prototype.find(params[:id])
  unless user_signed_in? && current_user.id == @prototype.user.id
    redirect_to action: :index
  end
end

def update
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototype_params)
    redirect_to prototype_path
  else
    render :edit
  end
end
  
def destroy
  prototype =Prototype.find(params[:id])
  prototype.destroy
  if prototype.destroy
    redirect_to root_path
  end
end

private
def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id:current_user.id)
end

# def set_prototype
#   @prototype = Prototype.find(params[:id])
# end

end