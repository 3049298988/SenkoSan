---@class TailBrush 尻尾の手入れアニメーションを制御するクラス
TailBrush = General.instance({
	---尻尾の手入れアニメーションを再生する。
	play = function (self)
		---@diagnostic disable-next-line: undefined-field
		if SitDown.IsAnimationPlaying then
			Arms.RightArmRotOffset = vectors.vec3(-20, -10, 15)
			Sleeve.RightSleeveRotOffset = vectors.vec3(-20, 40)
			Arms.LeftArmRotOffset = vectors.vec3(-20, 10, -15)
			Sleeve.LeftSleeveRotOffset = vectors.vec3(0, -50)
		end
		AnimationAction.play(self)
		sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 0.5)
		Arms.hideHeldItem(true)
		Physics.EnablePyhsics[1] = false
		Sleeve.Moving = false
	end,

	---尻尾の手入れアニメーションを停止する。
	stop = function (self)
		if self.AnimationCount > 90 then
			sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 0.5)
		end
		Arms.RightArmRotOffset = vectors.vec3()
		Sleeve.RightSleeveRotOffset = vectors.vec3()
		Arms.LeftArmRotOffset = vectors.vec3()
		Sleeve.LeftSleeveRotOffset = vectors.vec3()
		Physics.EnablePyhsics[1] = true
		AnimationAction.stop(self)
		---@diagnostic disable-next-line: undefined-field
		if not SitDown.IsAnimationPlaying then
			Sleeve.Moving = true
		end
		Afk.TailBrushByAfk = false
	end,

	---アニメーション再生中に毎チック実行される関数
	onAnimationTick = function (self)
		AnimationAction.onAnimationTick(self)
		if (self.AnimationCount + 50) % 20 == 0 and self.AnimationCount <= 150 and self.AnimationCount >= 110 then
			sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.grass.step"), player:getPos(), 1, 1)
		elseif self.AnimationCount == 90 then
			sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.item.pickup"), player:getPos(), 1, 0.5)
			models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.BrushRAB:setVisible(false)
		elseif (self.AnimationCount + 80) % 20 == 0 and self.AnimationCount <= 80 and self.AnimationCount >= 40  then
			if self.AnimationCount == 80 then
				FaceParts.setEmotion("CLOSED", "CLOSED", "CLOSED", 60, true)
			end
			sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.grass.step"), player:getPos(), 0.5, 1)
		end
	end
}, AnimationAction, function ()
	---@diagnostic disable-next-line: undefined-field
	return player:getPose() == "STANDING" and not player:isInLava() and player:getFrozenTicks() == 0 and not player:getVehicle() and player:getVelocity():length() == 0 and Hurt.Damaged == "NONE" and not Warden.WardenNearby and Wet.WetCount == 0 and not player:isUsingItem() and not Kotatsu.IsAnimationPlaying
end, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.BrushRAB, models.models.main.Avatar.UpperBody.Arms.RightArm.RightArmBottom.BrushRAB, animations["models.main"]["tail_brush"], nil, 0)

return TailBrush