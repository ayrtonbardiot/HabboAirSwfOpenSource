// by nota

//com.sulake.habbo.friendbar.landingview.widget.HabboWayPromoWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import _-41O._SafeStr_511;
    import _-61d._SafeStr_750;
    import com.sulake.core.window.events._SafeStr_3116;

    public class HabboWayPromoWidget implements ILandingViewWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _SafeStr_6948:int;

        public function HabboWayPromoWidget(_arg_1:HabboLandingView)
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
            _container = _SafeStr_3133(_landingView.getXmlWindow("habbo_way_promo"));
            _container.findChildByName("go_button").procedure = onGoButton;
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_511(onCommunityGoalProgress));
        }

        public function refresh():void
        {
            _landingView.send(new _SafeStr_750());
            refreshContent();
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        private function onGoButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.habboHelp.showHabboWay();
            };
        }

        private function onCommunityGoalProgress(_arg_1:_SafeStr_511):void
        {
            _SafeStr_6948 = _arg_1.getParser().data.communityTotalScore;
            refreshContent();
        }

        private function refreshContent():void
        {
            var _local_1:String = ("" + _SafeStr_6948);
            while (_local_1.length < 8)
            {
                _local_1 = ("0" + _local_1);
            };
            _container.findChildByName("counter_txt").caption = _local_1;
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_511 = "_-z1e" (String#4648, DoABC#4)
// _SafeStr_6948 = "_-AU" (String#22595, DoABC#4)
// _SafeStr_750 = "_-jP" (String#7227, DoABC#4)


