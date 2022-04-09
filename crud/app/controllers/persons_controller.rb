class PersonsController < ApplicationController

  def index
    @persons = Person.all
  end

  def new
  end

 # def create
 # end

end

