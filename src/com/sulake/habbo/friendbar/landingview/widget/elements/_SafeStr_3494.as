// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3494

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.IElementHandler;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.friendbar.landingview.interfaces.elements.ILayoutNameProvider;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import com.sulake.core.window.events._SafeStr_3116;

    public class _SafeStr_3494 implements IElementHandler, _SafeStr_13, ILayoutNameProvider 
    {

        private var _landingView:HabboLandingView;
        private var _window:_SafeStr_3109;


        public function get layoutName():String
        {
            return ("element_button");
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

        public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            _landingView = _arg_1;
            _window = _arg_2;
            var _local_5:String = _arg_3[1];
            _arg_2.procedure = onButton;
            _arg_2.caption = (("${" + _local_5) + "}");
        }

        private function onButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                onClick();
            };
        }

        protected function onClick():void
        {
        }

        public function refresh():void
        {
        }

        public function get landingView():HabboLandingView
        {
            return (_landingView);
        }

        public function get window():_SafeStr_3109
        {
            return (_window);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)


