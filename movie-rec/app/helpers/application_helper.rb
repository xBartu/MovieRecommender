module ApplicationHelper
	def notification_count
		# TODO START {convert it to sql}
		arr = Array.new
		current_user.people.each do |person|
			person.movies.each do |movie|
				if movie.created_at > current_user.last_notification
					arr.push(movie) 
				end
			end
		end
		movies = Movie.where(genre_id:current_user.genres).where("created_at>?",current_user.last_notification)
		movies.each do |movie|
			arr.push(movie)
		end
		arr.count
		# TODO END
	end

	def title(page_title)
		page_title.empty? ?  "MovieRec" : "#{page_title} | MovieRec"
	end
end
