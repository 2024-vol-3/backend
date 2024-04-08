class TagsController < ApplicationController
    before_action :set_group
    before_action :set_issue
    before_action :set_tag, only: [:show, :update, :destroy]
  
    # GET /groups/:group_id/issues/:issue_id/tags
    def index
      @tags = @issue.tags
      render json: @tags
    end
  
    # GET /groups/:group_id/issues/:issue_id/tags/:id
    def show
      render json: @tag
    end
  
    # POST /groups/:group_id/issues/:issue_id/tags
    def create
      @tag = @issue.tags.build(tag_params)
      if @tag.save
        render json: @tag, status: :created, location: [@group, @issue, @tag]
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /groups/:group_id/issues/:issue_id/tags/:id
    def update
      if @tag.update(tag_params)
        render json: @tag
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /groups/:group_id/issues/:issue_id/tags/:id
    def destroy
      @tag.destroy
      head :no_content
    end
  
    private
  
      def set_group
        @group = group.find(params[:group_id])
      end
  
      def set_issue
        @issue = @group.issues.find(params[:issue_id])
      end
  
      def set_tag
        @tag = @issue.tags.find(params[:tag_id])
      end
  
      def tag_params
        params.require(:tag).permit(:tag_count)
      end
  end
  