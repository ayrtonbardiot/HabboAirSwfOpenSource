// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.view.utils.Icon

package com.sulake.habbo.friendbar.view.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.utils.Timer;
    import flash.geom.Point;
    import flash.display.BitmapData;
    import flash.events.TimerEvent;

    public class Icon implements _SafeStr_13 
    {

        protected static const ALIGN_LEFT:int = 0;
        protected static const ALIGN_CENTER:int = 1;
        protected static const ALIGN_RIGHT:int = 2;
        protected static const MASK_HORIZONTAL:int = 3;
        protected static const ALIGN_TOP:int = 4;
        protected static const ALIGN_MIDDLE:int = 8;
        protected static const ALIGN_BOTTOM:int = 18;
        protected static const MASK_VERTICAL:int = 18;

        private var _disposed:Boolean = false;
        private var _SafeStr_3960:Boolean = false;
        protected var _SafeStr_4204:BitmapDataAsset;
        protected var _SafeStr_5234:_SafeStr_3264;
        private var _SafeStr_5037:uint = 9;
        protected var _SafeStr_4582:Timer;
        protected var _frame:int = 0;
        private var _point:Point = new Point();
        protected var _SafeStr_4135:Boolean = false;
        protected var _hover:Boolean = false;


        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get disabled():Boolean
        {
            return (_SafeStr_3960);
        }

        protected function set image(_arg_1:BitmapDataAsset):void
        {
            _SafeStr_4204 = _arg_1;
            redraw();
        }

        protected function get image():BitmapDataAsset
        {
            return (_SafeStr_4204);
        }

        protected function set canvas(_arg_1:_SafeStr_3264):void
        {
            _SafeStr_5234 = _arg_1;
            redraw();
        }

        protected function get canvas():_SafeStr_3264
        {
            return (_SafeStr_5234);
        }

        protected function set alignment(_arg_1:uint):void
        {
            _SafeStr_5037 = _arg_1;
            redraw();
        }

        protected function get alignment():uint
        {
            return (_SafeStr_5037);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                toggleTimer(false, 0);
                image = null;
                canvas = null;
                _disposed = true;
            };
        }

        public function notify(_arg_1:Boolean):void
        {
            _SafeStr_4135 = _arg_1;
            if (((_SafeStr_4135) && (_SafeStr_3960)))
            {
                enable(true);
            };
        }

        public function hover(_arg_1:Boolean):void
        {
            _hover = _arg_1;
        }

        public function enable(_arg_1:Boolean):void
        {
            _SafeStr_3960 = (!(_arg_1));
        }

        protected function redraw():void
        {
            var _local_1:* = null;
            if (((_SafeStr_5234) && (!(_SafeStr_5234.disposed))))
            {
                if (!_SafeStr_5234.bitmap)
                {
                    _SafeStr_5234.bitmap = new BitmapData(_SafeStr_5234.width, _SafeStr_5234.height, true, 0);
                }
                else
                {
                    _SafeStr_5234.bitmap.fillRect(_SafeStr_5234.bitmap.rect, 0);
                };
                if (((_SafeStr_4204) && (!(_SafeStr_4204.disposed))))
                {
                    var _local_2:* = 0;
                    _point.y = _local_2;
                    _point.x = _local_2;
                    _local_1 = (_SafeStr_4204.content as BitmapData);
                    switch ((_SafeStr_5037 & 0x03))
                    {
                        case 1:
                            _point.x = ((_SafeStr_5234.bitmap.width / 2) - (_local_1.width / 2));
                            break;
                        case 2:
                            _point.x = (_SafeStr_5234.bitmap.width - _local_1.width);
                        default:
                    };
                    switch ((_SafeStr_5037 & 0x12))
                    {
                        case 8:
                            _point.y = ((_SafeStr_5234.bitmap.height / 2) - (_local_1.height / 2));
                            break;
                        case 18:
                            _point.y = (_SafeStr_5234.bitmap.height - _local_1.height);
                        default:
                    };
                    _SafeStr_5234.bitmap.copyPixels(_local_1, _local_1.rect, _point);
                    _SafeStr_5234.invalidate();
                };
            };
        }

        protected function toggleTimer(_arg_1:Boolean, _arg_2:int):void
        {
            if (_arg_1)
            {
                if (!_SafeStr_4582)
                {
                    _SafeStr_4582 = new Timer(_arg_2, 0);
                    _SafeStr_4582.addEventListener("timer", onTimerEvent);
                    _SafeStr_4582.start();
                    onTimerEvent(null);
                };
                _SafeStr_4582.delay = _arg_2;
            }
            else
            {
                _frame = 0;
                if (_SafeStr_4582)
                {
                    _SafeStr_4582.reset();
                    _SafeStr_4582.removeEventListener("timer", onTimerEvent);
                    _SafeStr_4582 = null;
                };
            };
        }

        protected function onTimerEvent(_arg_1:TimerEvent):void
        {
        }


    }
}//package com.sulake.habbo.friendbar.view.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3960 = "_-h1m" (String#4565, DoABC#4)
// _SafeStr_4135 = "_-C1J" (String#5687, DoABC#4)
// _SafeStr_4204 = "_-WT" (String#629, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_5037 = "_-O11" (String#4228, DoABC#4)
// _SafeStr_5234 = "_-gu" (String#735, DoABC#4)


