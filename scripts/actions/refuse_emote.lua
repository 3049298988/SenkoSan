---@class RefuseEmote エモート拒否アニメーションを制御するクラス
RefuseEmote = General.instance({
	---エモート拒否アニメーションを再生する。
	play = function (self)
		AnimationAction.play(self)
		FaceParts.setEmotion("UNEQUAL", "UNEQUAL", "CLOSED", 30, true)
		if host:isHost() then
			print("§7"..Language.getTranslate("action_wheel__refuse_action"))
		end
	end,

	---エモート拒否アニメーションを停止する。
	stop = function (self)
		self.IsAnimationPlaying = false
		ActionWheel.IsAnimationPlaying = false
		self.AnimationCount = -1
	end,

	---アニメーション再生中に毎チック実行される関数
	onAnimationTick = function (self)
		AnimationAction.onAnimationTick(self)
		if self.AnimationCount % 5 == 0 then
			for _ = 1, 4 do
				particles:newParticle(CompatibilityUtils:checkParticle("minecraft:splash"), player:getPos():add(0, 2))
			end
		end
	end
}, AnimationAction, function ()
	return true
end, nil, nil, animations["models.main"]["refuse_emote"], nil, 0)

return RefuseEmote