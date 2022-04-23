// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.moderation.OpenExternalLink

package com.sulake.habbo.moderation
{
    import com.sulake.core.window._SafeStr_3109;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;
    import com.sulake.core.window.events._SafeStr_3116;

    public class OpenExternalLink 
    {

        private var _SafeStr_5275:String;

        public function OpenExternalLink(_arg_1:ModerationManager, _arg_2:_SafeStr_3109, _arg_3:String)
        {
            _arg_2.procedure = onClick;
            _SafeStr_5275 = _arg_3;
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            navigateToURL(new URLRequest(_SafeStr_5275), "_blank"); //not popped
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_5275 = "_-J1N" (String#2314, DoABC#4)


