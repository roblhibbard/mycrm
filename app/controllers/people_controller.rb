class PeopleController < ApplicationController
  before_action :set_people
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET clients/1/people
  def index
    @people = @client.people
  end

  # GET clients/1/people/1
  def show
  end

  # GET clients/1/people/new
  def new
    @person = @client.people.build
  end

  # GET clients/1/people/1/edit
  def edit
  end

  # POST clients/1/people
  def create
    @person = @client.people.build(person_params)

    if @person.save
      redirect_to([@person.client, @person], notice: 'Person was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT clients/1/people/1
  def update
    if @person.update_attributes(person_params)
      redirect_to([@person.client, @person], notice: 'Person was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE clients/1/people/1
  def destroy
    @person.destroy

    redirect_to client_people_url(@client)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people
      @client = Client.find(params[:client_id])
    end

    def set_person
      @person = @client.people.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:name)
    end
end
