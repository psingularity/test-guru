# frozen_string_literal: true

module ApplicationHelper
  def github_url(project, author, repo)
    link_to project, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def current_year
    Date.today.year
  end
end
