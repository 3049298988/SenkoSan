---@class FoxJump キツネジャンプのアニメーションを制御するクラス
---@field TargetPos Vector3 ジャンプする先の座標
FoxJump = General.instance({
	TargetPos = vectors.vec3(),

	---キツネジャンプアニメーションを再生する。
	play = function (self)
		AnimationAction.play(self)
		Sleeve.Moving = false
		Arms.hideHeldItem(true)
	end,

	---キツネジャンプアニメーションを停止する。
	stop = function (self)
		AnimationAction.stop(self)
		Sleeve.Moving = true
	end,

	---アニメーション再生中に毎チック実行される関数
	onAnimationTick = function (self)
		AnimationAction.onAnimationTick(self)
		if self.AnimationCount == 98 then
			sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.snowball.throw"), player:getPos(), 1, 1.5)
			FaceParts.setEmotion("UNEQUAL", "UNEQUAL", "OPENED", 11, true)
		elseif self.AnimationCount == 87 or (self.AnimationCount <= 83 and self.AnimationCount >= 32 and (self.AnimationCount - 83) % 3 == 0) or self.AnimationCount == 18 then
			sounds:playSound(CompatibilityUtils:checkSound("minecraft:block.snow.break"), player:getPos(), 1, 1)
			for _ = 1, 5 do
				particles:newParticle(CompatibilityUtils.getBlockParticleId(CompatibilityUtils:checkBlock("minecraft:snow")), FoxJump.TargetPos)
			end
			if self.AnimationCount == 87 then
				FaceParts.setEmotion("UNEQUAL", "UNEQUAL", "CLOSED", 69, true)
			elseif self.AnimationCount == 18 then
				sounds:playSound(CompatibilityUtils:checkSound("minecraft:entity.snowball.throw"), player:getPos(), 1, 1.5)
			end
		elseif self.AnimationCount == 1 then
			self:stop()
			---@diagnostic disable-next-line: undefined-field
			ShakeBody:play(true)
		end
	end
}, AnimationAction, function ()
	FoxJump.TargetPos = vectors.rotateAroundAxis(-(player:getBodyYaw() % 360), 0, 0, 1, 0, 1):add(player:getPos())
	local targetBlockPos = FoxJump.TargetPos:copy():floor()
	local block1_1 = world.getBlockState(targetBlockPos:copy():add(0, -1))
	local block10 = world.getBlockState(targetBlockPos)
	---@diagnostic disable-next-line: undefined-field
	return BroomCleaning:checkAction() and (block10.id == "minecraft:air" or block10.id == "minecraft:snow") and (block1_1.id == "minecraft:snow_block" or (block1_1.id == "minecraft:snow" and tonumber(block1_1.properties["layers"]) >= 6 or false)) and world.getBlockState(FoxJump.TargetPos:copy():add(0, 1)).id == "minecraft:air" and world.getBlockState(FoxJump.TargetPos:copy():add(0, 2)).id == "minecraft:air" and world.getBlockState(player:getPos():add(0, 2)).id == "minecraft:air"
end, nil, nil, animations["models.main"]["fox_jump"], nil, 10)

return FoxJump