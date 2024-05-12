---@class Portrait ポートレートのモデルを管理するクラス
Portrait = {
    ---ポートレートのモデルを生成する。
    generatePortraitModel = function ()
        --既存の頭ブロックのモデルを削除する。
        if models.script_portrait.Head ~= nil then
            models.script_portrait.Head:remove()
        end

        --現在の衣装を基に新たな頭ブロックのモデルを生成する。
        local copiedPart = General:copyModel(models.models.main.Avatar.Head, false)
        if copiedPart ~= nil then
            models.script_portrait:addChild(copiedPart)
            models.script_portrait.Head:setParentType("Portrait")
            for _, modelPart in ipairs({models.script_portrait.Head.FaceParts.Eyes.RightEye.RightSpyglassPivot, models.script_portrait.Head.FaceParts.Eyes.LeftEye.LeftSpyglassPivot}) do
                modelPart:remove()
            end
            models.script_portrait.Head:setPos(0, -24, 0)
            if models.script_portrait.Head.ArmorH ~= nil then
                models.script_portrait.Head.ArmorH:remove()
            end
            models.script_portrait.Head.FaceParts.Eyes.RightEye.RightEye:setUVPixels()
            models.script_portrait.Head.FaceParts.Eyes.LeftEye.LeftEye:setUVPixels(0, 6)
            models.script_portrait.Head.FaceParts.Mouth:remove()
            models.script_portrait.Head.FaceParts.Complexion:setUVPixels()
        end
    end,

    ---初期化関数
    init = function ()
        ---@diagnostic disable-next-line: discard-returns
        models:newPart("script_portrait", "None")
    end
}

Portrait:init()
Portrait:generatePortraitModel()

return Portrait