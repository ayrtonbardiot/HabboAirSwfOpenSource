// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.CommunityGoalWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import _-41O._SafeStr_1572;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.runtime._SafeStr_20;
    import _-41O._SafeStr_511;
    import com.sulake.core.window.components.ITextWindow;
    import _-61d._SafeStr_750;
    import _-3D._SafeStr_1071;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
    import com.sulake.habbo.friendbar.landingview.*;

    public class CommunityGoalWidget implements _SafeStr_41, ILandingViewWidget, ISettingsAwareWidget 
    {

        private static const CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES:Array = [0, 8, 16, 23];
        private static const METER_INITIAL_DELAY_MS:int = 1500;
        private static const METER_BUILDUP_TIME_MS:int = 1000;

        protected var _landingView:HabboLandingView;
        protected var _SafeStr_6915:_SafeStr_3133;
        private var _SafeStr_6919:IStaticBitmapWrapperWindow;
        protected var _SafeStr_6918:_SafeStr_1572;
        private var _SafeStr_6920:Boolean = false;
        private var _SafeStr_6921:Number = 0;
        private var _SafeStr_6922:Number = 0;
        private var _SafeStr_3883:Boolean = false;
        private var _SafeStr_6917:Boolean = true;
        private var _SafeStr_6916:Boolean = false;

        public function CommunityGoalWidget(_arg_1:HabboLandingView, _arg_2:Boolean=false)
        {
            _landingView = _arg_1;
            _SafeStr_6916 = _arg_2;
        }

        public function get container():_SafeStr_3109
        {
            return (_SafeStr_6915);
        }

        public function dispose():void
        {
            if (((!(_landingView == null)) && (_landingView.windowManager)))
            {
                _SafeStr_20(_landingView.windowManager).removeUpdateReceiver(this);
            };
            _landingView = null;
            _SafeStr_6915 = null;
            _SafeStr_6918 = null;
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        public function initialize():void
        {
            var _local_1:* = null;
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_511(onCommunityGoalProgress));
            _SafeStr_6915 = _SafeStr_3133(((_SafeStr_6916) ? _landingView.getXmlWindow("community_goal_voting") : _landingView.getXmlWindow("community_goal")));
            _SafeStr_6919 = IStaticBitmapWrapperWindow(_SafeStr_6915.findChildByName("meter_needle"));
            if (!_SafeStr_6916)
            {
                _local_1 = _SafeStr_6915.findChildByName("community_catalog_button");
                _SafeStr_6917 = _landingView.getBoolean("landing.view.community.interactive");
                _local_1.visible = _SafeStr_6917;
                _local_1.procedure = onCommunityCatalogButtonClick;
            };
            HabboLandingView.positionAfterAndStretch(_SafeStr_6915, "community_title", "hdr_line");
        }

        private function campaignizeMeterElementAssetUri(_arg_1:_SafeStr_3109):void
        {
            var _local_3:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_arg_1);
            var _local_2:int = _local_3.assetUri.indexOf(".png");
            _local_3.assetUri = (((_local_3.assetUri.substr(0, _local_2) + "_") + _SafeStr_6918.goalCode) + ".png");
        }

        protected function setCampaignLocalization(_arg_1:String, _arg_2:String):void
        {
            var _local_3:_SafeStr_3109 = _SafeStr_6915.findChildByName(_arg_1);
            if (_local_3 != null)
            {
                _local_3.caption = (((("${" + _arg_2) + ".") + _SafeStr_6918.goalCode) + "}");
            };
        }

        protected function getCurrentNeedleFrame():int
        {
            if (_SafeStr_6918.communityHighestAchievedLevel >= (CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length - 1))
            {
                return (CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[(CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length - 1)]);
            };
            var _local_1:int = CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[_SafeStr_6918.communityHighestAchievedLevel];
            var _local_2:int = (CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[(_SafeStr_6918.communityHighestAchievedLevel + 1)] - _local_1);
            return (_local_1 + Math.floor(((_SafeStr_6918.percentCompletionTowardsNextLevel * (_local_2 + 0.001)) / 100)));
        }

        private function initializeLocalizations():void
        {
            var _local_1:int;
            if (((!(_SafeStr_6918 == null)) && (!(_SafeStr_6918.goalCode == null))))
            {
                _local_1 = 0;
                while (_local_1 < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
                {
                    campaignizeMeterElementAssetUri(_SafeStr_6915.findChildByName(("meter_level_" + _local_1)));
                    if (_local_1 > 0)
                    {
                        campaignizeMeterElementAssetUri(_SafeStr_6915.findChildByName((("meter_level_" + _local_1) + "_icon")));
                        campaignizeMeterElementAssetUri(_SafeStr_6915.findChildByName((("meter_level_" + _local_1) + "_icon_locked")));
                    };
                    _local_1++;
                };
                setCampaignLocalization("community_title", "landing.view.community.headline");
                setCampaignLocalization("goal_caption", "landing.view.community.caption");
                setCampaignLocalization("goal_info", "landing.view.community.info");
                setCampaignLocalization("community_catalog_button", "landing.view.community_catalog_button.text");
                _SafeStr_3883 = true;
            };
        }

        private function refreshContent():void
        {
            var _local_3:int;
            if (_SafeStr_6918 == null)
            {
                _SafeStr_6915.visible = false;
                return;
            };
            if (!_SafeStr_3883)
            {
                initializeLocalizations();
            };
            _local_3 = 1;
            while (_local_3 < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
            {
                _SafeStr_6915.findChildByName(("meter_level_" + _local_3)).visible = false;
                _SafeStr_6915.findChildByName((("meter_level_" + _local_3) + "_icon")).visible = false;
                _SafeStr_6915.findChildByName((("meter_level_" + _local_3) + "_icon_locked")).visible = false;
                _local_3++;
            };
            var _local_2:String = "landing.view.community.meter";
            _landingView.localizationManager.registerParameter(_local_2, "userRank", _SafeStr_6918.personalContributionRank.toString());
            _landingView.localizationManager.registerParameter(_local_2, "userAmount", _SafeStr_6918.personalContributionScore.toString());
            _landingView.localizationManager.registerParameter(_local_2, "totalAmount", _SafeStr_6918.communityTotalScore.toString());
            if (((!(_SafeStr_6918 == null)) && (!(_SafeStr_6918.goalCode == null))))
            {
                _landingView.localizationManager.registerParameter(("landing.view.community.meter." + _SafeStr_6918.goalCode), "totalAmount", _SafeStr_6918.communityTotalScore.toString());
                setCampaignLocalization("community_total_status", "landing.view.community.meter");
                if (_SafeStr_6916)
                {
                    setCampaignLocalization("community_vote_one_button", "landing.view.vote_one_button.text");
                    setCampaignLocalization("community_vote_two_button", "landing.view.vote_two_button.text");
                };
            };
            var _local_1:ITextWindow = ITextWindow(_SafeStr_6915.findChildByName("goal_info"));
            _local_1.height = (_local_1.textHeight + 6);
            if (!_SafeStr_6916)
            {
                _SafeStr_6915.findChildByName("community_catalog_button").visible = _SafeStr_6917;
            };
            _SafeStr_6915.visible = true;
            _SafeStr_6915.invalidate();
        }

        protected function updateMeter(_arg_1:int, _arg_2:Boolean=true):void
        {
            var _local_3:int;
            var _local_4:Boolean;
            _local_3 = 1;
            while (_local_3 < CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES.length)
            {
                _local_4 = ((_arg_2) && (_arg_1 >= CHALLENGE_LEVEL_NEEDLE_BASE_FRAMES[_local_3]));
                _SafeStr_6915.findChildByName(("meter_level_" + _local_3)).visible = _local_4;
                _SafeStr_6915.findChildByName((("meter_level_" + _local_3) + "_icon")).visible = _local_4;
                _SafeStr_6915.findChildByName((("meter_level_" + _local_3) + "_icon_locked")).visible = (!(_local_4));
                _local_3++;
            };
            _SafeStr_6919.assetUri = ("landing_view_needle_meter_needle" + _arg_1);
        }

        public function refresh():void
        {
            requestCommunityGoalProgress();
            refreshContent();
        }

        private function requestCommunityGoalProgress():void
        {
            if (!_SafeStr_6920)
            {
                _landingView.send(new _SafeStr_750());
                _SafeStr_6920 = true;
            };
        }

        public function update(_arg_1:uint):void
        {
            _SafeStr_6921 = (_SafeStr_6921 + _arg_1);
            if (_SafeStr_6921 > 1500)
            {
                _SafeStr_6922 = (_SafeStr_6922 + (_arg_1 / 1000));
                if (_SafeStr_6922 > 1)
                {
                    _SafeStr_6922 = 1;
                    _SafeStr_20(_landingView.windowManager).removeUpdateReceiver(this);
                };
                updateMeter(Math.floor((getCurrentNeedleFrame() * _SafeStr_6922)));
            };
        }

        private function onCommunityGoalProgress(_arg_1:IMessageEvent):void
        {
            _SafeStr_6918 = _SafeStr_1071(_arg_1.parser).data;
            _SafeStr_6920 = false;
            refreshContent();
            _SafeStr_20(_landingView.windowManager).registerUpdateReceiver(this, 10);
        }

        private function onCommunityCatalogButtonClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _landingView.getProperty("landing.view.community.catalog.target");
                _landingView.catalog.openCatalogPage(_local_3);
                _landingView.tracking.trackGoogle("landingView", "click_communityCatalogTarget");
            };
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_SafeStr_6915, _arg_1);
        }

        protected function get communityProgress():_SafeStr_1572
        {
            return (_SafeStr_6918);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_1071 = "_-H6" (String#39882, DoABC#4)
// _SafeStr_1572 = "_-E1A" (String#14274, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_511 = "_-z1e" (String#4648, DoABC#4)
// _SafeStr_6915 = "_-32j" (String#2897, DoABC#4)
// _SafeStr_6916 = "_-Vn" (String#11421, DoABC#4)
// _SafeStr_6917 = "_-S1p" (String#15590, DoABC#4)
// _SafeStr_6918 = "_-rx" (String#3565, DoABC#4)
// _SafeStr_6919 = "_-w1f" (String#19353, DoABC#4)
// _SafeStr_6920 = "_-X1m" (String#11664, DoABC#4)
// _SafeStr_6921 = "_-1S" (String#15052, DoABC#4)
// _SafeStr_6922 = "_-l15" (String#9604, DoABC#4)
// _SafeStr_750 = "_-jP" (String#7227, DoABC#4)


