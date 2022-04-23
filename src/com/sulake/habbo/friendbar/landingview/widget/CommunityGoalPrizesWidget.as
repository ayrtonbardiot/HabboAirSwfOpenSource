// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.CommunityGoalPrizesWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import _-41O._SafeStr_1572;
    import com.sulake.core.window._SafeStr_3109;
    import _-Ol._SafeStr_327;
    import _-41O._SafeStr_511;
    import _-yL._SafeStr_528;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
    import com.sulake.habbo.friendbar.landingview.*;

    public class CommunityGoalPrizesWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _SafeStr_3740:_SafeStr_1572;
        private var _SafeStr_3819:String;

        public function CommunityGoalPrizesWidget(_arg_1:HabboLandingView)
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
            _SafeStr_3740 = null;
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("achievement_competition_prizes"));
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_327(onUserChange));
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_511(onCommunityGoalProgress));
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_528(onUserObject));
        }

        public function refresh():void
        {
            refreshContent();
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        private function refreshContent():void
        {
            if (_SafeStr_3740 == null)
            {
                _container.visible = false;
                return;
            };
            _container.visible = true;
            setPrizeRankLimits(1);
            setPrizeRankLimits(2);
            setPrizeRankLimits(3);
            _landingView.localizationManager.registerParameter(getCompetitionSpecificKey("yourrankinfo"), "points", ("" + _SafeStr_3740.personalContributionScore));
            _container.findChildByName("caption_txt").caption = getCompetitionSpecificText("caption");
            _container.findChildByName("info_txt").caption = getCompetitionSpecificText("info");
            _container.findChildByName("reward_name_txt").caption = getCompetitionSpecificText("rewardname");
            _container.findChildByName("reward_info_txt").caption = getCompetitionSpecificText("rewardinfo");
            _container.findChildByName("rank_1_txt").caption = getCompetitionSpecificText("rank1");
            _container.findChildByName("rank_2_txt").caption = getCompetitionSpecificText("rank2");
            _container.findChildByName("rank_3_txt").caption = getCompetitionSpecificText("rank3");
            _container.findChildByName("user_rank_border").visible = ((!(_SafeStr_3740.hasGoalExpired)) || (_SafeStr_3740.personalContributionRank > 0));
            var _local_1:String = ((_SafeStr_3740.hasGoalExpired) ? "yourfinalrank" : ((_SafeStr_3740.personalContributionRank > 0) ? "yourrank" : "youarenotranked"));
            _landingView.localizationManager.registerParameter(getKey(_local_1), "rank", ("" + _SafeStr_3740.personalContributionRank));
            _container.findChildByName("user_rank_txt").caption = getText(_local_1);
            _container.findChildByName("user_rank_info_txt").visible = (!(_SafeStr_3740.hasGoalExpired));
            _container.findChildByName("user_rank_info_txt").caption = getCompetitionSpecificText(((_SafeStr_3740.personalContributionRank > 0) ? "yourrankinfo" : "youarenotrankedinfo"));
            IStaticBitmapWrapperWindow(_container.findChildByName("reward_image")).assetUri = (("${image.library.url}reception/" + _SafeStr_3740.goalCode) + "Reward.png");
        }

        private function setPrizeRankLimits(_arg_1:int):void
        {
            var _local_3:int = resolveStartRank(_arg_1);
            var _local_2:int = resolveEndRank(_arg_1);
            var _local_4:String = ((_local_3 == _local_2) ? getKey("rank") : getKey("ranks"));
            _landingView.localizationManager.registerParameter(_local_4, "start", ("" + _local_3));
            _landingView.localizationManager.registerParameter(_local_4, "end", ("" + _local_2));
            _container.findChildByName((("rank_" + _arg_1) + "_info_txt")).caption = (("${" + _local_4) + "}");
        }

        private function resolveStartRank(_arg_1:int):int
        {
            var _local_2:int = _SafeStr_3740.rewardUserLimits[(_arg_1 - 2)];
            return (_local_2 + 1);
        }

        private function resolveEndRank(_arg_1:int):int
        {
            return (_SafeStr_3740.rewardUserLimits[(_arg_1 - 1)]);
        }

        private function onCommunityGoalProgress(_arg_1:_SafeStr_511):void
        {
            _SafeStr_3740 = _arg_1.getParser().data;
            refreshContent();
        }

        private function getKey(_arg_1:String):String
        {
            return ("landing.view.competition.prizes." + _arg_1);
        }

        private function getCompetitionSpecificKey(_arg_1:String):String
        {
            return (getKey(((_SafeStr_3740.goalCode + ".") + _arg_1)));
        }

        private function getCompetitionSpecificText(_arg_1:String):String
        {
            var _local_2:String = getCompetitionSpecificKey(_arg_1);
            return (("${" + _local_2) + "}");
        }

        private function getText(_arg_1:String):String
        {
            var _local_2:String = getKey(_arg_1);
            return (("${" + _local_2) + "}");
        }

        private function onUserObject(_arg_1:_SafeStr_528):void
        {
            _SafeStr_3819 = _arg_1.getParser().figure;
            refreshAvatarInfo();
        }

        private function onUserChange(_arg_1:_SafeStr_327):void
        {
            if (((!(_arg_1 == null)) && (_arg_1.id == -1)))
            {
                _SafeStr_3819 = _arg_1.figure;
                refreshAvatarInfo();
            };
        }

        private function refreshAvatarInfo():void
        {
            var _local_1:_SafeStr_3199 = _SafeStr_3199(_container.findChildByName("avatar_image"));
            var _local_2:_SafeStr_3289 = _SafeStr_3289(_local_1.widget);
            _local_2.figure = _SafeStr_3819;
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_container, _arg_1);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_1572 = "_-E1A" (String#14274, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_327 = "_-Uf" (String#3336, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_511 = "_-z1e" (String#4648, DoABC#4)
// _SafeStr_528 = "_-MO" (String#2024, DoABC#4)


