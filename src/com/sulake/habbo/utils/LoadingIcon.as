// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.utils.LoadingIcon

package com.sulake.habbo.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IIconWindow;
    import flash.events.Event;

    public class LoadingIcon implements _SafeStr_13 
    {

        private static const FRAMES:Array = [23, 24, 25, 26];

        private var _SafeStr_4582:Timer = new Timer(160);
        private var _icon:IIconWindow;
        private var _SafeStr_6390:int;

        public function LoadingIcon()
        {
            _SafeStr_4582.addEventListener("timer", onTimer);
        }

        public function dispose():void
        {
            if (_SafeStr_4582)
            {
                _SafeStr_4582.removeEventListener("timer", onTimer);
                _SafeStr_4582.stop();
                _SafeStr_4582 = null;
            };
            _icon = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4582 == null);
        }

        public function setVisible(_arg_1:IIconWindow, _arg_2:Boolean):void
        {
            _icon = _arg_1;
            _icon.visible = _arg_2;
            if (_arg_2)
            {
                _icon.style = FRAMES[_SafeStr_6390];
                _SafeStr_4582.start();
            }
            else
            {
                _SafeStr_4582.stop();
            };
        }

        private function onTimer(_arg_1:Event):void
        {
            if (_icon == null)
            {
                return;
            };
            _SafeStr_6390++;
            if (_SafeStr_6390 >= FRAMES.length)
            {
                _SafeStr_6390 = 0;
            };
            _icon.style = FRAMES[_SafeStr_6390];
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4582 = "_-T1P" (String#619, DoABC#4)
// _SafeStr_6390 = "_-hm" (String#8601, DoABC#4)


