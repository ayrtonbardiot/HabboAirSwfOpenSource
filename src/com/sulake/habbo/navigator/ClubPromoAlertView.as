// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.ClubPromoAlertView

package com.sulake.habbo.navigator
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class ClubPromoAlertView extends AlertView 
    {

        private var _text:String;
        private var _SafeStr_5629:String;

        public function ClubPromoAlertView(_arg_1:_SafeStr_1697, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            super(_arg_1, "nav_promo_alert", _arg_2);
            _text = _arg_3;
            _SafeStr_5629 = _arg_4;
        }

        override internal function setupAlertWindow(_arg_1:_SafeStr_3263):void
        {
            var _local_4:_SafeStr_3133 = _arg_1.content;
            _local_4.findChildByName("body_text").caption = _text;
            _local_4.findChildByName("promo_text").caption = _SafeStr_5629;
            var _local_3:_SafeStr_3109 = _local_4.findChildByName("ok");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onOk);
            };
            var _local_2:_SafeStr_3109 = _local_4.findChildByName("promo_container");
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onPromo);
            };
        }

        private function onOk(_arg_1:WindowMouseEvent):void
        {
            dispose();
        }

        private function onPromo(_arg_1:WindowMouseEvent):void
        {
            navigator.openCatalogClubPage("ClubPromoAlertView");
            dispose();
        }


    }
}//package com.sulake.habbo.navigator

// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_5629 = "_-E1b" (String#19100, DoABC#4)


