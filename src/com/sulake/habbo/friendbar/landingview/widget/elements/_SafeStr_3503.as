// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements._SafeStr_3503

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.interfaces.elements._SafeStr_3491;
    import _-a2._SafeStr_646;
    import _-l12._SafeStr_457;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;
    import _-i1z._SafeStr_421;

    public class _SafeStr_3503 extends _SafeStr_3494 implements _SafeStr_3491 
    {

        private var _SafeStr_6998:String;
        private var _SafeStr_6999:Boolean = true;


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_6998 = _arg_3[2];
            _arg_2.x = _arg_3[3];
            _arg_2.y = _arg_3[4];
            if (_arg_3.length > 5)
            {
                _SafeStr_6999 = (_arg_3[5] == "true");
            };
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_646(onInfo));
            _arg_1.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_457(onReward));
        }

        override protected function onClick():void
        {
            landingView.requestBadge(_SafeStr_6998);
            landingView.tracking.trackGoogle("landingView", ("click_requestbadge_" + _SafeStr_6998));
        }

        override public function refresh():void
        {
            super.refresh();
            landingView.send(new _SafeStr_421(_SafeStr_6998));
        }

        public function isFloating(_arg_1:Boolean):Boolean
        {
            return (_SafeStr_6999);
        }

        private function onInfo(_arg_1:_SafeStr_646):void
        {
            if (_arg_1.getParser().requestCode == _SafeStr_6998)
            {
                window.visible = (!(_arg_1.getParser().fulfilled));
            };
        }

        private function onReward(_arg_1:_SafeStr_457):void
        {
            if (window)
            {
                landingView.send(new _SafeStr_421(_SafeStr_6998));
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3491 = "_-4A" (String#6633, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)
// _SafeStr_3503 = "_-c1m" (String#13886, DoABC#4)
// _SafeStr_421 = "_-R4" (String#18736, DoABC#4)
// _SafeStr_457 = "_-TN" (String#11694, DoABC#4)
// _SafeStr_646 = "_-j17" (String#23269, DoABC#4)
// _SafeStr_6998 = "_-nk" (String#8888, DoABC#4)
// _SafeStr_6999 = "_-Q13" (String#9875, DoABC#4)


