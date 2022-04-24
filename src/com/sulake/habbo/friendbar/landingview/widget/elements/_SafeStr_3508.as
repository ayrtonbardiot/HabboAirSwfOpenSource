// by nota

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3508

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class _SafeStr_3508 extends _SafeStr_3494 
    {

        private var _SafeStr_7000:String;


        override protected function onClick():void
        {
            landingView.goToRoom(_SafeStr_7000);
            landingView.tracking.trackGoogle("landingView", ("click_promotedroom" + _SafeStr_7000));
        }

        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            if (_arg_3.length > 1)
            {
                _SafeStr_7000 = _arg_3[2];
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)
// _SafeStr_3508 = "_-76" (String#15730, DoABC#4)
// _SafeStr_7000 = "_-Q1T" (String#14194, DoABC#4)


