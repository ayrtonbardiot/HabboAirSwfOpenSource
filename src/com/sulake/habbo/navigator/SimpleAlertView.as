// by nota

//com.sulake.habbo.navigator.SimpleAlertView

package com.sulake.habbo.navigator
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class SimpleAlertView extends AlertView 
    {

        private var _text:String;

        public function SimpleAlertView(_arg_1:_SafeStr_1697, _arg_2:String, _arg_3:String)
        {
            super(_arg_1, "nav_simple_alert", _arg_2);
            _text = _arg_3;
        }

        override internal function setupAlertWindow(_arg_1:_SafeStr_3263):void
        {
            var _local_3:_SafeStr_3133 = _arg_1.content;
            ITextWindow(_local_3.findChildByName("body_text")).text = _text;
            var _local_2:_SafeStr_3109 = _local_3.findChildByName("ok");
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onOk);
            };
            _arg_1.tags.push("SimpleAlertView");
        }

        private function onOk(_arg_1:WindowMouseEvent):void
        {
            dispose();
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)


