// by nota

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3496

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    public class _SafeStr_3496 extends _SafeStr_3494 
    {


        override protected function onClick():void
        {
            landingView.questEngine.reenableRoomCompetitionWindow();
            landingView.navigator.goToHomeRoom();
            landingView.tracking.trackGoogle("landingView", "click_gotohomeroom");
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)
// _SafeStr_3496 = "_-65" (String#14712, DoABC#4)


