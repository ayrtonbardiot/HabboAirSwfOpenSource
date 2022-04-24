// by nota

//com.sulake.habbo.friendbar.landingview.widget.CommunityGoalVsModeWidgetWithVoting

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import _-H0._SafeStr_809;
    import com.sulake.core.window.events._SafeStr_3116;

    public class CommunityGoalVsModeWidgetWithVoting extends CommunityGoalVsModeWidget 
    {

        private var _voteOptionOneButton:_SafeStr_3109;
        private var _voteOptionTwoButton:_SafeStr_3109;
        private var _voteOption:String;

        public function CommunityGoalVsModeWidgetWithVoting(_arg_1:HabboLandingView)
        {
            super(_arg_1, true);
        }

        override public function initialize():void
        {
            super.initialize();
            _voteOptionOneButton = _SafeStr_6915.findChildByName("community_vote_one_button");
            _voteOptionOneButton.procedure = onVoteOptionOneClick;
            _voteOptionTwoButton = _SafeStr_6915.findChildByName("community_vote_two_button");
            _voteOptionTwoButton.procedure = onVoteOptionTwoClick;
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_809(onInfo));
        }

        override public function refresh():void
        {
            super.refresh();
            if (communityProgress != null)
            {
                if (_voteOptionOneButton != null)
                {
                    _voteOptionOneButton.visible = (communityProgress.personalContributionScore == 0);
                };
                if (_voteOptionTwoButton != null)
                {
                    _voteOptionTwoButton.visible = (communityProgress.personalContributionScore == 0);
                };
            };
        }

        private function onVoteOptionOneClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                hideVoteButtons();
                _landingView.communityGoalVote(1);
                _landingView.tracking.trackGoogle("landingView", "click_voteoption_one");
            };
        }

        private function onVoteOptionTwoClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                hideVoteButtons();
                _landingView.communityGoalVote(2);
                _landingView.tracking.trackGoogle("landingView", "click_voteoption_two");
            };
        }

        private function onInfo(_arg_1:_SafeStr_809):void
        {
            if (_arg_1.getParser().acknowledged)
            {
                hideVoteButtons();
            };
        }

        private function hideVoteButtons():void
        {
            _voteOptionOneButton.visible = false;
            _voteOptionTwoButton.visible = false;
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_6915 = "_-32j" (String#2897, DoABC#4)
// _SafeStr_809 = "_-yf" (String#24543, DoABC#4)


