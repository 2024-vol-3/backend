class IssuesController < ApplicationController
    before_action :set_group
    before_action :set_issue, only: [:show,  :update, :destroy]
  
    def index
      @issues = @group.issues
    end
  
    def show
    end
  

    def create
      @issue = @group.issues.build(issue_params)
      if @issue.save
        redirect_to [@group, @issue], notice: 'Issue was successfully created.'
      else
        render :new
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
        @group = group.find(params[:group_id])
      end
  
      def set_issue
        @issue = @group.issues.find(params[:id])
      end
  
      def issue_params
        params.require(:issue).permit(:title, :contents, :day_fragment)
      end
end
