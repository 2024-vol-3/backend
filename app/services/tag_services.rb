class TagServices
    def create(tag_params)
      @tag = Tag.new(tag_params)
      if @tag.save
        render json: @tag, status: :created, location: [@group, @issue, @tag]
      else
        render json: @tag.errors, status: :unprocessable_entity
      end
    end
  end
  