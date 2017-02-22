class HomeController < ApplicationController
  def index
  end

  def menu
    @sections = Section.all
    if params[:section_id].present?
      @current_section = Section.find(params[:section_id])
      @items = @current_section.food_items
    else
      @items = FoodItem.all
    end

    if params[:search]
      @items = FoodItem.search(params[:search])
    end

    if params[:sort_column]
      @items = @items.order("#{params[:sort_column]} #{params[:sort_type]}")
    end
  end

  def contact_us
  end
end
