// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3499

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class _SafeStr_3499 extends _SafeStr_3494 
    {

        private var _SafeStr_5272:String;
        private var _SafeStr_6936:String;


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_5272 = _arg_3[2];
            _SafeStr_6936 = _arg_4.configurationCode;
        }

        override protected function onClick():void
        {
            landingView.context.createLinkEvent(_SafeStr_5272);
            landingView.tracking.trackEventLog("LandingView", _SafeStr_6936, "client_link", _SafeStr_5272);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)
// _SafeStr_3499 = "_-qh" (String#14037, DoABC#4)
// _SafeStr_5272 = "_-Bm" (String#2658, DoABC#4)
// _SafeStr_6936 = "_-nx" (String#5327, DoABC#4)


