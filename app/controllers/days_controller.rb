class DaysController < ApplicationController
         skip_before_action :verify_authenticity_token, only: [:create, :update]

        before_action :set_issue
        before_action :day_fragment_params only:[:update]
      
        # day_fragmentがtrueのIssueのみを取得
        def show
          # day_fragment?(@issue.created_at)と@issue.day_fragmentが両方とも trueの時にtrueを返す
          if day_fragment?(@issue.created_at) && @issue.day_fragment == true
            render true
          # day_fragment?(@issue.created_at)もしくは@issue.day_fragmentが falseの時にfalseを返す
          else if day_fragment?(@issue.created_at) || @issue.day_fragment == false
            render false
          else
            render "error"
          end
        end
        
      
        # day_fragmentがtrueなら更新
        def update
          if @issue.update(day_fragment_params)
            render json: @issue
          else
            render json: @issue.errors, status: :unprocessable_entity
          end
        end

        private
      
        # Issueを設定
        def set_issue
          group = Group.find(params[:id])
          @issue = group.issues.find(params[:id])
        end
      
        # 特定の日付からの経過時間を計算し、条件に一致するか確認
        def day_fragment?(created_at)
          now = Time.zone.now
          [1.day, 1.week, 2.weeks, 4.weeks].any? do |time_period|
            #any?メソッドは、ブロック内の条件に一致する要素があるかどうかを確認するメソッド
            (now - created_at).to_i == time_period.to_i
            #to_iメソッドは、数値を整数に変換するメソッド
          end
        end

        def day_fragment_params
          params.require(:issue).permit( :day_fragment)
        end
   
end
