class LogFilesController < ApplicationController
  # GET /log_files
  # GET /log_files.json
  def index
    @log_files = LogFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @log_files }
    end
  end

  # GET /log_files/1
  # GET /log_files/1.json
  def show
    @log_file = LogFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @log_file }
    end
  end

  # GET /log_files/new
  # GET /log_files/new.json
  def new
    @log_file = LogFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @log_file }
    end
  end

  # GET /log_files/1/edit
  def edit
    @log_file = LogFile.find(params[:id])
  end

  # POST /log_files
  # POST /log_files.json
  def create
    @log_file = LogFile.new(params[:log_file])

    respond_to do |format|
      if @log_file.save
        format.html { redirect_to @log_file, notice: 'Log file was successfully created.' }
        format.json { render json: @log_file, status: :created, location: @log_file }
      else
        format.html { render action: "new" }
        format.json { render json: @log_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /log_files/1
  # PUT /log_files/1.json
  def update
    @log_file = LogFile.find(params[:id])

    respond_to do |format|
      if @log_file.update_attributes(params[:log_file])
        format.html { redirect_to @log_file, notice: 'Log file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @log_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_files/1
  # DELETE /log_files/1.json
  def destroy
    @log_file = LogFile.find(params[:id])
    @log_file.destroy

    respond_to do |format|
      format.html { redirect_to log_files_url }
      format.json { head :no_content }
    end
  end
end
