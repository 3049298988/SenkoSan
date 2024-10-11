---@class Earpick 耳かきのアニメーションを制御するクラス
Earpick = General.instance({
	---耳かきアニメーションを再生する。
	play = function (self)
		AnimationAction.play(self)
		sounds:playSound("entity.item.pickup", player:getPos(), 1, 0.5)
		Arms.RightArmRotOffset = vectors.vec3(-20, -10, 15)
		Arms.LeftArmRotOffset = vectors.vec3(-20, 10, -15)
		Arms.hideHeldItem(true)
	end,

	---耳かきアニメーションを停止する。
	stop = function (self)
		AnimationAction.stop(self)
		sounds:playSound("entity.item.pickup", player:getPos(), 1, 0.5)
	end,

	---アニメーション再生中に毎チック実行される関数
	onAnimationTick = function (self)
		AnimationAction.onAnimationTick(self)
		local playerPos = player:getPos()
		for _ = 1, 5 do
			particles:newParticle(CompatibilityUtils:checkParticle("minecraft:end_rod"), playerPos:copy():add((math.random() - 0.5) * 10, (math.random() - 0.5) * 10, (math.random() - 0.5) * 10))
		end
		if self.AnimationCount == 184 then
			FaceParts.setEmotion("CLOSED", "CLOSED", "CLOSED", 40, true)
		elseif self.AnimationCount == 41 then
			FaceParts.setEmotion("CLOSED", "CLOSED", "OPENED", 40, true)
			sounds:playSound("entity.player.levelup", playerPos, 1, 1.5)
			for _ = 1, 30 do
				particles:newParticle(CompatibilityUtils:checkParticle("minecraft:happy_villager"), playerPos:copy():add((math.random() - 0.5) * 4, (math.random() - 0.5) * 4 + 1, (math.random() - 0.5) * 4))
			end
		end
	end
}, AnimationAction, function ()
	---@diagnostic disable-next-line: undefined-field
	return SitDown.IsAnimationPlaying and not player:isUsingItem()
end, {models.models.main.Avatar.UpperBody.Arms.RightArm.EarpickRA, models.models.ear_cleaning, models.models.dummy_player}, {models.models.main.Avatar.UpperBody.Arms.RightArm.EarpickRA, models.models.ear_cleaning, models.models.dummy_player}, animations["models.main"]["earpick"], {animations["models.ear_cleaning"]["earpick"], animations["models.dummy_player"]["earpick"]}, 0)

return Earpick