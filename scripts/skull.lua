---頭ブロックのタイプ
---@alias Skull.SKullType
---| "DEFAULT" バニラの頭ブロック風

---@class Skull プレイヤーの頭のモデルタイプを管理するクラス
Skull = {
	---利用可能な頭モデルのリスト
	---@type string[]
	SkullList = {"default"},

	---初期化関数
	init = function (self)
		---デフォルトの頭ブロックを生成
		---@diagnostic disable-next-line: discard-returns
        models:newPart("script_skull", "Skull")
		models.script_skull:setPos(0, -24, 0)
		local copiedPart = General:copyModel(models.models.main.Avatar.Head, false)
		if copiedPart ~= nil then
			models.script_skull:addChild(copiedPart)
		end
		models.script_skull.Head.FaceParts.Eyes.LeftEye.LeftEye:setUVPixels(0, 6)
		for _, modelPart in ipairs({models.script_skull.Head.FaceParts.Eyes.RightEye.RightSpyglassPivot, models.script_skull.Head.FaceParts.Eyes.LeftEye.LeftSpyglassPivot}) do
			modelPart:remove()
		end
	end
}

Skull:init()

return Skull