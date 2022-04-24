// by nota

//com.sulake.habbo.room.object.visualization.pet.AnimatedPetVisualization

package com.sulake.habbo.room.object.visualization.pet
{
    import com.sulake.habbo.room.object.visualization.furniture.AnimatedFurnitureVisualization;
    import com.sulake.habbo.room.object.visualization.data.AnimationStateData;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.visualization.data.AnimationData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualizationData;

    public class AnimatedPetVisualization extends AnimatedFurnitureVisualization 
    {

        private static const HEAD_SPRITE_TAG:String = "head";
        private static const SADDLE_SPRITE_TAG:String = "saddle";
        private static const HAIR_SPRITE_TAG:String = "hair";
        private static const ADDITIONAL_SPRITE_COUNT:int = 1;
        private static const EXPERIENCE_BUBBLE_VISIBLE_IN_MS:int = 1000;
        private static const EXPERIENCE_BUBBLE_ASSET_NAME:String = "pet_experience_bubble_png";
        private static const POSTURE_ANIMATION_INDEX:int = 0;
        private static const GESTURE_ANIMATION_INDEX:int = 1;
        private static const _SafeStr_8760:int = 2;

        private var _SafeStr_4375:String = "";
        private var _SafeStr_4376:String = "";
        private var _SafeStr_4876:Boolean = false;
        private var _headDirection:int = 0;
        private var _SafeStr_4371:ExperienceData;
        private var _SafeStr_4373:int = 0;
        private var _SafeStr_4374:int = 0;
        private var _SafeStr_4193:AnimatedPetVisualizationData = null;
        private var _paletteName:String = "";
        private var _SafeStr_4372:int = -1;
        private var _SafeStr_4039:Array = [];
        private var _SafeStr_4040:Array = [];
        private var _SafeStr_4041:Array = [];
        private var _color:int = 0xFFFFFF;
        private var _headOnly:Boolean = false;
        private var _SafeStr_4378:Boolean = false;
        private var _SafeStr_4370:Array = [];
        private var _SafeStr_4377:Boolean = false;
        private var _headSprites:Array = [];
        private var _SafeStr_4379:Array = [];
        private var _SafeStr_4380:Array = [];
        private var _previousAnimationDirection:int = -1;

        public function AnimatedPetVisualization()
        {
            while (_SafeStr_4370.length < 2)
            {
                _SafeStr_4370.push(new AnimationStateData());
            };
        }

        override public function dispose():void
        {
            var _local_2:int;
            var _local_1:* = null;
            super.dispose();
            if (_SafeStr_4370 != null)
            {
                _local_2 = 0;
                while (_local_2 < _SafeStr_4370.length)
                {
                    _local_1 = (_SafeStr_4370[_local_2] as AnimationStateData);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _local_2++;
                };
                _SafeStr_4370 = null;
            };
            if (_SafeStr_4371)
            {
                _SafeStr_4371.dispose();
                _SafeStr_4371 = null;
            };
        }

        override protected function getAnimationId(_arg_1:AnimationStateData):int
        {
            return (_arg_1.animationId);
        }

        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            var _local_2:* = null;
            if (!(_arg_1 is AnimatedPetVisualizationData))
            {
                return (false);
            };
            _SafeStr_4193 = (_arg_1 as AnimatedPetVisualizationData);
            var _local_3:BitmapData;
            if (_SafeStr_4193.commonAssets != null)
            {
                _local_2 = (_SafeStr_4193.commonAssets.getAssetByName("pet_experience_bubble_png") as BitmapDataAsset);
                if (_local_2 != null)
                {
                    _local_3 = (_local_2.content as BitmapData).clone();
                    _SafeStr_4371 = new ExperienceData(_local_3);
                };
            };
            if (super.initialize(_arg_1))
            {
                return (true);
            };
            return (false);
        }

        override public function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            super.update(_arg_1, _arg_2, _arg_3, _arg_4);
            updateExperienceBubble(_arg_2);
        }

        override protected function updateAnimation(_arg_1:Number):int
        {
            var _local_3:int;
            var _local_2:IRoomObject = object;
            if (_local_2 != null)
            {
                _local_3 = _local_2.getDirection().x;
                if (_local_3 != _previousAnimationDirection)
                {
                    _previousAnimationDirection = _local_3;
                    resetAllAnimationFrames();
                };
            };
            return (super.updateAnimation(_arg_1));
        }

        override protected function updateModel(_arg_1:Number):Boolean
        {
            var _local_5:* = null;
            var _local_10:* = null;
            var _local_11:Number;
            var _local_7:int;
            var _local_2:Number;
            var _local_6:int;
            var _local_8:Number;
            var _local_4:Number;
            var _local_16:int;
            var _local_15:* = null;
            var _local_12:* = null;
            var _local_17:* = null;
            var _local_9:int;
            var _local_3:Number;
            var _local_13:IRoomObject = object;
            if (_local_13 == null)
            {
                return (false);
            };
            var _local_14:IRoomObjectModel = _local_13.getModel();
            if (_local_14 == null)
            {
                return (false);
            };
            if (_local_14.getUpdateID() != _SafeStr_4170)
            {
                _local_5 = _local_14.getString("figure_posture");
                _local_10 = _local_14.getString("figure_gesture");
                _local_11 = _local_14.getNumber("figure_posture");
                if (!isNaN(_local_11))
                {
                    _local_7 = _SafeStr_4193.getPostureCount(_SafeStr_4175);
                    if (_local_7 > 0)
                    {
                        _local_5 = _SafeStr_4193.getPostureForAnimation(_SafeStr_4175, (_local_11 % _local_7), true);
                        _local_10 = null;
                    };
                };
                _local_2 = _local_14.getNumber("figure_gesture");
                if (!isNaN(_local_2))
                {
                    _local_6 = _SafeStr_4193.getGestureCount(_SafeStr_4175);
                    if (_local_6 > 0)
                    {
                        _local_10 = _SafeStr_4193.getGestureForAnimation(_SafeStr_4175, (_local_2 % _local_6));
                    };
                };
                validateActions(_local_5, _local_10);
                _local_8 = _local_14.getNumber("furniture_alpha_multiplier");
                if (isNaN(_local_8))
                {
                    _local_8 = 1;
                };
                if (_local_8 != _SafeStr_4172)
                {
                    _SafeStr_4172 = _local_8;
                    _SafeStr_4183 = true;
                };
                _SafeStr_4876 = (_local_14.getNumber("figure_sleep") > 0);
                _local_4 = _local_14.getNumber("head_direction");
                if (((!(isNaN(_local_4))) && (_SafeStr_4193.isAllowedToTurnHead)))
                {
                    _headDirection = _local_4;
                }
                else
                {
                    _headDirection = _local_13.getDirection().x;
                };
                _SafeStr_4373 = _local_14.getNumber("figure_experience_timestamp");
                _SafeStr_4374 = _local_14.getNumber("figure_gained_experience");
                _local_16 = _local_14.getNumber("pet_palette_index");
                if (_local_16 != _SafeStr_4372)
                {
                    _SafeStr_4372 = _local_16;
                    _paletteName = _SafeStr_4372.toString();
                };
                _local_15 = _local_14.getNumberArray("pet_custom_layer_ids");
                _SafeStr_4039 = ((_local_15 != null) ? _local_15 : []);
                _local_12 = _local_14.getNumberArray("pet_custom_part_ids");
                _SafeStr_4040 = ((_local_12 != null) ? _local_12 : []);
                _local_17 = _local_14.getNumberArray("pet_custom_palette_ids");
                _SafeStr_4041 = ((_local_17 != null) ? _local_17 : []);
                _local_9 = _local_14.getNumber("pet_is_riding");
                _SafeStr_4378 = ((!(isNaN(_local_9))) && (_local_9 > 0));
                _local_3 = _local_14.getNumber("pet_color");
                if (((!(isNaN(_local_3))) && (!(_local_3 == _color))))
                {
                    _color = _local_3;
                };
                _headOnly = (_local_14.getNumber("pet_head_only") > 0);
                _SafeStr_4170 = _local_14.getUpdateID();
                return (true);
            };
            return (false);
        }

        private function updateExperienceBubble(_arg_1:int):void
        {
            var _local_2:int;
            var _local_3:* = null;
            if (_SafeStr_4371 != null)
            {
                _SafeStr_4371.alpha = 0;
                if (_SafeStr_4373 > 0)
                {
                    _local_2 = (_arg_1 - _SafeStr_4373);
                    if (_local_2 < 1000)
                    {
                        _SafeStr_4371.alpha = int((Math.sin(((_local_2 / 1000) * 3.14159265358979)) * 0xFF));
                        _SafeStr_4371.setExperience(_SafeStr_4374);
                    }
                    else
                    {
                        _SafeStr_4373 = 0;
                    };
                    _local_3 = getSprite((spriteCount - 1));
                    if (_local_3 != null)
                    {
                        if (_SafeStr_4371.alpha > 0)
                        {
                            _local_3.asset = _SafeStr_4371.image;
                            _local_3.offsetX = -20;
                            _local_3.offsetY = -80;
                            _local_3.alpha = _SafeStr_4371.alpha;
                            _local_3.visible = true;
                        }
                        else
                        {
                            _local_3.asset = null;
                            _local_3.visible = false;
                        };
                    };
                };
            };
        }

        private function validateActions(_arg_1:String, _arg_2:String):void
        {
            var _local_3:int;
            if (_arg_1 != _SafeStr_4375)
            {
                _SafeStr_4375 = _arg_1;
                _local_3 = _SafeStr_4193.getAnimationForPosture(_SafeStr_4175, _arg_1);
                setAnimationForIndex(0, _local_3);
            };
            if (_SafeStr_4193.getGestureDisabled(_SafeStr_4175, _arg_1))
            {
                _arg_2 = null;
            };
            if (_arg_2 != _SafeStr_4376)
            {
                _SafeStr_4376 = _arg_2;
                _local_3 = _SafeStr_4193.getAnimationForGesture(_SafeStr_4175, _arg_2);
                setAnimationForIndex(1, _local_3);
            };
        }

        override protected function updateLayerCount(_arg_1:int):void
        {
            super.updateLayerCount(_arg_1);
            _headSprites = [];
        }

        override protected function getAdditionalSpriteCount():int
        {
            return (super.getAdditionalSpriteCount() + 1);
        }

        override protected function setAnimation(_arg_1:int):void
        {
        }

        private function getAnimationStateData(_arg_1:int):AnimationStateData
        {
            var _local_2:* = null;
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4370.length)))
            {
                return (_SafeStr_4370[_arg_1]);
            };
            return (null);
        }

        private function setAnimationForIndex(_arg_1:int, _arg_2:int):void
        {
            var _local_3:AnimationStateData = getAnimationStateData(_arg_1);
            if (_local_3 != null)
            {
                if (setSubAnimation(_local_3, _arg_2))
                {
                    _SafeStr_4377 = false;
                };
            };
        }

        override protected function resetAllAnimationFrames():void
        {
            var _local_2:int;
            var _local_1:* = null;
            _SafeStr_4377 = false;
            _local_2 = (_SafeStr_4370.length - 1);
            while (_local_2 >= 0)
            {
                _local_1 = _SafeStr_4370[_local_2];
                if (_local_1 != null)
                {
                    _local_1.setLayerCount(animatedLayerCount);
                };
                _local_2--;
            };
        }

        override protected function updateAnimations(_arg_1:Number):int
        {
            var _local_5:int;
            var _local_4:* = null;
            var _local_6:int;
            if (_SafeStr_4377)
            {
                return (0);
            };
            var _local_3:Boolean = true;
            var _local_2:int;
            _local_5 = 0;
            while (_local_5 < _SafeStr_4370.length)
            {
                _local_4 = _SafeStr_4370[_local_5];
                if (_local_4 != null)
                {
                    if (!_local_4.animationOver)
                    {
                        _local_6 = updateFramesForAnimation(_local_4, _arg_1);
                        _local_2 = (_local_2 | _local_6);
                        if (!_local_4.animationOver)
                        {
                            _local_3 = false;
                        }
                        else
                        {
                            if (((AnimationData.isTransitionFromAnimation(_local_4.animationId)) || (AnimationData.isTransitionToAnimation(_local_4.animationId))))
                            {
                                setAnimationForIndex(_local_5, _local_4.animationAfterTransitionId);
                                _local_3 = false;
                            };
                        };
                    };
                };
                _local_5++;
            };
            _SafeStr_4377 = _local_3;
            return (_local_2);
        }

        override protected function getFrameNumber(_arg_1:int, _arg_2:int):int
        {
            var _local_4:int;
            var _local_3:* = null;
            var _local_5:* = null;
            _local_4 = (_SafeStr_4370.length - 1);
            while (_local_4 >= 0)
            {
                _local_3 = _SafeStr_4370[_local_4];
                if (_local_3 != null)
                {
                    _local_5 = _local_3.getFrame(_arg_2);
                    if (_local_5 != null)
                    {
                        return (_local_5.id);
                    };
                };
                _local_4--;
            };
            return (super.getFrameNumber(_arg_1, _arg_2));
        }

        override protected function getPostureForAssetFile(_arg_1:int, _arg_2:String):String
        {
            var _local_5:int;
            var _local_6:* = null;
            var _local_4:Array = _arg_2.split("_");
            var _local_3:int = _local_4.length;
            _local_5 = 0;
            while (_local_5 < _local_4.length)
            {
                if (((_local_4[_local_5] == "64") || (_local_4[_local_5] == "32")))
                {
                    _local_3 = (_local_5 + 3);
                    break;
                };
                _local_5++;
            };
            var _local_7:String;
            if (_local_3 < _local_4.length)
            {
                _local_6 = _local_4[_local_3];
                _local_6 = _local_6.split("@")[0];
                _local_7 = _SafeStr_4193.getPostureForAnimation(_arg_1, (_local_6 / 100), false);
                if (_local_7 == null)
                {
                    _local_7 = _SafeStr_4193.getGestureForAnimationId(_arg_1, (_local_6 / 100));
                };
            };
            return (_local_7);
        }

        override protected function getSpriteXOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            var _local_6:int;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_4:int = super.getSpriteXOffset(_arg_1, _arg_2, _arg_3);
            _local_6 = (_SafeStr_4370.length - 1);
            while (_local_6 >= 0)
            {
                _local_5 = _SafeStr_4370[_local_6];
                if (_local_5 != null)
                {
                    _local_7 = _local_5.getFrame(_arg_3);
                    if (_local_7 != null)
                    {
                        _local_4 = (_local_4 + _local_7.x);
                    };
                };
                _local_6--;
            };
            return (_local_4);
        }

        override protected function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            var _local_6:int;
            var _local_5:* = null;
            var _local_7:* = null;
            var _local_4:int = super.getSpriteYOffset(_arg_1, _arg_2, _arg_3);
            _local_6 = (_SafeStr_4370.length - 1);
            while (_local_6 >= 0)
            {
                _local_5 = _SafeStr_4370[_local_6];
                if (_local_5 != null)
                {
                    _local_7 = _local_5.getFrame(_arg_3);
                    if (_local_7 != null)
                    {
                        _local_4 = (_local_4 + _local_7.y);
                    };
                };
                _local_6--;
            };
            return (_local_4);
        }

        override protected function getAsset(_arg_1:String, _arg_2:int=-1):IGraphicAsset
        {
            var _local_3:int;
            var _local_5:* = null;
            var _local_6:int;
            var _local_7:int;
            var _local_4:* = null;
            if (assetCollection != null)
            {
                _local_3 = _SafeStr_4039.indexOf(_arg_2);
                _local_5 = _paletteName;
                _local_6 = -1;
                _local_7 = -1;
                if (_local_3 > -1)
                {
                    _local_6 = _SafeStr_4040[_local_3];
                    _local_7 = _SafeStr_4041[_local_3];
                    _local_5 = ((_local_7 > -1) ? _local_7 : _paletteName);
                };
                if (((!(isNaN(_local_6))) && (_local_6 > -1)))
                {
                    _arg_1 = (_arg_1 + ("_" + _local_6));
                };
                _local_4 = assetCollection.getAssetWithPalette(_arg_1, _local_5);
                return (_local_4);
            };
            return (null);
        }

        override protected function getSpriteZOffset(_arg_1:int, _arg_2:int, _arg_3:int):Number
        {
            if (_SafeStr_4193 == null)
            {
                return (0);
            };
            var _local_4:Number = _SafeStr_4193.getZOffset(_arg_1, getDirection(_arg_1, _arg_3), _arg_3);
            return (_local_4);
        }

        override protected function getSpriteAssetName(_arg_1:int, _arg_2:int):String
        {
            var _local_3:int;
            var _local_5:* = null;
            if (((_headOnly) && (isNonHeadSprite(_arg_2))))
            {
                return (null);
            };
            if (((_SafeStr_4378) && (isSaddleSprite(_arg_2))))
            {
                return (null);
            };
            var _local_4:int = spriteCount;
            if (_arg_2 < (_local_4 - 1))
            {
                _local_3 = getSize(_arg_1);
                if (_arg_2 < (_local_4 - (1 + 1)))
                {
                    if (_arg_2 >= FurnitureVisualizationData.LAYER_NAMES.length)
                    {
                        return (null);
                    };
                    _local_5 = FurnitureVisualizationData.LAYER_NAMES[_arg_2];
                    if (_local_3 == 1)
                    {
                        return ((type + "_icon_") + _local_5);
                    };
                    return ((((((((type + "_") + _local_3) + "_") + _local_5) + "_") + getDirection(_arg_1, _arg_2)) + "_") + getFrameNumber(_local_3, _arg_2));
                };
                return (((((type + "_") + _local_3) + "_sd_") + getDirection(_arg_1, _arg_2)) + "_0");
            };
            return (null);
        }

        override protected function getSpriteColor(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (_arg_2 < (spriteCount - 1))
            {
                return (_color);
            };
            return (0xFFFFFF);
        }

        private function getDirection(_arg_1:int, _arg_2:int):int
        {
            if (isHeadSprite(_arg_2))
            {
                return (_SafeStr_4193.getDirectionValue(_arg_1, _headDirection));
            };
            return (direction);
        }

        private function isHeadSprite(_arg_1:int):Boolean
        {
            var _local_3:Boolean;
            var _local_2:Boolean;
            if (_headSprites[_arg_1] == null)
            {
                _local_3 = (_SafeStr_4193.getTag(_SafeStr_4175, -1, _arg_1) == "head");
                _local_2 = (_SafeStr_4193.getTag(_SafeStr_4175, -1, _arg_1) == "hair");
                if (((_local_3) || (_local_2)))
                {
                    _headSprites[_arg_1] = true;
                }
                else
                {
                    _headSprites[_arg_1] = false;
                };
            };
            return (_headSprites[_arg_1]);
        }

        private function isNonHeadSprite(_arg_1:int):Boolean
        {
            var _local_2:* = null;
            if (_SafeStr_4379[_arg_1] == null)
            {
                if (_arg_1 < (spriteCount - (1 + 1)))
                {
                    _local_2 = _SafeStr_4193.getTag(_SafeStr_4175, -1, _arg_1);
                    if (((((!(_local_2 == null)) && (_local_2.length > 0)) && (!(_local_2 == "head"))) && (!(_local_2 == "hair"))))
                    {
                        _SafeStr_4379[_arg_1] = true;
                    }
                    else
                    {
                        _SafeStr_4379[_arg_1] = false;
                    };
                }
                else
                {
                    _SafeStr_4379[_arg_1] = true;
                };
            };
            return (_SafeStr_4379[_arg_1]);
        }

        private function isSaddleSprite(_arg_1:int):Boolean
        {
            if (_SafeStr_4380[_arg_1] == null)
            {
                if (_SafeStr_4193.getTag(_SafeStr_4175, -1, _arg_1) == "saddle")
                {
                    _SafeStr_4380[_arg_1] = true;
                }
                else
                {
                    _SafeStr_4380[_arg_1] = false;
                };
            };
            return (_SafeStr_4380[_arg_1]);
        }


    }
}//package com.sulake.habbo.room.object.visualization.pet

// _SafeStr_4039 = "_-E1a" (String#5496, DoABC#4)
// _SafeStr_4040 = "_-Ws" (String#6864, DoABC#4)
// _SafeStr_4041 = "_-i1E" (String#6834, DoABC#4)
// _SafeStr_4170 = "_-t1V" (String#3658, DoABC#4)
// _SafeStr_4172 = "_-y1Y" (String#3594, DoABC#4)
// _SafeStr_4175 = "_-W1q" (String#3259, DoABC#4)
// _SafeStr_4183 = "_-Ch" (String#9322, DoABC#4)
// _SafeStr_4193 = "_-1j" (String#1833, DoABC#4)
// _SafeStr_4370 = "_-Q" (String#3514, DoABC#4)
// _SafeStr_4371 = "_-41u" (String#5193, DoABC#4)
// _SafeStr_4372 = "_-32o" (String#14857, DoABC#4)
// _SafeStr_4373 = "_-W1y" (String#10439, DoABC#4)
// _SafeStr_4374 = "_-j1L" (String#4896, DoABC#4)
// _SafeStr_4375 = "_-Q2" (String#2723, DoABC#4)
// _SafeStr_4376 = "_-410" (String#4262, DoABC#4)
// _SafeStr_4377 = "_-G11" (String#5465, DoABC#4)
// _SafeStr_4378 = "_-a1j" (String#3839, DoABC#4)
// _SafeStr_4379 = "_-q13" (String#8835, DoABC#4)
// _SafeStr_4380 = "_-z1A" (String#10556, DoABC#4)
// _SafeStr_4876 = "_-D1O" (String#5749, DoABC#4)
// _SafeStr_8760 = "_-IF" (String#39931, DoABC#4)


