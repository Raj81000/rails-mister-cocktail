class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    # this identifies the correct cocktail to which this new dose is connected
    @dose = Dose.new(dose_params)
    # this creates the instance of the dose through the dose params method below that is connected to the relevant cocktail
    @dose.cocktail = @cocktail
    # this connects the identified dose and the identified cocktail so that the new instance of dose can be created per the model.
    # remember that the model for dose requires three things - the cocktail, the ingrdients and the description.
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.delete
    redirect_to cocktails_path
  end

private

def dose_params
        params.require(:dose).permit(:ingredient_id, :description)

  end

end
