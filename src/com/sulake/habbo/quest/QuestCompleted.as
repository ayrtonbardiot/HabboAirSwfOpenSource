// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.QuestCompleted

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window.components._SafeStr_3263;
    import _-41O._SafeStr_1607;
    import _-61d._SafeStr_438;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-61d._SafeStr_545;
    import com.sulake.core.window.components.ITextWindow;

    public class QuestCompleted implements _SafeStr_13 
    {

        private static const _SafeStr_8706:int = 2000;
        private static const TEXT_HEIGHT_SPACING:int = 5;
        private static const MIN_DESC_HEIGHT:int = 31;

        private var _window:_SafeStr_3263;
        private var _questEngine:HabboQuestEngine;
        private var _SafeStr_5684:_SafeStr_1607;
        private var _twinkleAnimation:Animation;
        private var _SafeStr_5685:int;

        public function QuestCompleted(_arg_1:HabboQuestEngine)
        {
            _questEngine = _arg_1;
        }

        public function dispose():void
        {
            _questEngine = null;
            _SafeStr_5684 = null;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_twinkleAnimation)
            {
                _twinkleAnimation.dispose();
                _twinkleAnimation = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_window == null);
        }

        public function onQuest(_arg_1:_SafeStr_1607):void
        {
            close();
        }

        public function onQuestCancelled():void
        {
            close();
        }

        public function onQuestCompleted(_arg_1:_SafeStr_1607, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                prepare(_arg_1);
                _SafeStr_5685 = 2000;
            };
        }

        private function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function onNextQuest(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _window.visible = false;
            _questEngine.questController.questDetails.openForNextQuest = _questEngine.getBoolean("questing.showDetailsForNextQuest");
            _questEngine.send(new _SafeStr_438());
        }

        private function onMoreQuests(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _window.visible = false;
                _questEngine.send(new _SafeStr_545());
            };
        }

        public function prepare(_arg_1:_SafeStr_1607):void
        {
            _SafeStr_5684 = _arg_1;
            if (_window == null)
            {
                _window = _SafeStr_3263(_questEngine.getXmlWindow("QuestCompletedDialog"));
                _window.findChildByTag("close").procedure = onNextQuest;
                _window.findChildByName("next_quest_button").procedure = onNextQuest;
                _window.findChildByName("more_quests_button").procedure = onMoreQuests;
                _window.findChildByName("catalog_link_region").procedure = onCatalogLink;
                _twinkleAnimation = _questEngine.getTwinkleAnimation(_window);
            };
            _window.findChildByName("catalog_link_txt").caption = _questEngine.localization.getLocalization(("quests.completed.cataloglink." + _SafeStr_5684.activityPointType));
            var _local_2:String = ("quests.completed.reward." + _SafeStr_5684.activityPointType);
            _questEngine.localization.registerParameter(_local_2, "amount", _SafeStr_5684.rewardCurrencyAmount.toString());
            _window.findChildByName("reward_txt").caption = _questEngine.localization.getLocalization(_local_2, _local_2);
            _window.findChildByName("reward_txt").visible = ((_SafeStr_5684.activityPointType >= 0) && (_SafeStr_5684.rewardCurrencyAmount > 0));
            _window.visible = false;
            _window.findChildByName("congrats_txt").caption = _questEngine.localization.getLocalization(((_SafeStr_5684.lastQuestInCampaign) ? "quests.completed.campaign.caption" : "quests.completed.quest.caption"));
            _window.findChildByName("more_quests_button").visible = _SafeStr_5684.lastQuestInCampaign;
            _window.findChildByName("campaign_reward_icon").visible = _SafeStr_5684.lastQuestInCampaign;
            _window.findChildByName("catalog_link_region").visible = ((!(_SafeStr_5684.lastQuestInCampaign)) && (_SafeStr_5684.rewardCurrencyAmount > 0));
            _window.findChildByName("next_quest_button").visible = (!(_SafeStr_5684.lastQuestInCampaign));
            _window.findChildByName("reward_icon").visible = (!(_SafeStr_5684.lastQuestInCampaign));
            _window.findChildByName("campaign_reward_icon").visible = _SafeStr_5684.lastQuestInCampaign;
            _window.findChildByName("campaign_pic_bitmap").visible = _SafeStr_5684.lastQuestInCampaign;
            setWindowTitle(((_SafeStr_5684.lastQuestInCampaign) ? "quests.completed.campaign.title" : "quests.completed.quest.title"));
            _questEngine.setupCampaignImage(_window, _arg_1, _SafeStr_5684.lastQuestInCampaign);
            var _local_5:ITextWindow = ITextWindow(_window.findChildByName("desc_txt"));
            var _local_3:int = _local_5.height;
            setDesc((_SafeStr_5684.getQuestLocalizationKey() + ".completed"));
            _local_5.height = Math.max(31, (_local_5.textHeight + 5));
            var _local_4:int = (_local_5.height - _local_3);
            _window.height = (_window.height + _local_4);
        }

        private function setWindowTitle(_arg_1:String):void
        {
            _questEngine.localization.registerParameter(_arg_1, "category", _questEngine.getCampaignName(_SafeStr_5684));
            _window.caption = _questEngine.localization.getLocalization(_arg_1, _arg_1);
        }

        private function setDesc(_arg_1:String):void
        {
            _window.findChildByName("desc_txt").caption = _questEngine.localization.getLocalization(_arg_1, _arg_1);
        }

        private function onCatalogLink(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109=null):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _questEngine.openCatalog(_SafeStr_5684);
            };
        }

        public function update(_arg_1:uint):void
        {
            if (_SafeStr_5685 > 0)
            {
                _SafeStr_5685 = (_SafeStr_5685 - _arg_1);
                if (_SafeStr_5685 < 1)
                {
                    _window.center();
                    _window.visible = true;
                    _window.activate();
                    if (_SafeStr_5684.lastQuestInCampaign)
                    {
                        _twinkleAnimation.restart();
                    }
                    else
                    {
                        _twinkleAnimation.stop();
                    };
                };
            };
            if (_twinkleAnimation != null)
            {
                _twinkleAnimation.update(_arg_1);
            };
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_438 = "_-es" (String#19064, DoABC#4)
// _SafeStr_545 = "_-32" (String#22396, DoABC#4)
// _SafeStr_5684 = "_-91m" (String#1582, DoABC#4)
// _SafeStr_5685 = "_-QO" (String#10093, DoABC#4)
// _SafeStr_8706 = "_-Gc" (String#39645, DoABC#4)


