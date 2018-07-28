class Match < ApplicationRecord
	def self.create(uuid)
		if REDIS.get('matches').blank?
			REDIS.set('matches', uuid)
		else
			opponent = REDIS.get("matches")

			Game.start(uuid, opponent)
			REDIS.set("matches", nil)
		end
	end
end
