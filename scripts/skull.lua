---頭ブロックのタイプ
---@alias Skull.SKullType
---| "DEFAULT" バニラの頭ブロック風
---| "FIGURE_A" フィギュア（いつもの服）
---| "FIGURE_B" フィギュア（メイド服）
---| "FIGURE_C" フィギュア（チアリーダー）
---| "FIGURE_D" フィギュア（きつねパーカー）
---| "FIGURE_E" フィギュア（着物）

---@class Skull プレイヤーの頭のモデルタイプを管理するクラス
Skull = {
	---利用可能な頭モデルのリスト
	---@type string[]
	SkullList = {"default", "figure_a", "figure_b", "figure_c", "figure_d", "figure_e"},

	---現在の頭モデルのID
	---@type integer
	CurrentSkull = 1,

	---強制的に頭ブロックを生成するまでのカウンター。これが発火するのはアバタープレイヤーがオフラインの時のみ。
    ---@type integer
    ForceGenerateCount = 2,

	---初期化関数
	init = function (self)
		---デフォルトの頭ブロックを生成
		---@diagnostic disable-next-line: discard-returns
        models:newPart("script_skull", "Skull")
		models.script_skull:setPos(0, -24, 0)
		local copiedPart = General:copyModel(models.models.main.Avatar.Head)
		if copiedPart ~= nil then
			models.script_skull:addChild(copiedPart)
		end
		models.script_skull.Head.FaceParts.Eyes.LeftEye.LeftEye:setUVPixels(0, 6)
		for _, modelPart in ipairs({models.script_skull.Head.FaceParts.Eyes.RightEye.RightSpyglassPivot, models.script_skull.Head.FaceParts.Eyes.LeftEye.LeftSpyglassPivot}) do
			modelPart:remove()
		end

		events.ENTITY_INIT:register(function ()
			local loadedData = Config.loadConfig("skull", 1)
			if loadedData <= #self.SkullList then
				self.CurrentSkull = loadedData
			else
				Config.saveConfig("skull", 1)
			end
		end)
	end
}

Skull:init()

return Skull