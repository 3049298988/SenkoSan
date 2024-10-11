---@class ClothCleaning 雑巾がけのアニメーションを制御するクラス
ClothCleaning = General.instance({
	---雑巾がけアニメーションを再生する。
	play = function (self)
		AnimationAction.play(self)
		sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 0.5)
		Sleeve.Moving = false
		Arms.hideHeldItem(true)
	end,

	---雑巾がけアニメーションを停止する。
	stop = function (self)
		AnimationAction.stop(self)
		sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 0.5)
		Sleeve.Moving = true
	end,

	---アニメーション再生中に毎チック実行される関数
	onAnimationTick = function (self)
		AnimationAction.onAnimationTick(self)
		if self.AnimationCount == 90 then
			models.models.cloth_cleaning.Stain:setVisible(false)
		elseif self.AnimationCount == 40 then
			FaceParts.setEmotion("CLOSED", "CLOSED", "OPENED", 40, true)
			local playerPos = player:getPos()
			sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.player.levelup"), playerPos, 1, 1.5)
			for _ = 1, 30 do
				particles:newParticle(CompatibilityUtils:checkParticle("minecraft:happy_villager"), playerPos:copy():add((math.random() - 0.5) * 4, (math.random() - 0.5) * 4 + 1, (math.random() - 0.5) * 4))
			end
		end
	end
}, AnimationAction, function ()
	---@diagnostic disable-next-line: undefined-field
	return BroomCleaning:checkAction()
end, {models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.ClothRAB, models.models.cloth_cleaning.Stain}, {models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.ClothRAB, models.models.cloth_cleaning.Stain}, animations["models.main"]["cloth_cleaning"], {animations["models.cloth_cleaning"]["cloth_cleaning"], animations["models.costume_maid_a"]["cloth_cleaning"], animations["models.costume_maid_b"]["cloth_cleaning"]}, 40)

return ClothCleaning