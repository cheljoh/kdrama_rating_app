class TitlesController < ApplicationController

  def index
    @titles = Title.all
  end

  def show
    @title = Title.find(params[:id])
    @average = @title.ratings.average(:score).to_i
  end


end

# <%= "Rating:#{@title.ratings}" %>
#
# # <% if !@rating.score.nil? %>
#   <%= "Rating: #{rating.score}" %>
# <% else %>
# <% end %>

# <% Rating.all.each do |rating| -%>
#    <div>
#      <%= check_box_tag(:rating_id, rating.id, false, :name => 'title[rating_id][]', id: "#{rating.score}") %>
#      <%= rating.score %>
#    </div>
#  <% end %>
