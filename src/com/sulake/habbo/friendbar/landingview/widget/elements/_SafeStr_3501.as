// by nota

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3501

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements._SafeStr_3491;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3314;

    public class _SafeStr_3501 implements IElementHandler, _SafeStr_13, _SafeStr_3491, ILayoutNameProvider 
    {

        private var _landingView:HabboLandingView;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6995:Boolean;
        private var _timeRemainingKey:String;
        private var _expiredKey:String;


        public function get layoutName():String
        {
            return ("element_timer");
        }

        public function isFloating(_arg_1:Boolean):Boolean
        {
            return (_SafeStr_6995);
        }

        public function dispose():void
        {
            _landingView = null;
            _window = null;
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        public function refresh():void
        {
        }

        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            _landingView = _arg_1;
            _window = _SafeStr_3133(_arg_2);
            _SafeStr_6995 = (_arg_3[1] == "true");
            _timeRemainingKey = _arg_3[4];
            _expiredKey = _arg_3[5];
            setCaption(null);
            if (_SafeStr_6995)
            {
                _window.x = _arg_3[2];
                _window.y = _arg_3[3];
            };
        }

        protected function setTimer(_arg_1:int):void
        {
            var _local_2:_SafeStr_3199 = _SafeStr_3199(_window.findChildByName("countdown_widget"));
            _local_2.visible = (_arg_1 > 0);
            var _local_3:_SafeStr_3314 = _SafeStr_3314(_local_2.widget);
            _local_3.seconds = _arg_1;
            setCaption(((_arg_1 > 0) ? _timeRemainingKey : _expiredKey));
        }

        private function setCaption(_arg_1:String):void
        {
            var _local_3:_SafeStr_3109 = _window.findChildByName("timer_caption_txt");
            var _local_2:Boolean = ((!(_arg_1 == null)) && (!(_arg_1 == "")));
            _local_3.visible = _local_2;
            if (_local_2)
            {
                _local_3.caption = (("${" + _arg_1) + "}");
            };
        }

        public function get landingView():HabboLandingView
        {
            return (_landingView);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3314 = "_-j1a" (String#3394, DoABC#4)
// _SafeStr_3491 = "_-4A" (String#6633, DoABC#4)
// _SafeStr_3501 = "_-Ul" (String#10584, DoABC#4)
// _SafeStr_6995 = "_-jZ" (String#7298, DoABC#4)


