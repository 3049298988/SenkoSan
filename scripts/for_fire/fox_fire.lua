---@class FoxFire 狐火個別のインスタンスを生成するクラス
FoxFire = {
    ---狐火のインスタンスを新しく生成する。
    ---@param targetAnchorId integer 狐火の追従の目標地点となる狐火アンカーのID
    ---@return table foxFireInstance 狐火のインスタンス
    new = function (targetAnchorId)
        local instance = {}

        ---このインスタンスで操作する狐火のモデル
        ---@type ModelPart
        instance.FoxFireModel = models.models.fox_fire.FoxFire:copy("FoxFire_"..client:generateUUID())

        ---狐火の追従の目標地点となる狐火アンカーのID
        ---@type integer
        instance.TargetAnchorID = targetAnchorId

        ---ティックイベントで呼び出される関数
        instance.onTick = function (self)
            local anchorMatrix = models.models.main.FoxFireAnchors["FoxFireAnchor"..self.TargetAnchorID]:partToWorldMatrix()
            self.FoxFireModel:setPos(vectors.vec3(anchorMatrix[4][1], anchorMatrix[4][2], anchorMatrix[4][3]):scale(16))
        end

        ---このインスタンスが破棄される場合に呼び出される関数
        instance.onDeinit = function (self)
            self.FoxFireModel:remove()
        end

        models.script_fox_fire_manager:addChild(instance.FoxFireModel)
        instance.FoxFireModel:setVisible(true)

        return instance
    end
}

return FoxFire