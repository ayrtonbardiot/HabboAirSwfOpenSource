// by nota

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3502

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import _-g1x._SafeStr_506;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import _-hV._SafeStr_176;

    public class _SafeStr_3502 extends _SafeStr_3501 
    {

        private var _SafeStr_6997:String;


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_6997 = _arg_3[6];
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_506(onTime));
        }

        override public function refresh():void
        {
            landingView.send(new _SafeStr_176(_SafeStr_6997));
        }

        private function onTime(_arg_1:_SafeStr_506):void
        {
            if (_arg_1.getParser().timeStr == _SafeStr_6997)
            {
                setTimer(_arg_1.getParser().secondsUntil);
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_176 = "_-KM" (String#29780, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3501 = "_-Ul" (String#10584, DoABC#4)
// _SafeStr_3502 = "_-D1j" (String#13922, DoABC#4)
// _SafeStr_506 = "_-G1g" (String#28241, DoABC#4)
// _SafeStr_6997 = "_-C1h" (String#14571, DoABC#4)


