// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3504

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import _-41O._SafeStr_511;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import _-61d._SafeStr_750;
    import _-41O._SafeStr_1572;

    public class _SafeStr_3504 extends _SafeStr_3501 
    {


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_511(onCommunityGoalProgress));
        }

        override public function refresh():void
        {
            landingView.send(new _SafeStr_750());
        }

        private function onCommunityGoalProgress(_arg_1:_SafeStr_511):void
        {
            var _local_2:_SafeStr_1572 = _arg_1.getParser().data;
            setTimer(((_local_2.hasGoalExpired) ? 0 : _local_2.timeRemainingInSeconds));
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_1572 = "_-E1A" (String#14274, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3501 = "_-Ul" (String#10584, DoABC#4)
// _SafeStr_3504 = "_-Uj" (String#15332, DoABC#4)
// _SafeStr_511 = "_-z1e" (String#4648, DoABC#4)
// _SafeStr_750 = "_-jP" (String#7227, DoABC#4)


