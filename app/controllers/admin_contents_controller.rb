class AdminContentsController < ApplicationController
  # GET /admin_contents
  # GET /admin_contents.json
  def index
    @admin_contents = AdminContent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_contents }
    end
  end

  # GET /admin_contents/1
  # GET /admin_contents/1.json
  def show
    @admin_content = AdminContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_content }
    end
  end

  # GET /admin_contents/new
  # GET /admin_contents/new.json
  def new
    @admin_content = AdminContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_content }
    end
  end

  # GET /admin_contents/1/edit
  def edit
    @admin_content = AdminContent.find(params[:id])
  end

  # POST /admin_contents
  # POST /admin_contents.json
  def create
    @admin_content = AdminContent.new(params[:admin_content])

    respond_to do |format|
      if @admin_content.save
        format.html { redirect_to @admin_content, notice: 'Admin content was successfully created.' }
        format.json { render json: @admin_content, status: :created, location: @admin_content }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin_contents/1
  # PUT /admin_contents/1.json
  def update
    @admin_content = AdminContent.find(params[:id])

    respond_to do |format|
      if @admin_content.update_attributes(params[:admin_content])
        format.html { redirect_to @admin_content, notice: 'Admin content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_contents/1
  # DELETE /admin_contents/1.json
  def destroy
    @admin_content = AdminContent.find(params[:id])
    @admin_content.destroy

    respond_to do |format|
      format.html { redirect_to admin_contents_url }
      format.json { head :no_content }
    end
  end
end
