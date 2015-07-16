class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy

  def create
    @suggestion = current_user.suggestion.build(suggestion_params)
    if @suggestion.save
      flash[:success] = 'Suggestion submitted.'
      redirect_to suggestions_path
    else
      flash[:danger] = 'Oops! Something went wrong. Please try again.'
      redirect_to suggestions_path
    end
  end

  def destroy
    @suggestion.destroy
    flash[:success] = 'Suggestion deleted.'
    redirect_to suggestions_path
  end

  def show
    @suggestions = Suggestion.all
    @suggestion = current_user.suggestion.build
  end

  private

    def correct_user
      @suggestion = current_user.suggestion.find_by(id: params[:id])
      redirect_to suggestions_path if @suggestion.nil?
    end

    def suggestion_params
      params.require(:suggestion).permit(:content)
    end
end
