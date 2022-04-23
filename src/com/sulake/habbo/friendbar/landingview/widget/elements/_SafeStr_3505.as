// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3505

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import _-hV._SafeStr_465;

    public class _SafeStr_3505 extends _SafeStr_3494 
    {

        private var _SafeStr_4259:String;


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_4259 = _arg_3[2];
        }

        override protected function onClick():void
        {
            landingView.questEngine.reenableRoomCompetitionWindow();
            landingView.send(new _SafeStr_465(_SafeStr_4259));
            landingView.tracking.trackGoogle("landingView", "click_gotocompetitionroom");
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)
// _SafeStr_3505 = "_-A1W" (String#15486, DoABC#4)
// _SafeStr_4259 = "_-Y1y" (String#3941, DoABC#4)
// _SafeStr_465 = "_-T1d" (String#28549, DoABC#4)


