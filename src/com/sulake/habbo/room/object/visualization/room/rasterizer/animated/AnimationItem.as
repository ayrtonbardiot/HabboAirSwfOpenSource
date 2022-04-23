// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.visualization.room.rasterizer.animated.AnimationItem

package com.sulake.habbo.room.object.visualization.room.rasterizer.animated
{
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class AnimationItem 
    {

        private var _SafeStr_4050:Number = 0;
        private var _SafeStr_4051:Number = 0;
        private var _SafeStr_6967:Number = 0;
        private var _SafeStr_6968:Number = 0;
        private var _bitmapData:BitmapData = null;

        public function AnimationItem(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:BitmapData)
        {
            _SafeStr_4050 = _arg_1;
            _SafeStr_4051 = _arg_2;
            _SafeStr_6967 = _arg_3;
            _SafeStr_6968 = _arg_4;
            if (isNaN(_SafeStr_4050))
            {
                _SafeStr_4050 = 0;
            };
            if (isNaN(_SafeStr_4051))
            {
                _SafeStr_4051 = 0;
            };
            if (isNaN(_SafeStr_6967))
            {
                _SafeStr_6967 = 0;
            };
            if (isNaN(_SafeStr_6968))
            {
                _SafeStr_6968 = 0;
            };
            _bitmapData = _arg_5;
        }

        public function get bitmapData():BitmapData
        {
            return (_bitmapData);
        }

        public function dispose():void
        {
            _bitmapData = null;
        }

        public function getPosition(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:int):Point
        {
            var _local_6:Number = _SafeStr_4050;
            var _local_7:Number = _SafeStr_4051;
            if (_arg_3 > 0)
            {
                _local_6 = (_local_6 + (((_SafeStr_6967 / _arg_3) * _arg_5) / 1000));
            };
            if (_arg_4 > 0)
            {
                _local_7 = (_local_7 + (((_SafeStr_6968 / _arg_4) * _arg_5) / 1000));
            };
            var _local_8:int = ((_local_6 % 1) * _arg_1);
            var _local_9:int = ((_local_7 % 1) * _arg_2);
            return (new Point(_local_8, _local_9));
        }


    }
}//package com.sulake.habbo.room.object.visualization.room.rasterizer.animated

// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_6967 = "_-a17" (String#4032, DoABC#4)
// _SafeStr_6968 = "_-z1N" (String#4111, DoABC#4)


