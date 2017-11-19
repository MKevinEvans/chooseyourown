class PathsController < ApplicationController
	def show
		path_id = params[:id]
		story_id = params[:story_id]
		i = 0
		@paths = []
		while i < path_id.length do
			this_path = Path.find_by(path_id: path_id[0..i], story_id: story_id)
			if Path.all.any?{|path| path.path_id == this_path.path_id+"0" && path.story_id == this_path.story_id}
				this_path.next_zero = true
			else this_path.next_zero = false
			end
			if Path.all.any?{|path| path.path_id == this_path.path_id+"1" && path.story_id == this_path.story_id}
				this_path.next_one = true
			else this_path.next_one = false
			end
			@paths.append(this_path)
			i += 1
		end
		@path_id = path_id
	end

	def new
		@story = Story.find(params[:story_id])
	end

	def create
		@story = Story.find(params[:story_id])
		@path = Path.new(prompt: params[:path][:prompt], decision1: params[:path][:decision1], decision2: params[:path][:decision2], path_id: params[:path_id], story_id: params[:story_id], ended: params[:ended])
		if params[:path][:ended] === "1"
			@path.ended = true
		elsif params[:path][:ended] === "0"
			@path.ended = false
		end
		@path.save
		redirect_to "/stories/#{@story.id}/paths/#{@path.path_id}"
	end

	private
		def path_params
			params.require(:path).permit(:prompt, :decision1, :decision2, :path_id, :story_id, :ended)
		end
end
