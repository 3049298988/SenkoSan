---インスタンスのフェーズを示す列挙型
---@alias FoxFire.InstancePhase
---| "INIT" 初期化～狐火の火力が最大になるまで
---| "NORMAL" 通常時
---| "FINAL" インスタンス破棄フラグオン～狐火を消火するまで

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

        ---狐火の追尾目標座標
        ---@type Vector3
        instance.TargetPos = General.getModelWorldPos(models.models.main.FoxFireAnchors["FoxFireAnchor"..instance.TargetAnchorID]):scale(16)

        ---次のティックまでの狐火の追尾目標座標
        ---@type Vector3
        instance.NextTargetPos = instance.TargetPos

        ---現在のティックでの狐火の位置
        instance.CurrentPos = instance.TargetPos

        ---狐火のモデルのスケール。狐火の点火/消火時のアニメーションに利用する。
        ---@type number
        instance.ModelScale = 0

        ---狐火のちらつきアニメーションのカウンター
        ---@type number
        instance.FlickerCount = -1

        ---次の狐火のちらつきまでのカウンター
        ---@type integer
        instance.NextFlickerCount = math.random(0, 4)

        ---ちらつきによるモデルのスケールの倍率
        ---@type number
        instance.FlickerScale = 1

        ---狐火の浮遊アニメーションのカウンター
        ---@type number
        instance.FloatingCount = math.random()

        ---狐火の浮遊アニメーションのy軸オフセット
        ---@type number
        instance.FloatingOffset = 0

        ---魂の炎のパーティクルを表示するまでのカウンター
        ---@type integer
        instance.FrameParticleCount = math.random(1, 8)

        ---煙のパーティクルを表示するまでのカウンター
        ---@type integer
        instance.SmokeParticleCount = 2

        ---インスタンスの現在フェーズ
        ---@type FoxFire.InstancePhase
        instance.Phase = "INIT"

        ---狐火が点いているかどうか
        ---@type boolean[]
        instance.IsLit = {true, true}

        ---ティックイベントで呼び出される関数
        instance.onTick = function (self)
            self.TargetPos = General.getModelWorldPos(models.models.main.FoxFireAnchors["FoxFireAnchor"..self.TargetAnchorID]):scale(16)
            self.CurrentPos = self.FoxFireModel:getPos():sub(0, self.FloatingOffset, 0)
            self.NextTargetPos = self.CurrentPos:copy():add(self.TargetPos:copy():sub(self.CurrentPos):scale(0.2))
            if self.TargetPos:copy():sub(self.CurrentPos):length() / 16 >= 16 then
                self.NextTargetPos = self.TargetPos
                self.CurrentPos = self.TargetPos
            end
            if self.Phase ~= "FINAL" then
                local block = world.getBlockState(self.CurrentPos:copy():scale(0.0625))
                if block.id == "minecraft:water" then
                    table.insert(self.IsLit, self.CurrentPos.y * 0.0625 % 1 > (8 - tonumber(block.properties.level)) * 0.125)
                else
                    table.insert(self.IsLit, true)
                end
                table.remove(self.IsLit, 1)
            end
            if self.IsLit[2] ~= self.IsLit[1] and self.Phase == "NORMAL" then
                sounds:playSound(self.IsLit[2] and "minecraft:item.firecharge.use" or "minecraft:block.fire.extinguish", self.FoxFireModel:getPos():scale(0.0625), 0.25, 2)
            end
            if self.ModelScale > 0 then
                self.FrameParticleCount = self.FrameParticleCount - 1
                local particlePos = self.FoxFireModel:getPos():scale(0.0625)
                if self.FrameParticleCount == 0 then
                    particles:newParticle("minecraft:soul_fire_flame", particlePos:copy():add(math.random() * 0.375 - 0.1875, math.random() * 0.375 - 0.0625, math.random() * 0.375 - 0.1875))
                    self.FrameParticleCount = math.random(4, 8)
                end
                if world.getRainGradient() > 0 and world.isOpenSky(particlePos) then
                    self.SmokeParticleCount = self.SmokeParticleCount - 1
                    if self.SmokeParticleCount == 0 then
                        particles:newParticle("minecraft:smoke", particlePos:copy():add(math.random() * 0.25 - 0.125, math.random() * 0.25 + 0.125, math.random() * 0.375 - 0.1875))
                        self.SmokeParticleCount = 2
                    end
                end
            end
            if self.NextFlickerCount == 0 then
                self.FlickerCount = 0
            end
            if self.Phase == "INIT" and self.ModelScale == 1 then
                self.Phase = "NORMAL"
            elseif self.Phase == "FINAL" and self.ModelScale == 0 then
                self.FoxFireModel:remove()
                self.CanAbort = true
            end
            self.NextFlickerCount = math.max(self.NextFlickerCount - 1, -1)
        end

        ---レンダーイベントで呼び出される関数
        ---@param delta number レンダーイベントのデルタ値
        instance.onRender = function (self, delta)
            local fps = client:getFPS()
            self.ModelScale = self.IsLit[2] and math.min(self.ModelScale + 8 / fps, 1) or math.max(self.ModelScale - 8 / fps, 0)
            if self.FlickerCount >= 0 then
                self.FlickerCount = math.min(self.FlickerCount + 8 / fps, 1)
                self.FlickerScale = self.FlickerCount <= 0.5 and 1 - self.FlickerCount / 8 or (self.FlickerCount - 0.5) / 8 + 0.9375
                if self.FlickerCount == 1 then
                    self.NextFlickerCount = math.random(0, 4)
                    self.FlickerCount = -1
                end
            end
            self.FloatingCount = self.FloatingCount + 0.25 / fps
            self.FloatingCount = self.FloatingCount > 1 and self.FloatingCount - 1 or self.FloatingCount
            self.FloatingOffset = math.sin(self.FloatingCount * 2 * math.pi) * 1
            self.FoxFireModel:setPos(self.CurrentPos:copy():add(self.NextTargetPos:copy():sub(self.CurrentPos):scale(delta)):add(0, self.FloatingOffset, 0))
            self.FoxFireModel:setScale(vectors.vec3(1, 1, 1):scale(self.ModelScale * self.FlickerScale))
            self.FoxFireModel:setColor(self.FoxFireModel:getScale())
        end

        ---このインスタンスが破棄される場合に呼び出される関数
        instance.onDeinit = function (self)
            table.insert(self.IsLit, false)
            table.remove(self.IsLit, 1)
            self.Phase = "FINAL"
        end

        models.script_fox_fire_manager:addChild(instance.FoxFireModel)
        instance.FoxFireModel:setPos(instance.NextTargetPos)
        instance.FoxFireModel:setScale(vectors.vec3(1, 1, 1):scale(instance.ModelScale * instance.FlickerScale))
        instance.FoxFireModel:setColor(instance.FoxFireModel:getScale())
        instance.FoxFireModel:setVisible(true)

        return instance
    end
}

return FoxFire