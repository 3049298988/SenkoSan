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

        ---インスタンスを破棄できるかどうか
        ---@type boolean
        instance.CanAbort = false

        ---狐火のモデルのスケール。狐火の点火/消火時のアニメーションに利用する。
        ---@type number
        instance.ModelScale = 0

        ---狐火が点いているかどうか
        ---@type boolean
        instance.IsLit = true

        ---このインスタンスを破棄する直前のフェーズかどうか
        instance.IsFinal = false

        ---ティックイベントで呼び出される関数
        instance.onTick = function (self)
            local anchorMatrix = models.models.main.FoxFireAnchors["FoxFireAnchor"..self.TargetAnchorID]:partToWorldMatrix()
            self.FoxFireModel:setPos(vectors.vec3(anchorMatrix[4][1], anchorMatrix[4][2], anchorMatrix[4][3]):scale(16))
            if self.IsFinal and self.ModelScale == 0 then
                self.FoxFireModel:remove()
                self.CanAbort = true
            end
        end

        ---レンダーイベントで呼び出される関数
        instance.onRender = function (self)
            local fps = client:getFPS()
            self.ModelScale = self.IsLit and math.min(self.ModelScale + 8 / fps, 1) or math.max(self.ModelScale - 8 / fps, 0)
            self.FoxFireModel:setScale(vectors.vec3(1, 1, 1):scale(instance.ModelScale))
        end

        ---このインスタンスが破棄される場合に呼び出される関数
        instance.onDeinit = function (self)
            self.IsLit = false
            self.IsFinal = true
        end

        models.script_fox_fire_manager:addChild(instance.FoxFireModel)
        instance.FoxFireModel:setScale(vectors.vec3(1, 1, 1):scale(instance.ModelScale))
        instance.FoxFireModel:setVisible(true)

        return instance
    end
}

return FoxFire