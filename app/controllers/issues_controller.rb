class IssuesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update]

    before_action :set_group
    before_action :set_issue, only: [:show, :update, :destroy]
  
    def index
      @issues = @group.issues
      render json: @issues
    end
  
    def show
      render json: @issue
    end
  

    def create
      @issue = @group.issues.create(issue_params)
      #成功した場合
      if @issue.save
        head :created

      else
        render json: @issue.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @issue.update(issue_params)
        redirect_to [@group, @issue], notice: 'Issue was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @issue.destroy
      redirect_to group_issues_url(@group), notice: 'Issue was successfully destroyed.'
    end
  
    private
      def set_group
        @group = Group.find(params[:group_id])
      end
  
      def set_issue
        @issue = @group.issues.find(params[:id])
      end
  
      def issue_params
        params.require(:issue).permit(:title, :contents, :day_fragment)
      end
end
