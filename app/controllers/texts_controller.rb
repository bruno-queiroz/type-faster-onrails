class TextsController < ApplicationController
    def index 
        @random_text = Text.order(Arel.sql("RANDOM() LIMIT 1"))[0]
    end

    def create
        text = Text.new(texts_params)

        if text.save
            render :create, status: :created
        else
            render :error, status: :unprocessable_entity
        end
    end

    private 
        def texts_params
            params.require(:text).permit(:author, :text, :title, :image)
        end
end
