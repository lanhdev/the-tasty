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

    if params[:section]
      case params[:sort]
      when "name"
        @items = @items.order(:name)
      when "desc"
        @items = @items.order(:price => :desc)
      when "asc"
        @items = @items.order(:price => :asc)
      else
        @items = @items.order(:id)
      end
    end
  end

  def contact_us
  end
end
