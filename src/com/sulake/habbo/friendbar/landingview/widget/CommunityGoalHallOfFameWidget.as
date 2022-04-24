// by nota

//com.sulake.habbo.friendbar.landingview.widget.CommunityGoalHallOfFameWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import _-41O._SafeStr_1567;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import _-41O._SafeStr_886;
    import _-g1x._SafeStr_549;
    import _-hV._SafeStr_947;
    import _-41O._SafeStr_1666;
    import _-41O._SafeStr_1665;
    import com.sulake.core.window._SafeStr_3133;
    import _-hV._SafeStr_170;
    import _-61d._SafeStr_376;
    import com.sulake.habbo.friendbar.landingview.*;

    public class CommunityGoalHallOfFameWidget extends UserListWidget 
    {

        private var _SafeStr_3740:_SafeStr_1567;
        private var _SafeStr_6297:String;

        public function CommunityGoalHallOfFameWidget(_arg_1:HabboLandingView)
        {
            super(_arg_1);
        }

        override public function initialize():void
        {
            super.initialize();
            _SafeStr_6297 = landingView.getProperty("landing.view.dynamic.slot.6.conf");
        }

        override protected function registerMessageListeners():void
        {
            landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_886(onCommunityGoalHallOfFame));
            landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_549(onTimingCode));
        }

        override public function refresh():void
        {
            landingView.send(new _SafeStr_947(_SafeStr_6297));
        }

        override protected function get users():Array
        {
            return ((_SafeStr_3740 == null) ? null : _SafeStr_3740.hof);
        }

        override protected function refreshPopup(_arg_1:_SafeStr_1665, _arg_2:_SafeStr_3133):void
        {
            var _local_4:_SafeStr_1666 = _SafeStr_1666(_arg_1);
            _arg_2.findChildByName("user_name_txt").caption = _local_4.userName;
            var _local_3:String = "landing.view.competition.hof.points";
            landingView.localizationManager.registerParameter(_local_3, "points", ("" + _local_4.currentScore));
            _arg_2.findChildByName("score_txt").caption = getText(_local_3);
            _arg_2.findChildByName("rank_desc_txt").caption = getText((("landing.view.competition.hof." + _SafeStr_3740.goalCode) + ".rankdesc.leader"));
        }

        override protected function getPopupXml():String
        {
            return ("competition_user_popup");
        }

        private function onCommunityGoalHallOfFame(_arg_1:_SafeStr_886):void
        {
            _SafeStr_3740 = _arg_1.getParser().data;
            refreshContent();
        }

        override protected function hasExtraLink():Boolean
        {
            return (landingView.getBoolean("landing.view.communitygoalhof.hasroomlink"));
        }

        override protected function extraLinkClicked(_arg_1:_SafeStr_1665):void
        {
            landingView.send(new _SafeStr_170(_SafeStr_3740.goalCode, _arg_1.userId));
        }

        private function onTimingCode(_arg_1:_SafeStr_549):void
        {
            var _local_2:String = _arg_1.getParser().code;
            if ((((_arg_1.getParser().schedulingStr == _SafeStr_6297) && (!(_local_2 == ""))) && (!(disposed))))
            {
                loadConfigurationOverrides(_local_2);
                landingView.send(new _SafeStr_376(_arg_1.getParser().code));
            };
        }

        private function loadConfigurationOverrides(_arg_1:String):void
        {
            var _local_4:* = null;
            var _local_3:int;
            var _local_6:String = (("landing.view." + _arg_1) + ".avatarlist.yoffsets.array");
            if (landingView.propertyExists(_local_6))
            {
                _local_4 = landingView.getProperty(_local_6).split(",");
                _local_3 = 0;
                while (_local_3 < _local_4.length)
                {
                    _local_4[_local_3] = parseInt(_local_4[_local_3]);
                    _local_3++;
                };
                avatarOffsetsY = _local_4;
            };
            var _local_5:String = (("landing.view." + _arg_1) + ".avatarlist.widths.array");
            if (landingView.propertyExists(_local_5))
            {
                _local_4 = landingView.getProperty(_local_5).split(",");
                _local_3 = 0;
                while (_local_3 < _local_4.length)
                {
                    _local_4[_local_3] = parseInt(_local_4[_local_3]);
                    _local_3++;
                };
                avatarContainerWidths = _local_4;
            };
            var _local_2:String = (("landing.view." + _arg_1) + ".avatarlist.startoffset");
            if (landingView.propertyExists(_local_2))
            {
                startOffset = parseInt(landingView.getProperty(_local_2));
            };
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_1567 = "_-Zx" (String#32058, DoABC#4)
// _SafeStr_1665 = "_-d1G" (String#7899, DoABC#4)
// _SafeStr_1666 = "_-oM" (String#29426, DoABC#4)
// _SafeStr_170 = "_-4I" (String#28459, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_376 = "_-8h" (String#30864, DoABC#4)
// _SafeStr_549 = "_-Y1W" (String#8530, DoABC#4)
// _SafeStr_6297 = "_-84" (String#4997, DoABC#4)
// _SafeStr_886 = "_-N1j" (String#25550, DoABC#4)
// _SafeStr_947 = "_-iy" (String#12865, DoABC#4)


