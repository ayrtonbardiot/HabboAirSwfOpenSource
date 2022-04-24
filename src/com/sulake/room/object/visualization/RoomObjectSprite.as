// by nota

//com.sulake.room.object.visualization.RoomObjectSprite

package com.sulake.room.object.visualization
{
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.room.object.enum.RoomObjectSpriteType;

    public final class RoomObjectSprite implements IRoomObjectSprite 
    {

        private static var _SafeStr_4163:int = 0;

        private var _asset:BitmapData = null;
        private var _assetName:String = "";
        private var _libraryAssetName:String = "";
        private var _SafeStr_5691:String = null;
        private var _SafeStr_5692:String = null;
        private var _SafeStr_4426:Boolean = true;
        private var _SafeStr_4019:String = "";
        private var _alpha:int = 0xFF;
        private var _color:int = 0xFFFFFF;
        private var _SafeStr_5693:String = "normal";
        private var _flipH:Boolean = false;
        private var _flipV:Boolean = false;
        private var _direction:int = 0;
        private var _offset:Point = new Point(0, 0);
        private var _width:int = 0;
        private var _SafeStr_4234:int = 0;
        private var _depth:Number = 0;
        private var _SafeStr_5695:int = 0;
        private var _varyingDepth:Boolean = false;
        private var _SafeStr_5696:int = 128;
        private var _SafeStr_4173:Boolean = false;
        private var _SafeStr_4165:int = 0;
        private var _SafeStr_4166:int = 0;
        private var _filters:Array = null;
        protected var _SafeStr_5694:int = RoomObjectSpriteType.DEFAULT;
        private var _SafeStr_4652:String;

        public function RoomObjectSprite()
        {
            _SafeStr_4166 = _SafeStr_4163++;
        }

        public function dispose():void
        {
            _asset = null;
            _width = 0;
            _SafeStr_4234 = 0;
        }

        public function get asset():BitmapData
        {
            return (_asset);
        }

        public function get assetName():String
        {
            return (_assetName);
        }

        public function get assetPosture():String
        {
            return (_SafeStr_5691);
        }

        public function set assetPosture(_arg_1:String):void
        {
            _SafeStr_5691 = _arg_1;
        }

        public function get assetGesture():String
        {
            return (_SafeStr_5692);
        }

        public function set assetGesture(_arg_1:String):void
        {
            _SafeStr_5692 = _arg_1;
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }

        public function get tag():String
        {
            return (_SafeStr_4019);
        }

        public function get alpha():int
        {
            return (_alpha);
        }

        public function get color():int
        {
            return (_color);
        }

        public function get blendMode():String
        {
            return (_SafeStr_5693);
        }

        public function get flipV():Boolean
        {
            return (_flipV);
        }

        public function get flipH():Boolean
        {
            return (_flipH);
        }

        public function get direction():int
        {
            return (_direction);
        }

        public function get offsetX():int
        {
            return (_offset.x);
        }

        public function get offsetY():int
        {
            return (_offset.y);
        }

        public function get width():int
        {
            return (_width);
        }

        public function get height():int
        {
            return (_SafeStr_4234);
        }

        public function get relativeDepth():Number
        {
            return (_depth);
        }

        public function get varyingDepth():Boolean
        {
            return (_varyingDepth);
        }

        public function get clickHandling():Boolean
        {
            return (_SafeStr_4173);
        }

        public function get instanceId():int
        {
            return (_SafeStr_4166);
        }

        public function get updateId():int
        {
            return (_SafeStr_4165);
        }

        public function get filters():Array
        {
            return (_filters);
        }

        public function get spriteType():int
        {
            return (_SafeStr_5694);
        }

        public function get objectType():String
        {
            return (_SafeStr_4652);
        }

        public function set objectType(_arg_1:String):void
        {
            _SafeStr_4652 = _arg_1;
        }

        public function get planeId():int
        {
            return (_SafeStr_5695);
        }

        public function set planeId(_arg_1:int):void
        {
            _SafeStr_5695 = _arg_1;
        }

        public function set spriteType(_arg_1:int):void
        {
            _SafeStr_5694 = _arg_1;
        }

        public function set asset(_arg_1:BitmapData):void
        {
            if (_arg_1 == _asset)
            {
                return;
            };
            if (_arg_1 != null)
            {
                _width = _arg_1.width;
                _SafeStr_4234 = _arg_1.height;
            };
            _asset = _arg_1;
            _SafeStr_4165++;
        }

        public function set assetName(_arg_1:String):void
        {
            if (_arg_1 == _assetName)
            {
                return;
            };
            _assetName = _arg_1;
            _SafeStr_4165++;
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (_arg_1 == _SafeStr_4426)
            {
                return;
            };
            _SafeStr_4426 = _arg_1;
            _SafeStr_4165++;
        }

        public function set tag(_arg_1:String):void
        {
            if (_arg_1 == _SafeStr_4019)
            {
                return;
            };
            _SafeStr_4019 = _arg_1;
            _SafeStr_4165++;
        }

        public function set alpha(_arg_1:int):void
        {
            _arg_1 = (_arg_1 & 0xFF);
            if (_arg_1 == _alpha)
            {
                return;
            };
            _alpha = _arg_1;
            _SafeStr_4165++;
        }

        public function set color(_arg_1:int):void
        {
            _arg_1 = (_arg_1 & 0xFFFFFF);
            if (_arg_1 == _color)
            {
                return;
            };
            _color = _arg_1;
            _SafeStr_4165++;
        }

        public function set blendMode(_arg_1:String):void
        {
            if (_arg_1 == _SafeStr_5693)
            {
                return;
            };
            _SafeStr_5693 = _arg_1;
            _SafeStr_4165++;
        }

        public function set filters(_arg_1:Array):void
        {
            if (_arg_1 == _filters)
            {
                return;
            };
            _filters = _arg_1;
            _SafeStr_4165++;
        }

        public function set flipH(_arg_1:Boolean):void
        {
            if (_arg_1 == _flipH)
            {
                return;
            };
            _flipH = _arg_1;
            _SafeStr_4165++;
        }

        public function set flipV(_arg_1:Boolean):void
        {
            if (_arg_1 == _flipV)
            {
                return;
            };
            _flipV = _arg_1;
            _SafeStr_4165++;
        }

        public function set direction(_arg_1:int):void
        {
            _direction = _arg_1;
        }

        public function set offsetX(_arg_1:int):void
        {
            if (_arg_1 == _offset.x)
            {
                return;
            };
            _offset.x = _arg_1;
            _SafeStr_4165++;
        }

        public function set offsetY(_arg_1:int):void
        {
            if (_arg_1 == _offset.y)
            {
                return;
            };
            _offset.y = _arg_1;
            _SafeStr_4165++;
        }

        public function set relativeDepth(_arg_1:Number):void
        {
            if (_arg_1 == _depth)
            {
                return;
            };
            _depth = _arg_1;
            _SafeStr_4165++;
        }

        public function set varyingDepth(_arg_1:Boolean):void
        {
            if (_arg_1 == _varyingDepth)
            {
                return;
            };
            _varyingDepth = _arg_1;
            _SafeStr_4165++;
        }

        public function set clickHandling(_arg_1:Boolean):void
        {
            if (_SafeStr_4173 == _arg_1)
            {
                return;
            };
            _SafeStr_4173 = _arg_1;
            _SafeStr_4165++;
        }

        public function get alphaTolerance():int
        {
            return (_SafeStr_5696);
        }

        public function set alphaTolerance(_arg_1:int):void
        {
            if (_SafeStr_5696 == _arg_1)
            {
                return;
            };
            _SafeStr_5696 = _arg_1;
            _SafeStr_4165++;
        }

        public function get libraryAssetName():String
        {
            return (_libraryAssetName);
        }

        public function set libraryAssetName(_arg_1:String):void
        {
            _libraryAssetName = _arg_1;
        }


    }
}//package com.sulake.room.object.visualization

// _SafeStr_4019 = "_-LH" (String#3197, DoABC#4)
// _SafeStr_4163 = "_-22t" (String#6166, DoABC#4)
// _SafeStr_4165 = "_-e1M" (String#1170, DoABC#4)
// _SafeStr_4166 = "_-jT" (String#4454, DoABC#4)
// _SafeStr_4173 = "_-U6" (String#5567, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_4426 = "_-c1l" (String#1501, DoABC#4)
// _SafeStr_4652 = "_-61C" (String#3402, DoABC#4)
// _SafeStr_5691 = "_-x1k" (String#20574, DoABC#4)
// _SafeStr_5692 = "_-l1A" (String#21633, DoABC#4)
// _SafeStr_5693 = "_-45" (String#8478, DoABC#4)
// _SafeStr_5694 = "_-81u" (String#12099, DoABC#4)
// _SafeStr_5695 = "_-g1r" (String#17164, DoABC#4)
// _SafeStr_5696 = "_-DX" (String#14524, DoABC#4)


