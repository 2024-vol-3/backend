class DaysController < ApplicationController
        before_action :set_issue
      
        # 作成から1日後、1週間後、2週間後、4週間後の場合にtrueを返す
        def index
          render json: { day_fragment: day_fragment?(@issue.created_at) }
        end
      
        # day_fragmentがtrueのIssueのみを取得
        def show
          if day_fragment?(@issue.created_at)
            render json: @issue
          else
            render json: { error: 'This issue does not have a true day fragment.' }, status: :not_found
          end
        end
      
        # day_fragmentがtrueなら更新
        def update
          if @issue.update(day_fragment)
            render json: @issue
          else
            render json: @issue.errors, status: :unprocessable_entity
          end
        end

        private
      
        # Issueを設定
        def set_issue
          group = Group.find(params[:group_id])
          @issue = group.issues.find(params[:issue_id])
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
   
end
