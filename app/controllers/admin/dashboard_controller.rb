class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"]

  def show
    @prod_stats = Product.count
    @cat_stats = Category.count
  end

end
