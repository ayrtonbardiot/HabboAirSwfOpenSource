// by nota

//com.sulake.habbo.friendbar.landingview.widget.HabboTalentsPromoWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import _-f1P._SafeStr_953;
    import com.sulake.core.window.events._SafeStr_3116;

    public class HabboTalentsPromoWidget implements ILandingViewWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;

        public function HabboTalentsPromoWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            _landingView = null;
            _container = null;
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("habbo_talents_promo"));
            _container.findChildByName("go_button").procedure = onGoButton;
            HabboLandingView.positionAfterAndStretch(_container, "title_txt", "hdr_line");
        }

        public function refresh():void
        {
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        private function onGoButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.tracking.trackTalentTrackOpen(_landingView.sessionDataManager.currentTalentTrack, "landingpagepromo");
                _landingView.send(new _SafeStr_953(_landingView.sessionDataManager.currentTalentTrack));
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_953 = "_-a1w" (String#3282, DoABC#4)


