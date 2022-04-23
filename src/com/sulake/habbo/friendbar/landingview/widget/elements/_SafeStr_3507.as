// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3507

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class _SafeStr_3507 extends _SafeStr_3494 
    {

        private var _SafeStr_3693:int;


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_3693 = _arg_3[2];
        }

        override protected function onClick():void
        {
            landingView.navigator.goToPrivateRoom(_SafeStr_3693);
            landingView.tracking.trackGoogle("landingView", "click_gotoroom");
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)
// _SafeStr_3507 = "_-V2" (String#14075, DoABC#4)
// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)


