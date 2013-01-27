class LogsController < ApplicationController
  before_filter :save_tails

  def index
    @logs = Log.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logs }
    end
  end

  def index_grouped_by_tags
    @logs_each_tag = Log.all.inject({}) do |h, log|
      log.tags.each do |tag|
        h[tag] ||= []
        h[tag] << log
      end
      h
    end
  end

  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @log }
    end
  end

  def save_tails
    LogFile.save_tails
  end
end
