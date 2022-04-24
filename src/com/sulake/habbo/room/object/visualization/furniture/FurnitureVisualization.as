// by nota

//com.sulake.habbo.room.object.visualization.furniture.FurnitureVisualization

package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
    import com.sulake.habbo.utils.StringBuffer;
    import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;

    public class FurnitureVisualization extends RoomObjectSpriteVisualization 
    {

        protected static const Z_MULTIPLIER:Number = Math.sqrt(0.5);

        private static var _SafeStr_4167:StringBuffer;
        private static var _SafeStr_4168:Array;

        private var _direction:int;
        private var _SafeStr_4176:Number = NaN;
        private var _selectedColor:int = -1;
        protected var _SafeStr_4172:Number = 1;
        private var _SafeStr_4177:String = null;
        private var _SafeStr_4173:Boolean = false;
        private var _SafeStr_3740:FurnitureVisualizationData = null;
        private var _SafeStr_4028:String = "";
        private var _SafeStr_4179:Array = [];
        private var _assetNamesFrame:Array = [];
        private var _SafeStr_4178:Number = 0;
        private var _SafeStr_4180:int = -1;
        private var _cacheDirection:int = -1;
        private var _SafeStr_4181:Array = [];
        private var _SafeStr_4182:Array = [];
        private var _spriteColors:Array = [];
        private var _SafeStr_4184:Array = [];
        private var _SafeStr_4185:Array = [];
        private var _SafeStr_4189:Array = [];
        private var _SafeStr_4187:Array = [];
        private var _SafeStr_4188:Array = [];
        protected var _SafeStr_4183:Boolean = true;
        protected var _SafeStr_4169:int = 0;
        protected var _SafeStr_4171:int = -1;
        private var _updatedLayers:int = 0;
        private var _SafeStr_4186:Number = 0;

        public function FurnitureVisualization()
        {
            reset();
            if (!_SafeStr_4167)
            {
                _SafeStr_4167 = new StringBuffer();
                _SafeStr_4168 = [];
                _SafeStr_4168[0] = null;
                _SafeStr_4168[1] = "_";
                _SafeStr_4168[2] = null;
                _SafeStr_4168[3] = "_";
                _SafeStr_4168[4] = null;
                _SafeStr_4168[5] = "_";
                _SafeStr_4168[6] = null;
                _SafeStr_4168[7] = "_";
            };
        }

        protected function set direction(_arg_1:int):void
        {
            _direction = _arg_1;
        }

        protected function get direction():int
        {
            return (_direction);
        }

        protected function get type():String
        {
            return (_SafeStr_4028);
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_3740 = null;
            _SafeStr_4179 = null;
            _assetNamesFrame = null;
            _SafeStr_4181 = null;
            _SafeStr_4182 = null;
            _spriteColors = null;
            _SafeStr_4184 = null;
            _SafeStr_4185 = null;
            _SafeStr_4189 = null;
            _SafeStr_4187 = null;
            _SafeStr_4188 = null;
        }

        override protected function reset():void
        {
            super.reset();
            direction = -1;
            _SafeStr_3740 = null;
            _SafeStr_4179 = [];
            _assetNamesFrame = [];
            _SafeStr_4181 = [];
            _SafeStr_4182 = [];
            _spriteColors = [];
            _SafeStr_4184 = [];
            _SafeStr_4185 = [];
            _SafeStr_4189 = [];
            _SafeStr_4187 = [];
            _SafeStr_4188 = [];
            this.createSprites(0);
        }

        override public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            reset();
            if (((_arg_1 == null) || (!(_arg_1 is FurnitureVisualizationData))))
            {
                return (false);
            };
            _SafeStr_3740 = (_arg_1 as FurnitureVisualizationData);
            _SafeStr_4028 = _SafeStr_3740.getType();
            return (true);
        }

        override public function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_5:Boolean;
            var _local_6:Number = _arg_1.scale;
            if (updateObject(_local_6, _arg_1.direction.x))
            {
                _local_5 = true;
            };
            if (updateModel(_local_6))
            {
                _local_5 = true;
            };
            var _local_7:int;
            if (_arg_4)
            {
                _updatedLayers = (_updatedLayers | updateAnimation(_local_6));
            }
            else
            {
                _local_7 = (updateAnimation(_local_6) | _updatedLayers);
                _updatedLayers = 0;
            };
            if (((_local_5) || (!(_local_7 == 0))))
            {
                updateSprites(_local_6, _local_5, _local_7);
                _SafeStr_4175 = _local_6;
                increaseUpdateId();
            };
        }

        protected function updateSprites(_arg_1:int, _arg_2:Boolean, _arg_3:int):void
        {
            var _local_5:int;
            var _local_4:int;
            if (_SafeStr_4169 != spriteCount)
            {
                createSprites(_SafeStr_4169);
            };
            if (_arg_2)
            {
                _local_5 = (spriteCount - 1);
                while (_local_5 >= 0)
                {
                    updateSprite(_arg_1, _local_5);
                    _local_5--;
                };
            }
            else
            {
                _local_4 = 0;
                while (_arg_3 > 0)
                {
                    if ((_arg_3 & 0x01))
                    {
                        updateSprite(_arg_1, _local_4);
                    };
                    _local_4++;
                    _arg_3 = (_arg_3 >> 1);
                };
            };
            _SafeStr_4183 = false;
        }

        protected function updateSprite(_arg_1:int, _arg_2:int):void
        {
            var _local_7:* = null;
            var _local_3:Number;
            var _local_4:int;
            var _local_5:String = getSpriteAssetName(_arg_1, _arg_2);
            var _local_6:IRoomObjectSprite = getSprite(_arg_2);
            if (((!(_local_6 == null)) && (!(_local_5 == null))))
            {
                _local_7 = getAsset(_local_5, _arg_2);
                if (((!(_local_7 == null)) && (!(_local_7.asset == null))))
                {
                    _local_6.visible = true;
                    _local_6.objectType = _SafeStr_4028;
                    _local_6.asset = (_local_7.asset.content as BitmapData);
                    if (_local_7.asset.content == null)
                    {
                        _SafeStr_4170++;
                    };
                    _local_6.flipH = _local_7.flipH;
                    _local_6.flipV = _local_7.flipV;
                    _local_6.direction = _direction;
                    _local_3 = 0;
                    if (_arg_2 != _SafeStr_4171)
                    {
                        _local_6.tag = getSpriteTag(_arg_1, _direction, _arg_2);
                        _local_6.alpha = getSpriteAlpha(_arg_1, _direction, _arg_2);
                        _local_6.color = getSpriteColor(_arg_1, _arg_2, _selectedColor);
                        _local_6.offsetX = (_local_7.offsetX + getSpriteXOffset(_arg_1, _direction, _arg_2));
                        _local_6.offsetY = (_local_7.offsetY + getSpriteYOffset(_arg_1, _direction, _arg_2));
                        _local_6.alphaTolerance = ((getSpriteMouseCapture(_arg_1, _direction, _arg_2)) ? 128 : 0x0100);
                        _local_6.blendMode = getBlendMode(getSpriteInk(_arg_1, _direction, _arg_2));
                        _local_3 = getSpriteZOffset(_arg_1, _direction, _arg_2);
                        _local_3 = (_local_3 - (_arg_2 * 0.001));
                    }
                    else
                    {
                        _local_6.offsetX = _local_7.offsetX;
                        _local_6.offsetY = (_local_7.offsetY + getSpriteYOffset(_arg_1, _direction, _arg_2));
                        _local_4 = 48;
                        _local_4 = (_local_4 * _SafeStr_4172);
                        _local_6.alpha = _local_4;
                        _local_6.alphaTolerance = 0x0100;
                        _local_3 = 1;
                    };
                    _local_3 = (_local_3 * Z_MULTIPLIER);
                    _local_6.relativeDepth = _local_3;
                    _local_6.assetName = _local_7.assetName;
                    _local_6.libraryAssetName = getLibraryAssetNameForSprite(_local_7, _local_6);
                    _local_6.assetPosture = getPostureForAssetFile(_arg_1, _local_7.libraryAssetName);
                    _local_6.clickHandling = _SafeStr_4173;
                }
                else
                {
                    resetSprite(_local_6);
                };
            }
            else
            {
                if (_local_6 != null)
                {
                    resetSprite(_local_6);
                };
            };
        }

        protected function getLibraryAssetNameForSprite(_arg_1:IGraphicAsset, _arg_2:IRoomObjectSprite):String
        {
            return (_arg_1.libraryAssetName);
        }

        private function resetSprite(_arg_1:IRoomObjectSprite):void
        {
            _arg_1.asset = null;
            _arg_1.assetName = "";
            _arg_1.assetPosture = null;
            _arg_1.tag = "";
            _arg_1.flipH = false;
            _arg_1.flipV = false;
            _arg_1.offsetX = 0;
            _arg_1.offsetY = 0;
            _arg_1.relativeDepth = 0;
            _arg_1.clickHandling = false;
        }

        protected function getBlendMode(_arg_1:int):String
        {
            var _local_2:String = "normal";
            switch (_arg_1)
            {
                case 0:
                    break;
                case 1:
                    _local_2 = "add";
                    break;
                case 3:
                    _local_2 = "darken";
                    break;
                case 2:
                    _local_2 = "subtract";
                default:
            };
            return (_local_2);
        }

        protected function updateObject(_arg_1:Number, _arg_2:Number):Boolean
        {
            var _local_4:Number;
            var _local_5:int;
            var _local_3:IRoomObject = object;
            if (_local_3 == null)
            {
                return (false);
            };
            if ((((!(_SafeStr_4174 == _local_3.getUpdateID())) || (!(_arg_1 == _SafeStr_4175))) || (!(_arg_2 == _SafeStr_4176))))
            {
                _local_4 = (_local_3.getDirection().x - (_arg_2 + 135));
                _local_4 = (((_local_4 % 360) + 360) % 360);
                if (_SafeStr_3740 != null)
                {
                    _local_5 = _SafeStr_3740.getDirectionValue(_arg_1, _local_4);
                    direction = _local_5;
                };
                _SafeStr_4174 = _local_3.getUpdateID();
                _SafeStr_4176 = _arg_2;
                _SafeStr_4175 = _arg_1;
                updateAssetAndSpriteCache(_arg_1, _direction);
                return (true);
            };
            return (false);
        }

        protected function updateModel(_arg_1:Number):Boolean
        {
            var _local_4:Number;
            var _local_2:IRoomObject = object;
            if (_local_2 == null)
            {
                return (false);
            };
            var _local_3:IRoomObjectModel = _local_2.getModel();
            if (_local_3 == null)
            {
                return (false);
            };
            if (_SafeStr_4170 != _local_3.getUpdateID())
            {
                _selectedColor = _local_3.getNumber("furniture_color");
                _local_4 = _local_3.getNumber("furniture_alpha_multiplier");
                if (isNaN(_local_4))
                {
                    _local_4 = 1;
                };
                if (_local_4 != _SafeStr_4172)
                {
                    _SafeStr_4172 = _local_4;
                    _SafeStr_4183 = true;
                };
                _SafeStr_4177 = getAdClickUrl(_local_3);
                _SafeStr_4173 = (((!(_SafeStr_4177 == null)) && (!(_SafeStr_4177 == ""))) && (_SafeStr_4177.indexOf("http") == 0));
                _SafeStr_4186 = _local_3.getNumber("furniture_lift_amount");
                _SafeStr_4170 = _local_3.getUpdateID();
                return (true);
            };
            return (false);
        }

        protected function getAdClickUrl(_arg_1:IRoomObjectModel):String
        {
            return (_arg_1.getString("furniture_ad_url"));
        }

        protected function updateAnimation(_arg_1:Number):int
        {
            return (0);
        }

        private function updateAssetAndSpriteCache(_arg_1:Number, _arg_2:int):void
        {
            if (((!(_cacheDirection == _arg_2)) || (!(_SafeStr_4178 == _arg_1))))
            {
                _SafeStr_4179 = [];
                _assetNamesFrame = [];
                _SafeStr_4181 = [];
                _SafeStr_4182 = [];
                _spriteColors = [];
                _SafeStr_4184 = [];
                _SafeStr_4185 = [];
                _SafeStr_4189 = [];
                _SafeStr_4187 = [];
                _SafeStr_4188 = [];
                _cacheDirection = _arg_2;
                _SafeStr_4178 = _arg_1;
                _SafeStr_4180 = getSize(_arg_1);
                updateLayerCount((_SafeStr_3740.getLayerCount(_arg_1) + getAdditionalSpriteCount()));
            };
        }

        protected function updateLayerCount(_arg_1:int):void
        {
            _SafeStr_4169 = _arg_1;
            _SafeStr_4171 = (_SafeStr_4169 - getAdditionalSpriteCount());
        }

        protected function getAdditionalSpriteCount():int
        {
            return (1);
        }

        protected function getFrameNumber(_arg_1:int, _arg_2:int):int
        {
            return (0);
        }

        protected function getPostureForAssetFile(_arg_1:int, _arg_2:String):String
        {
            return (null);
        }

        protected function getAsset(_arg_1:String, _arg_2:int=-1):IGraphicAsset
        {
            var _local_3:* = null;
            if (assetCollection != null)
            {
                return (assetCollection.getAsset(_arg_1));
            };
            return (null);
        }

        protected function getSpriteAssetName(_arg_1:int, _arg_2:int):String
        {
            if (((_SafeStr_3740 == null) || (_arg_2 >= FurnitureVisualizationData.LAYER_NAMES.length)))
            {
                return ("");
            };
            var _local_4:String = _SafeStr_4179[_arg_2];
            var _local_3:Boolean = _assetNamesFrame[_arg_2];
            if (((_local_4 == null) || (_local_4.length == 0)))
            {
                _local_4 = getSpriteAssetNameWithoutFrame(_arg_1, _arg_2, true);
                _local_3 = (!(_SafeStr_4180 == 1));
            };
            if (_local_3)
            {
                _local_4 = (_local_4 + getFrameNumber(_arg_1, _arg_2));
            };
            return (_local_4);
        }

        protected function getSpriteAssetNameWithoutFrame(_arg_1:int, _arg_2:int, _arg_3:Boolean):String
        {
            var _local_7:* = null;
            var _local_4:int = ((_arg_3) ? _SafeStr_4180 : getSize(_arg_1));
            var _local_5:* = (_local_4 == 1);
            if (_arg_2 != _SafeStr_4171)
            {
                _local_7 = FurnitureVisualizationData.LAYER_NAMES[_arg_2];
            }
            else
            {
                _local_7 = "sd";
            };
            if (_local_5)
            {
                return ((_SafeStr_4028 + "_icon_") + _local_7);
            };
            _SafeStr_4168[0] = _SafeStr_4028;
            _SafeStr_4168[2] = _local_4;
            _SafeStr_4168[4] = _local_7;
            _SafeStr_4168[6] = _direction;
            _SafeStr_4167.length = 0;
            _SafeStr_4167.appendStringArray(_SafeStr_4168);
            var _local_6:String = _SafeStr_4167.toString();
            if (_arg_3)
            {
                _SafeStr_4179[_arg_2] = _local_6;
                _assetNamesFrame[_arg_2] = (!(_local_5));
            };
            return (_local_6);
        }

        protected function getSpriteTag(_arg_1:int, _arg_2:int, _arg_3:int):String
        {
            if (_SafeStr_4181[_arg_3] != null)
            {
                return (_SafeStr_4181[_arg_3]);
            };
            if (_SafeStr_3740 == null)
            {
                return ("");
            };
            var _local_4:String = _SafeStr_3740.getTag(_arg_1, _arg_2, _arg_3);
            _SafeStr_4181[_arg_3] = _local_4;
            return (_local_4);
        }

        protected function getSpriteAlpha(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (((!(_SafeStr_4182[_arg_3] == null)) && (!(_SafeStr_4183))))
            {
                return (_SafeStr_4182[_arg_3]);
            };
            if (_SafeStr_3740 == null)
            {
                return (0xFF);
            };
            var _local_4:int = _SafeStr_3740.getAlpha(_arg_1, _arg_2, _arg_3);
            _local_4 = (_local_4 * _SafeStr_4172);
            _SafeStr_4182[_arg_3] = _local_4;
            return (_local_4);
        }

        protected function getSpriteColor(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (_spriteColors[_arg_2] != null)
            {
                return (_spriteColors[_arg_2]);
            };
            if (_SafeStr_3740 == null)
            {
                return (0xFFFFFF);
            };
            var _local_4:int = _SafeStr_3740.getColor(_arg_1, _arg_2, _arg_3);
            _spriteColors[_arg_2] = _local_4;
            return (_local_4);
        }

        protected function getSpriteXOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (_SafeStr_4184[_arg_3] != null)
            {
                return (_SafeStr_4184[_arg_3]);
            };
            if (_SafeStr_3740 == null)
            {
                return (0);
            };
            var _local_4:int = _SafeStr_3740.getXOffset(_arg_1, _arg_2, _arg_3);
            _SafeStr_4184[_arg_3] = _local_4;
            return (_local_4);
        }

        protected function getSpriteYOffset(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            var _local_4:int;
            if (_arg_3 != _SafeStr_4171)
            {
                if (_SafeStr_4185[_arg_3] != null)
                {
                    return (_SafeStr_4185[_arg_3]);
                };
                if (_SafeStr_3740 != null)
                {
                    _local_4 = _SafeStr_3740.getYOffset(_arg_1, _arg_2, _arg_3);
                    _SafeStr_4185[_arg_3] = _local_4;
                    return (_local_4);
                };
                return (0);
            };
            return (Math.ceil((_SafeStr_4186 * (_arg_1 / 2))));
        }

        protected function getSpriteMouseCapture(_arg_1:int, _arg_2:int, _arg_3:int):Boolean
        {
            if (_SafeStr_4187[_arg_3] != null)
            {
                return (_SafeStr_4187[_arg_3]);
            };
            if (_SafeStr_3740 == null)
            {
                return (true);
            };
            var _local_4:* = (!(_SafeStr_3740.getIgnoreMouse(_arg_1, _arg_2, _arg_3)));
            _SafeStr_4187[_arg_3] = _local_4;
            return (_local_4);
        }

        protected function getSpriteInk(_arg_1:int, _arg_2:int, _arg_3:int):int
        {
            if (_SafeStr_4188[_arg_3] != null)
            {
                return (_SafeStr_4188[_arg_3]);
            };
            if (_SafeStr_3740 == null)
            {
                return (0);
            };
            var _local_4:int = _SafeStr_3740.getInk(_arg_1, _arg_2, _arg_3);
            _SafeStr_4188[_arg_3] = _local_4;
            return (_local_4);
        }

        protected function getSpriteZOffset(_arg_1:int, _arg_2:int, _arg_3:int):Number
        {
            if (_SafeStr_4189[_arg_3] != null)
            {
                return (_SafeStr_4189[_arg_3]);
            };
            if (_SafeStr_3740 == null)
            {
                return (0);
            };
            var _local_4:Number = _SafeStr_3740.getZOffset(_arg_1, _arg_2, _arg_3);
            _SafeStr_4189[_arg_3] = _local_4;
            return (_local_4);
        }

        protected function getSize(_arg_1:int):int
        {
            if (_SafeStr_3740 != null)
            {
                return (_SafeStr_3740.getSize(_arg_1));
            };
            return (_arg_1);
        }

        protected function get data():FurnitureVisualizationData
        {
            return (_SafeStr_3740);
        }


    }
}//package com.sulake.habbo.room.object.visualization.furniture

// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4167 = "_-q1j" (String#4478, DoABC#4)
// _SafeStr_4168 = "_-l1s" (String#4594, DoABC#4)
// _SafeStr_4169 = "_-j4" (String#3264, DoABC#4)
// _SafeStr_4170 = "_-t1V" (String#3658, DoABC#4)
// _SafeStr_4171 = "_-61E" (String#12749, DoABC#4)
// _SafeStr_4172 = "_-y1Y" (String#3594, DoABC#4)
// _SafeStr_4173 = "_-U6" (String#5567, DoABC#4)
// _SafeStr_4174 = "_-TP" (String#7891, DoABC#4)
// _SafeStr_4175 = "_-W1q" (String#3259, DoABC#4)
// _SafeStr_4176 = "_-Bj" (String#22468, DoABC#4)
// _SafeStr_4177 = "_-G1Y" (String#3681, DoABC#4)
// _SafeStr_4178 = "_-v1M" (String#20436, DoABC#4)
// _SafeStr_4179 = "_-Z1J" (String#3682, DoABC#4)
// _SafeStr_4180 = "_-AR" (String#15499, DoABC#4)
// _SafeStr_4181 = "_-aS" (String#5968, DoABC#4)
// _SafeStr_4182 = "_-V13" (String#6488, DoABC#4)
// _SafeStr_4183 = "_-Ch" (String#9322, DoABC#4)
// _SafeStr_4184 = "_-GI" (String#6344, DoABC#4)
// _SafeStr_4185 = "_-RB" (String#6258, DoABC#4)
// _SafeStr_4186 = "_-02V" (String#20213, DoABC#4)
// _SafeStr_4187 = "_-N1B" (String#6195, DoABC#4)
// _SafeStr_4188 = "_-s4" (String#5928, DoABC#4)
// _SafeStr_4189 = "_-CP" (String#5996, DoABC#4)


