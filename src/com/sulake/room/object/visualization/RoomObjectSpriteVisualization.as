// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.object.visualization.RoomObjectSpriteVisualization

package com.sulake.room.object.visualization
{
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
    import com.sulake.room.utils.IRoomGeometry;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.geom.Point;

    public class RoomObjectSpriteVisualization implements IRoomObjectSpriteVisualization 
    {

        protected static const _SafeStr_8263:String = "_";
        protected static const ICON_LAYER_ID:String = "_icon_";

        private static var _SafeStr_4163:int = 0;

        private var _SafeStr_4164:Array;
        private var _SafeStr_3984:IRoomObject;
        private var _assetCollection:IGraphicAssetCollection;
        protected var _SafeStr_4174:int = -1;
        protected var _SafeStr_4170:int = -1;
        protected var _SafeStr_4175:int = -1;
        private var _SafeStr_4166:int = 0;
        private var _SafeStr_4165:int = 0;

        public function RoomObjectSpriteVisualization()
        {
            _SafeStr_4166 = _SafeStr_4163++;
            _SafeStr_4164 = [];
            _SafeStr_3984 = null;
            _assetCollection = null;
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (_SafeStr_4164 != null)
            {
                while (_SafeStr_4164.length > 0)
                {
                    _local_1 = (_SafeStr_4164[0] as RoomObjectSprite);
                    if (_local_1 != null)
                    {
                        _local_1.dispose();
                    };
                    _SafeStr_4164.pop();
                };
                _SafeStr_4164 = null;
            };
            _SafeStr_3984 = null;
            assetCollection = null;
        }

        public function set assetCollection(_arg_1:IGraphicAssetCollection):void
        {
            if (_assetCollection != null)
            {
                _assetCollection.removeReference();
            };
            _assetCollection = _arg_1;
            if (_assetCollection != null)
            {
                _assetCollection.addReference();
            };
        }

        public function setExternalBaseUrls(_arg_1:String, _arg_2:String, _arg_3:Boolean):void
        {
        }

        public function get assetCollection():IGraphicAssetCollection
        {
            return (_assetCollection);
        }

        public function getUpdateID():int
        {
            return (_SafeStr_4165);
        }

        public function getInstanceId():int
        {
            return (_SafeStr_4166);
        }

        protected function createSprites(_arg_1:int):void
        {
            var _local_2:RoomObjectSprite;
            while (_SafeStr_4164.length > _arg_1)
            {
                _local_2 = (_SafeStr_4164[(_SafeStr_4164.length - 1)] as RoomObjectSprite);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                };
                _SafeStr_4164.pop();
            };
            while (_SafeStr_4164.length < _arg_1)
            {
                _local_2 = new RoomObjectSprite();
                _SafeStr_4164.push(_local_2);
            };
        }

        public function addSprite():IRoomObjectSprite
        {
            return (addSpriteAt(_SafeStr_4164.length));
        }

        public function addSpriteAt(_arg_1:int):IRoomObjectSprite
        {
            var _local_2:IRoomObjectSprite = new RoomObjectSprite();
            if (_arg_1 >= _SafeStr_4164.length)
            {
                _SafeStr_4164.push(_local_2);
            }
            else
            {
                _SafeStr_4164.splice(_arg_1, 0, _local_2);
            };
            return (_local_2);
        }

        public function removeSprite(_arg_1:IRoomObjectSprite):void
        {
            var _local_2:int = _SafeStr_4164.indexOf(_arg_1);
            if (_local_2 == -1)
            {
                throw (new Error("Trying to remove non-existing sprite!"));
            };
            _SafeStr_4164.splice(_local_2, 1);
            RoomObjectSprite(_arg_1).dispose();
        }

        public function get spriteCount():int
        {
            return (_SafeStr_4164.length);
        }

        public function getSprite(_arg_1:int):IRoomObjectSprite
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_4164.length)))
            {
                return (_SafeStr_4164[_arg_1]);
            };
            return (null);
        }

        public function get object():IRoomObject
        {
            return (_SafeStr_3984);
        }

        public function set object(_arg_1:IRoomObject):void
        {
            _SafeStr_3984 = _arg_1;
        }

        public function update(_arg_1:IRoomGeometry, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
        }

        protected function increaseUpdateId():void
        {
            _SafeStr_4165++;
        }

        protected function reset():void
        {
            _SafeStr_4174 = 0xFFFFFFFF;
            _SafeStr_4170 = 0xFFFFFFFF;
            _SafeStr_4175 = -1;
        }

        public function getSpriteList():Array
        {
            return (null);
        }

        public function initialize(_arg_1:IRoomObjectVisualizationData):Boolean
        {
            return (false);
        }

        public function get image():BitmapData
        {
            return (getImage(0, -1));
        }

        public function getImage(_arg_1:int, _arg_2:int):BitmapData
        {
            var _local_15:Number;
            var _local_13:Number;
            var _local_18:Number;
            var _local_6:int;
            var _local_14:int;
            var _local_8:int;
            var _local_4:int;
            var _local_17:* = null;
            var _local_12:* = null;
            var _local_7:Rectangle = boundingRectangle;
            if ((_local_7.width * _local_7.height) == 0)
            {
                return (null);
            };
            var _local_9:int = spriteCount;
            var _local_3:IRoomObjectSprite;
            var _local_11:Array = [];
            var _local_10:int;
            var _local_5:BitmapData;
            _local_10 = 0;
            while (_local_10 < _local_9)
            {
                _local_3 = getSprite(_local_10);
                if (((!(_local_3 == null)) && (_local_3.visible)))
                {
                    _local_5 = _local_3.asset;
                    if (_local_5 != null)
                    {
                        _local_11.push(_local_3);
                    };
                };
                _local_10++;
            };
            _local_11.sortOn("relativeDepth", 16);
            _local_11.reverse();
            var _local_16:BitmapData;
            try
            {
                _local_16 = new BitmapData(_local_7.width, _local_7.height, true, _arg_1);
            }
            catch(e:ArgumentError)
            {
                _SafeStr_14.log(("Unable to create BitmapData object! " + e));
            };
            if (!_local_16)
            {
                return (new BitmapData(1, 1, true));
            };
            _local_10 = 0;
            while (_local_10 < _local_11.length)
            {
                _local_3 = (_local_11[_local_10] as IRoomObjectSprite);
                _local_5 = _local_3.asset;
                if (_local_5 != null)
                {
                    _local_6 = _local_3.color;
                    _local_14 = (_local_6 >> 16);
                    _local_8 = ((_local_6 >> 8) & 0xFF);
                    _local_4 = (_local_6 & 0xFF);
                    _local_17 = null;
                    if ((((_local_14 < 0xFF) || (_local_8 < 0xFF)) || (_local_4 < 0xFF)))
                    {
                        _local_18 = (_local_14 / 0xFF);
                        _local_15 = (_local_8 / 0xFF);
                        _local_13 = (_local_4 / 0xFF);
                        _local_17 = new ColorTransform(_local_18, _local_15, _local_13, (_local_3.alpha / 0xFF));
                    }
                    else
                    {
                        if (_local_3.alpha < 0xFF)
                        {
                            _local_17 = new ColorTransform(1, 1, 1, (_local_3.alpha / 0xFF));
                        };
                    };
                    if (_arg_1 == 0)
                    {
                        if (_local_3.blendMode == "add")
                        {
                            if (_local_17 == null)
                            {
                                _local_17 = new ColorTransform(1, 1, 1, 0);
                            }
                            else
                            {
                                _local_17.alphaMultiplier = 0;
                            };
                        };
                    };
                    _local_12 = new Matrix();
                    if (_local_3.flipH)
                    {
                        _local_12.scale(-1, 1);
                        _local_12.translate(_local_5.width, 0);
                    };
                    if (_local_3.flipV)
                    {
                        _local_12.scale(1, -1);
                        _local_12.translate(0, _local_5.height);
                    };
                    _local_12.translate((_local_3.offsetX - _local_7.left), (_local_3.offsetY - _local_7.top));
                    _local_16.draw(_local_5, _local_12, _local_17, _local_3.blendMode, null, false);
                };
                _local_10++;
            };
            return (_local_16);
        }

        public function get boundingRectangle():Rectangle
        {
            var _local_3:* = null;
            var _local_5:int = spriteCount;
            var _local_1:IRoomObjectSprite;
            var _local_4:Rectangle = new Rectangle();
            var _local_6:int;
            var _local_2:BitmapData;
            _local_6 = 0;
            while (_local_6 < _local_5)
            {
                _local_1 = getSprite(_local_6);
                if (((!(_local_1 == null)) && (_local_1.visible)))
                {
                    _local_2 = _local_1.asset;
                    if (_local_2 != null)
                    {
                        _local_3 = new Point(_local_1.offsetX, _local_1.offsetY);
                        if (_local_6 == 0)
                        {
                            _local_4.left = _local_3.x;
                            _local_4.top = _local_3.y;
                            _local_4.right = (_local_3.x + _local_1.width);
                            _local_4.bottom = (_local_3.y + _local_1.height);
                        }
                        else
                        {
                            if (_local_3.x < _local_4.left)
                            {
                                _local_4.left = _local_3.x;
                            };
                            if (_local_3.y < _local_4.top)
                            {
                                _local_4.top = _local_3.y;
                            };
                            if ((_local_3.x + _local_1.width) > _local_4.right)
                            {
                                _local_4.right = (_local_3.x + _local_1.width);
                            };
                            if ((_local_3.y + _local_1.height) > _local_4.bottom)
                            {
                                _local_4.bottom = (_local_3.y + _local_1.height);
                            };
                        };
                    };
                };
                _local_6++;
            };
            return (_local_4);
        }


    }
}//package com.sulake.room.object.visualization

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3984 = "_-Ej" (String#1774, DoABC#4)
// _SafeStr_4163 = "_-22t" (String#6166, DoABC#4)
// _SafeStr_4164 = "_-g0" (String#1517, DoABC#4)
// _SafeStr_4165 = "_-e1M" (String#1170, DoABC#4)
// _SafeStr_4166 = "_-jT" (String#4454, DoABC#4)
// _SafeStr_4170 = "_-t1V" (String#3658, DoABC#4)
// _SafeStr_4174 = "_-TP" (String#7891, DoABC#4)
// _SafeStr_4175 = "_-W1q" (String#3259, DoABC#4)
// _SafeStr_8263 = "_-HX" (String#30554, DoABC#4)


