module Admins
  class CategoriesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_category, only: %i[ show edit update destroy ]

    # GET /products or /products.json
    def index
      @categories = Category.all
    end

    # GET /products/1 or /products/1.json
    def show
    end

    # GET /products/new
    def new
      @category = Category.new
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products or /products.json
    def create
      @category = Category.new(category_params)

      respond_to do |format|
        if @category.save
          format.html { redirect_to admins_category_path(@category), notice: "Category was successfully created." }
          format.json { render :show, status: :created, location: admins_category_path(@category) }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /products/1 or /products/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to admins_category_path(@category), notice: "Category was successfully updated." }
          format.json { render :show, status: :ok, location: admins_category_path(@category) }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1 or /products/1.json
    def destroy
      @category.destroy
      respond_to do |format|
        format.html { redirect_to admins_categories_path, notice: "Category was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def category_params
        params.require(:category).permit(:name)
      end
  end
end
