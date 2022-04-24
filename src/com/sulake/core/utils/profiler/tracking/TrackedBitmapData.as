// by nota

//com.sulake.core.utils.profiler.tracking.TrackedBitmapData

package com.sulake.core.utils.profiler.tracking
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class TrackedBitmapData extends BitmapData 
    {

        private static const MAX_PIXELS:int = 0xFFFFFF;
        private static const MAX_WIDTH:int = 8191;
        private static const MAX_HEIGHT:int = 8191;
        private static const MIN_WIDTH:int = 1;
        private static const MIN_HEIGHT:int = 1;
        public static const DEFAULT_SIZE:int = 4095;
        private static const ZERO_POINT:Point = new Point();

        private static var _SafeStr_8068:uint = 0;
        private static var _SafeStr_8023:uint = 0;

        private var _SafeStr_7108:Object;
        private var _disposed:Boolean = false;

        public function TrackedBitmapData(_arg_1:*, _arg_2:int, _arg_3:int, _arg_4:Boolean=true, _arg_5:uint=0xFFFFFFFF)
        {
            if ((_arg_2 * _arg_3) > 0xFFFFFF)
            {
                _arg_2 = 4095;
                _arg_3 = 4095;
            }
            else
            {
                if (_arg_2 > 8191)
                {
                    _arg_2 = 8191;
                }
                else
                {
                    if (_arg_2 < 1)
                    {
                        _arg_2 = 1;
                    };
                };
                if (_arg_3 > 8191)
                {
                    _arg_3 = 8191;
                }
                else
                {
                    if (_arg_3 < 1)
                    {
                        _arg_3 = 1;
                    };
                };
            };
            super(_arg_2, _arg_3, _arg_4, _arg_5);
            _SafeStr_8068++;
            _SafeStr_8023 = (_SafeStr_8023 + ((_arg_2 * _arg_3) * 4));
            _SafeStr_7108 = _arg_1;
        }

        public static function get numInstances():uint
        {
            return (_SafeStr_8068);
        }

        public static function get allocatedByteCount():uint
        {
            return (_SafeStr_8023);
        }


        override public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_8023 = (_SafeStr_8023 - ((width * height) * 4));
                _SafeStr_8068--;
                _disposed = true;
                _SafeStr_7108 = null;
                super.dispose();
            };
        }

        override public function clone():BitmapData
        {
            if (_disposed)
            {
                return (null);
            };
            var _local_1:TrackedBitmapData = new TrackedBitmapData(_SafeStr_7108, width, height, transparent);
            _local_1.copyPixels(this, rect, ZERO_POINT);
            return (_local_1);
        }


    }
}//package com.sulake.core.utils.profiler.tracking

// _SafeStr_7108 = "_-x1v" (String#10543, DoABC#3)
// _SafeStr_8023 = "_-K19" (String#7864, DoABC#3)
// _SafeStr_8068 = "_-R5" (String#8362, DoABC#3)


