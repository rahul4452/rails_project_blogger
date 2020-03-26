module RepliesHelper

	def reply_params
		params.require(:reply).permit(:body)
	end
end
