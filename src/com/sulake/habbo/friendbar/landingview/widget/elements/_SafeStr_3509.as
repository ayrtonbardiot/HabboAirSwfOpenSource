// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3509

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import _-g1x._SafeStr_622;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import _-hV._SafeStr_440;
    import _-hV._SafeStr_120;

    public class _SafeStr_3509 extends _SafeStr_3494 
    {

        private var _submittedKey:String;
        private var _SafeStr_4259:String;
        private var _SafeStr_7001:Boolean;
        private var _SafeStr_4061:int;


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _submittedKey = _arg_3[2];
            _SafeStr_4259 = _arg_3[3];
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_622(onInfo));
        }

        override public function refresh():void
        {
            super.refresh();
            landingView.send(new _SafeStr_440(_SafeStr_4259));
        }

        override protected function onClick():void
        {
            landingView.questEngine.reenableRoomCompetitionWindow();
            if (_SafeStr_7001)
            {
                landingView.navigator.goToPrivateRoom(_SafeStr_4061);
                landingView.tracking.trackGoogle("landingView", "click_submittedroom");
            }
            else
            {
                landingView.send(new _SafeStr_120());
                landingView.tracking.trackGoogle("landingView", "click_startsubmit");
            };
        }

        private function onInfo(_arg_1:_SafeStr_622):void
        {
            _SafeStr_7001 = _arg_1.getParser().isPartOf;
            _SafeStr_4061 = _arg_1.getParser().targetId;
            if (_SafeStr_7001)
            {
                window.caption = (("${" + _submittedKey) + "}");
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_120 = "_-32y" (String#30431, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)
// _SafeStr_3509 = "_-02q" (String#15034, DoABC#4)
// _SafeStr_4061 = "_-yK" (String#9601, DoABC#4)
// _SafeStr_4259 = "_-Y1y" (String#3941, DoABC#4)
// _SafeStr_440 = "_-g1k" (String#30084, DoABC#4)
// _SafeStr_622 = "_-LA" (String#23383, DoABC#4)
// _SafeStr_7001 = "_-N1O" (String#15430, DoABC#4)


