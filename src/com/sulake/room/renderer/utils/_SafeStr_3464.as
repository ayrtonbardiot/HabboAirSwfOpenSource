// by nota

//com.sulake.room.renderer.utils._SafeStr_3464

package com.sulake.room.renderer.utils
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    [SecureSWF(rename="true")]
    public class _SafeStr_3464 extends BitmapData 
    {

        private static const ZERO_POINT:Point = new Point(0, 0);

        private var _SafeStr_4152:int = 0;
        private var _disposed:Boolean = false;

        public function _SafeStr_3464(_arg_1:int, _arg_2:int, _arg_3:Boolean=true, _arg_4:uint=0)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function get referenceCount():int
        {
            return (_SafeStr_4152);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function addReference():void
        {
            _SafeStr_4152++;
        }

        override public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (--_SafeStr_4152 <= 0)
            {
                super.dispose();
                _disposed = true;
            };
        }

        override public function clone():BitmapData
        {
            var _local_1:_SafeStr_3464;
            try
            {
                _local_1 = new _SafeStr_3464(width, height, true, 0xFFFFFF);
                _local_1.copyPixels(this, rect, ZERO_POINT, null, null, true);
            }
            catch(e:Error)
            {
                _local_1 = new _SafeStr_3464(1, 1, true, 0xFFFFFF);
            };
            return (_local_1);
        }


    }
}//package com.sulake.room.renderer.utils

// _SafeStr_3464 = "_-7S" (String#1934, DoABC#4)
// _SafeStr_4152 = "_-M1t" (String#3975, DoABC#4)


