module ArticlesHelper

	def article_params
		params.require(:article).permit(:title, :body, :description, :tag_list, :avatar)
	end

end
