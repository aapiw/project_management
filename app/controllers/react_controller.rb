class ReactController < ApplicationController
  def index
    render file: Rails.root.join('public/vite/index.html')
  end
end