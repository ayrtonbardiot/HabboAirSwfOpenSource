// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.layout.backgroundobjects.BackgroundObject

package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.EventDispatcher;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;

    public class BackgroundObject implements _SafeStr_13, _SafeStr_41 
    {

        private var _SafeStr_3820:int;
        private var _window:_SafeStr_3109;
        private var _SafeStr_3983:EventDispatcher;
        private var _SafeStr_6653:IStaticBitmapWrapperWindow;

        public function BackgroundObject(_arg_1:int, _arg_2:_SafeStr_3133, _arg_3:EventDispatcher, _arg_4:HabboLandingView, _arg_5:String, _arg_6:Boolean=false)
        {
            _SafeStr_3820 = _arg_1;
            _window = _arg_2;
            _SafeStr_3983 = _arg_3;
            if (_arg_6)
            {
                _SafeStr_6653 = IStaticBitmapWrapperWindow(_arg_4.getXmlWindow("moving_object"));
            }
            else
            {
                _SafeStr_6653 = IStaticBitmapWrapperWindow(_arg_4.getXmlWindow("moving_object_floating"));
            };
            _arg_2.addChild(_SafeStr_6653);
        }

        public function dispose():void
        {
            _window = null;
            _SafeStr_6653 = null;
        }

        public function get disposed():Boolean
        {
            return (_window == null);
        }

        public function set sprite(_arg_1:IStaticBitmapWrapperWindow):void
        {
            _SafeStr_6653 = _arg_1;
        }

        public function get sprite():IStaticBitmapWrapperWindow
        {
            return (_SafeStr_6653);
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }

        public function set window(_arg_1:_SafeStr_3109):void
        {
            _window = _arg_1;
        }

        public function get events():EventDispatcher
        {
            return (_SafeStr_3983);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function update(_arg_1:uint):void
        {
            if (!_SafeStr_6653)
            {
                return;
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.layout.backgroundobjects

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_6653 = "_-t7" (String#4221, DoABC#4)


