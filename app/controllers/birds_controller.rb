class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    #render json: birds, except: [:created_at, :updated_at] => alternative for array of objects, e.g. birds
  end

  def show
    bird = Bird.find(params[:id])
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species}
      #render json: bird.slice(:id, :name, :species) => alternative for single object, e.g. bird
    else
      render json: { message: 'Bird not found' }
    end
  end

end