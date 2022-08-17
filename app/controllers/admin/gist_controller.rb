class Admin::GistController < Admin::BaseController

  def show_gist
    @gist_show = Gist.all
  end

end