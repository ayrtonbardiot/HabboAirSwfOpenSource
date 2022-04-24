// by nota

//com.sulake.habbo.game.snowwar.utils.SnowWarAnimatedWindowElement

package com.sulake.habbo.game.snowwar.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.utils.Timer;
    import flash.display.BitmapData;
    import com.sulake.core.assets._SafeStr_21;
    import flash.events.TimerEvent;
    import flash.geom.Point;

    public class SnowWarAnimatedWindowElement implements _SafeStr_13 
    {

        private var _SafeStr_6078:int;
        private var _SafeStr_6751:String;
        private var _SafeStr_5670:Array = [];
        private var _currentFrame:int;
        private var _SafeStr_6752:_SafeStr_3264;
        private var _SafeStr_4582:Timer;
        private var _disposed:Boolean = false;

        public function SnowWarAnimatedWindowElement(_arg_1:_SafeStr_21, _arg_2:_SafeStr_3264, _arg_3:String, _arg_4:int, _arg_5:int=100, _arg_6:Boolean=false)
        {
            var _local_7:int;
            super();
            _SafeStr_6752 = _arg_2;
            _SafeStr_6751 = _arg_3;
            _SafeStr_6078 = _arg_4;
            _local_7 = 1;
            while (_local_7 <= _SafeStr_6078)
            {
                if (_arg_1.hasAsset((_SafeStr_6751 + _local_7)))
                {
                    _SafeStr_5670.push((_arg_1.getAssetByName((_SafeStr_6751 + _local_7)).content as BitmapData));
                }
                else
                {
                    _SafeStr_5670.push(new BitmapData(1, 1));
                    _SafeStr_14.log((("Missing asset for Snow War: " + _SafeStr_6751) + _local_7));
                };
                _local_7++;
            };
            if (_arg_6)
            {
                _SafeStr_6078 = (_SafeStr_6078 + (_arg_4 - 2));
                _local_7 = (_arg_4 - 1);
                while (_local_7 > 1)
                {
                    if (_arg_1.hasAsset((_SafeStr_6751 + _local_7)))
                    {
                        _SafeStr_5670.push((_arg_1.getAssetByName((_SafeStr_6751 + _local_7)).content as BitmapData));
                    }
                    else
                    {
                        _SafeStr_5670.push(new BitmapData(1, 1));
                        _SafeStr_14.log((("Missing loop asset for Snow War: " + _SafeStr_6751) + _local_7));
                    };
                    _local_7--;
                };
            };
            update();
            _SafeStr_4582 = new Timer(_arg_5);
            _SafeStr_4582.addEventListener("timer", onTimer);
            _SafeStr_4582.start();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                _SafeStr_4582.removeEventListener("timer", onTimer);
                _SafeStr_4582.stop();
                _SafeStr_4582 = null;
                if (((_SafeStr_6752) && (_SafeStr_6752.bitmap)))
                {
                    _SafeStr_6752.bitmap.fillRect(_SafeStr_6752.bitmap.rect, 0);
                    _SafeStr_6752.invalidate();
                };
                _SafeStr_6752 = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function onTimer(_arg_1:TimerEvent):void
        {
            update();
        }

        private function update():void
        {
            _currentFrame = (++_currentFrame % _SafeStr_6078);
            if (!_SafeStr_6752.bitmap)
            {
                _SafeStr_6752.bitmap = new BitmapData(_SafeStr_6752.width, _SafeStr_6752.height);
            };
            _SafeStr_6752.bitmap.fillRect(_SafeStr_6752.bitmap.rect, 0);
            var _local_2:BitmapData = _SafeStr_5670[_currentFrame];
            var _local_1:Point = new Point(((_SafeStr_6752.width - _local_2.width) / 2), ((_SafeStr_6752.height - _local_2.height) / 2));
            _SafeStr_6752.bitmap.copyPixels(_local_2, _local_2.rect, _local_1);
            _SafeStr_6752.invalidate();
        }


    }
}//package com.sulake.habbo.game.snowwar.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5670 = "_-kH" (String#1221, DoABC#4)
// _SafeStr_6078 = "_-H1Z" (String#2266, DoABC#4)
// _SafeStr_6751 = "_-s14" (String#8613, DoABC#4)
// _SafeStr_6752 = "_-Iw" (String#3773, DoABC#4)


