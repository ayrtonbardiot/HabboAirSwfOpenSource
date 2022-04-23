// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.utils._SafeStr_3432

package com.sulake.room.renderer.utils
{
    import flash.display.Bitmap;
    import flash.geom.Point;
    import flash.display.BitmapData;

    [SecureSWF(rename="true")]
    public class _SafeStr_3432 extends Bitmap 
    {

        private var _SafeStr_6693:int = 128;
        private var _basePoint:Point;
        private var _SafeStr_4019:String = "";
        private var _SafeStr_6199:String = "";
        private var _SafeStr_4173:Boolean = false;
        private var _varyingDepth:Boolean = false;
        private var _bitmapData:_SafeStr_3464 = null;
        private var _width:int = 0;
        private var _SafeStr_4234:int = 0;
        private var _updateID1:int = -1;
        private var _updateID2:int = -1;
        private var _offsetRefX:int = 0;
        private var _offsetRefY:int = 0;

        public function _SafeStr_3432():void
        {
            _basePoint = new Point();
            cacheAsBitmap = false;
        }

        public function get alphaTolerance():int
        {
            return (_SafeStr_6693);
        }

        public function set alphaTolerance(_arg_1:int):void
        {
            _SafeStr_6693 = _arg_1;
        }

        public function get tag():String
        {
            return (_SafeStr_4019);
        }

        public function set tag(_arg_1:String):void
        {
            _SafeStr_4019 = _arg_1;
        }

        public function get identifier():String
        {
            return (_SafeStr_6199);
        }

        public function set identifier(_arg_1:String):void
        {
            _SafeStr_6199 = _arg_1;
        }

        public function get varyingDepth():Boolean
        {
            return (_varyingDepth);
        }

        public function set varyingDepth(_arg_1:Boolean):void
        {
            _varyingDepth = _arg_1;
        }

        public function get clickHandling():Boolean
        {
            return (_SafeStr_4173);
        }

        public function set clickHandling(_arg_1:Boolean):void
        {
            _SafeStr_4173 = _arg_1;
        }

        public function get offsetRefX():int
        {
            return (_offsetRefX);
        }

        public function set offsetRefX(_arg_1:int):void
        {
            _offsetRefX = _arg_1;
        }

        public function get offsetRefY():int
        {
            return (_offsetRefY);
        }

        public function set offsetRefY(_arg_1:int):void
        {
            _offsetRefY = _arg_1;
        }

        public function dispose():void
        {
            if (_bitmapData != null)
            {
                _bitmapData.dispose();
                _bitmapData = null;
            };
        }

        override public function set bitmapData(_arg_1:BitmapData):void
        {
            var _local_2:* = null;
            if (_arg_1 == bitmapData)
            {
                return;
            };
            if (_bitmapData != null)
            {
                _bitmapData.dispose();
                _bitmapData = null;
            };
            if (_arg_1 != null)
            {
                _width = _arg_1.width;
                _SafeStr_4234 = _arg_1.height;
                _local_2 = (_arg_1 as _SafeStr_3464);
                if (_local_2 != null)
                {
                    _local_2.addReference();
                    _bitmapData = _local_2;
                };
            }
            else
            {
                _width = 0;
                _SafeStr_4234 = 0;
                _updateID1 = -1;
                _updateID2 = -1;
            };
            super.bitmapData = _arg_1;
        }

        public function needsUpdate(_arg_1:int, _arg_2:int):Boolean
        {
            if (((!(_arg_1 == _updateID1)) || (!(_arg_2 == _updateID2))))
            {
                _updateID1 = _arg_1;
                _updateID2 = _arg_2;
                return (true);
            };
            if (((!(_bitmapData == null)) && (_bitmapData.disposed)))
            {
                return (true);
            };
            return (false);
        }

        override public function hitTestPoint(_arg_1:Number, _arg_2:Number, _arg_3:Boolean=false):Boolean
        {
            return (hitTest(_arg_1, _arg_2));
        }

        public function hitTest(_arg_1:int, _arg_2:int):Boolean
        {
            if (((_SafeStr_6693 > 0xFF) || (bitmapData == null)))
            {
                return (false);
            };
            if (((((_arg_1 < 0) || (_arg_2 < 0)) || (_arg_1 >= _width)) || (_arg_2 >= _SafeStr_4234)))
            {
                return (false);
            };
            return (hitTestBitmapData(_arg_1, _arg_2));
        }

        private function hitTestBitmapData(_arg_1:int, _arg_2:int):Boolean
        {
            var _local_4:uint;
            var _local_3:Boolean;
            try
            {
                _local_4 = bitmapData.getPixel32(_arg_1, _arg_2);
                _local_4 = (_local_4 >> 24);
                _local_3 = (_local_4 > _SafeStr_6693);
            }
            catch(e:Error)
            {
            };
            return (_local_3);
        }


    }
}//package com.sulake.room.renderer.utils

// _SafeStr_3432 = "_-C1g" (String#3325, DoABC#4)
// _SafeStr_3464 = "_-7S" (String#1934, DoABC#4)
// _SafeStr_4019 = "_-LH" (String#3197, DoABC#4)
// _SafeStr_4173 = "_-U6" (String#5567, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_6199 = "_-z1d" (String#9730, DoABC#4)
// _SafeStr_6693 = "_-325" (String#11970, DoABC#4)


