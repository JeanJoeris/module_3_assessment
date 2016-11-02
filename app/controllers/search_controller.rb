class SearchController < ApplicationController
  def index
    @zipcode = search_params[:search]
    @store_search = StoreSearch.by_zipcode({zip: @zipcode, distance: 25})
  end

  private
    def search_params
      params.permit(:search)
    end
end
