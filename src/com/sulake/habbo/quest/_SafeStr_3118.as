// by nota

//com.sulake.habbo.quest._SafeStr_3118

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import _-y1x._SafeStr_605;
    import _-q1B._SafeStr_839;
    import _-q1B._SafeStr_948;
    import _-yL._SafeStr_451;
    import _-g1x._SafeStr_378;
    import _-Ol._SafeStr_194;
    import _-41O._SafeStr_335;
    import _-EK._SafeStr_201;
    import _-p1o._SafeStr_1039;
    import _-g1x._SafeStr_654;
    import _-Ol._SafeStr_484;
    import _-41O._SafeStr_921;
    import _-q1B._SafeStr_469;
    import _-EK._SafeStr_281;
    import _-41O._SafeStr_952;
    import _-p1o._SafeStr_447;
    import _-n1H._SafeStr_513;
    import _-Ol._SafeStr_323;
    import _-EK._SafeStr_446;
    import _-41O._SafeStr_937;
    import _-W1K._SafeStr_990;
    import _-41O._SafeStr_851;
    import _-p1o._SafeStr_804;
    import _-3D._SafeStr_1326;
    import com.sulake.habbo.quest.events.QuestCompletedEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-3D._SafeStr_1183;
    import com.sulake.habbo.quest.events.QuestsListEvent;
    import _-3D._SafeStr_1491;
    import _-3D._SafeStr_1152;
    import _-IV._SafeStr_1425;
    import _-71X._SafeStr_1410;
    import _-71X._SafeStr_1517;
    import _-71X._SafeStr_1471;
    import _-IV._SafeStr_1343;
    import _-IV._SafeStr_1340;
    import _-28._SafeStr_1189;
    import _-qv._SafeStr_895;
    import _-K1r._SafeStr_1070;
    import flash.utils.Dictionary;
    import com.sulake.habbo.catalog.purse._SafeStr_3226;

    [SecureSWF(rename="true")]
    public class _SafeStr_3118 implements _SafeStr_13 
    {

        private var _questEngine:HabboQuestEngine;
        private var _SafeStr_4037:_SafeStr_3114;
        private var _SafeStr_4036:Boolean = false;

        public function _SafeStr_3118(_arg_1:HabboQuestEngine)
        {
            _questEngine = _arg_1;
            var _local_2:IHabboCommunicationManager = _questEngine.communication;
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_605(onRoomExit));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_839(onAchievementResolutions));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_948(onAchievementResolutionCompleted));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_451(onIsFirstLoginOfDay));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_378(onCompetitionVotingInfo));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_194(onFurnisChanged));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_335(onSeasonalQuests));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_201(onLevelUp));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_1039(onAchievementsScore));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_654(onCompetitionEntrySubmitResult));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_484(onRoomEnter));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_921(onQuest));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_469(onAchievementResolutionProgress));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_281(onActivityPoints));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_952(onQuestCompleted));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_447(onAchievements));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_513(onRoomSettingsSaved));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_323(onFurnisChanged));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_446(onActivityPointsNotification));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_937(onQuestCancelled));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_990(onSubscriptionUserInfoEvent));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_851(onQuests));
            _local_2.addHabboConnectionMessageEvent(new _SafeStr_804(onAchievement));
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        private function onQuestCompleted(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1326 = (_arg_1 as _SafeStr_952).getParser();
            _SafeStr_14.log(((("Quest Completed: " + _local_2.questData.campaignCode) + " quest: ") + _local_2.questData.id));
            _questEngine.questController.onQuestCompleted(_local_2.questData, _local_2.showDialog);
            if (_questEngine.isSeasonalQuest(_local_2.questData))
            {
                _questEngine.events.dispatchEvent(new QuestCompletedEvent("qce_seasonal", _local_2.questData));
            };
        }

        private function onQuestCancelled(_arg_1:IMessageEvent):void
        {
            _SafeStr_14.log("Quest Cancelled: ");
            _questEngine.questController.onQuestCancelled();
            if (_SafeStr_937(_arg_1).getParser().expired)
            {
                _questEngine.windowManager.alert("${quests.expired.title}", "${quests.expired.body}", 0, null);
            };
        }

        private function onQuests(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1183 = (_arg_1 as _SafeStr_851).getParser();
            _SafeStr_14.log(((("Got Quests: " + _local_2.quests) + ", ") + _local_2.openWindow));
            _questEngine.events.dispatchEvent(new QuestsListEvent("qu_quests", _local_2.quests, _local_2.openWindow));
        }

        private function onSeasonalQuests(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1491 = (_arg_1 as _SafeStr_335).getParser();
            _SafeStr_14.log(("Got seasonal Quests: " + _local_2.quests));
            _questEngine.events.dispatchEvent(new QuestsListEvent("qe_quests_seasonal", _local_2.quests, true));
        }

        private function onQuest(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1152 = (_arg_1 as _SafeStr_921).getParser();
            _SafeStr_14.log(("Got Quest: " + _local_2.quest));
            _questEngine.questController.onQuest(_local_2.quest);
        }

        public function dispose():void
        {
            if (_SafeStr_4037)
            {
                _SafeStr_4037.dispose();
                _SafeStr_4037 = null;
            };
            _SafeStr_4036 = true;
        }

        private function onRoomEnter(_arg_1:_SafeStr_484):void
        {
            _questEngine.roomCompetitionController.onRoomEnter(_arg_1);
            _questEngine.currentlyInRoom = true;
        }

        private function onRoomExit(_arg_1:IMessageEvent):void
        {
            _questEngine.questController.onRoomExit();
            _questEngine.achievementController.onRoomExit();
            _questEngine.roomCompetitionController.onRoomExit();
            _questEngine.currentlyInRoom = false;
        }

        private function onFurnisChanged(_arg_1:IMessageEvent):void
        {
            _questEngine.roomCompetitionController.onContextChanged();
        }

        private function onRoomSettingsSaved(_arg_1:IMessageEvent):void
        {
            _questEngine.roomCompetitionController.onContextChanged();
        }

        private function onAchievements(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_447 = (_arg_1 as _SafeStr_447);
            var _local_3:_SafeStr_1425 = (_local_2.getParser() as _SafeStr_1425);
            _questEngine.achievementController.onAchievements(_local_3.achievements, _local_3.defaultCategory);
        }

        private function onAchievementResolutions(_arg_1:_SafeStr_839):void
        {
            var _local_2:_SafeStr_1410 = _arg_1.getParser();
            _questEngine.achievementsResolutionController.onResolutionAchievements(_local_2.stuffId, _local_2.achievements, _local_2.endTime);
        }

        private function onAchievementResolutionProgress(_arg_1:_SafeStr_469):void
        {
            var _local_2:_SafeStr_1517 = _arg_1.getParser();
            _questEngine.achievementsResolutionController.onResolutionProgress(_local_2.stuffId, _local_2.achievementId, _local_2.requiredLevelBadgeCode, _local_2.userProgress, _local_2.totalProgress, _local_2.endTime);
        }

        private function onAchievementResolutionCompleted(_arg_1:_SafeStr_948):void
        {
            var _local_2:_SafeStr_1471 = _arg_1.getParser();
            _questEngine.achievementsResolutionController.onResolutionCompleted(_local_2.badgeCode, _local_2.stuffCode);
        }

        private function onAchievement(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_804 = (_arg_1 as _SafeStr_804);
            var _local_3:_SafeStr_1343 = (_local_2.getParser() as _SafeStr_1343);
            _questEngine.achievementController.onAchievement(_local_3.achievement);
            _questEngine.achievementsResolutionController.onAchievement(_local_3.achievement);
        }

        private function onAchievementsScore(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1039 = (_arg_1 as _SafeStr_1039);
            var _local_3:_SafeStr_1340 = (_local_2.getParser() as _SafeStr_1340);
            _questEngine.localization.registerParameter("achievements.categories.score", "score", _local_3.score.toString());
        }

        private function onLevelUp(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_201 = (_arg_1 as _SafeStr_201);
            var _local_3:_SafeStr_1189 = _local_2.getParser();
            var _local_4:String = _questEngine.localization.getBadgeBaseName(_local_3.data.badgeCode);
            _questEngine.send(new _SafeStr_895("Achievements", _local_4, "Leveled", "", _local_3.data.level));
            _questEngine.achievementsResolutionController.onLevelUp(_local_3.data);
        }

        private function onIsFirstLoginOfDay(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1070 = (_arg_1 as _SafeStr_451).getParser();
            _questEngine.setIsFirstLoginOfDay(_local_2.isFirstLoginOfDay);
        }

        private function onCompetitionEntrySubmitResult(_arg_1:_SafeStr_654):void
        {
            _questEngine.roomCompetitionController.onCompetitionEntrySubmitResult(_arg_1);
        }

        private function onCompetitionVotingInfo(_arg_1:_SafeStr_378):void
        {
            _questEngine.roomCompetitionController.onCompetitionVotingInfo(_arg_1);
        }

        private function onSubscriptionUserInfoEvent(_arg_1:_SafeStr_990):void
        {
            if (((_arg_1.getParser().isVIP) && (_arg_1.getParser().responseType == 2)))
            {
                _questEngine.roomCompetitionController.sendRoomCompetitionInit();
            };
        }

        private function onActivityPoints(_arg_1:IMessageEvent):void
        {
            var _local_3:Dictionary = _SafeStr_281(_arg_1).points;
            for each (var _local_4:int in _SafeStr_3226.values())
            {
                _questEngine.questController.onActivityPoints(_local_4, 0);
            };
            for (var _local_2:Object in _local_3)
            {
                _questEngine.questController.onActivityPoints(_local_2, _local_3[_local_2]);
            };
        }

        private function onActivityPointsNotification(_arg_1:_SafeStr_446):void
        {
            _questEngine.questController.onActivityPoints(_arg_1.type, _arg_1.amount);
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_1039 = "_-aE" (String#10070, DoABC#4)
// _SafeStr_1070 = "_-6z" (String#38517, DoABC#4)
// _SafeStr_1152 = "_-ho" (String#32306, DoABC#4)
// _SafeStr_1183 = "_-Dd" (String#39612, DoABC#4)
// _SafeStr_1189 = "_-9l" (String#22603, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1326 = "_-41r" (String#32981, DoABC#4)
// _SafeStr_1340 = "_-e1r" (String#17663, DoABC#4)
// _SafeStr_1343 = "_-019" (String#29166, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1410 = "_-4i" (String#38583, DoABC#4)
// _SafeStr_1425 = "_-G1h" (String#29021, DoABC#4)
// _SafeStr_1471 = "_-v1W" (String#34147, DoABC#4)
// _SafeStr_1491 = "_-v1B" (String#35085, DoABC#4)
// _SafeStr_1517 = "_-O5" (String#39308, DoABC#4)
// _SafeStr_194 = "_-Y1T" (String#7719, DoABC#4)
// _SafeStr_201 = "_-w1t" (String#4981, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_281 = "_-OA" (String#10431, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_3226 = "_-G14" (String#4868, DoABC#4)
// _SafeStr_323 = "_-P6" (String#13370, DoABC#4)
// _SafeStr_335 = "_-v1N" (String#24349, DoABC#4)
// _SafeStr_378 = "_-8Z" (String#22238, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4037 = "_-31M" (String#15302, DoABC#4)
// _SafeStr_446 = "_-32Q" (String#7689, DoABC#4)
// _SafeStr_447 = "_-s1b" (String#18501, DoABC#4)
// _SafeStr_451 = "_-PT" (String#23704, DoABC#4)
// _SafeStr_469 = "_-Wn" (String#24375, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_513 = "_-M1S" (String#8781, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_654 = "_-Jq" (String#13896, DoABC#4)
// _SafeStr_804 = "_-vr" (String#18468, DoABC#4)
// _SafeStr_839 = "_-uH" (String#23734, DoABC#4)
// _SafeStr_851 = "_-i1D" (String#23050, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)
// _SafeStr_921 = "_-r4" (String#23332, DoABC#4)
// _SafeStr_937 = "_-g1V" (String#23272, DoABC#4)
// _SafeStr_948 = "_-Q9" (String#23685, DoABC#4)
// _SafeStr_952 = "_-l1J" (String#23676, DoABC#4)
// _SafeStr_990 = "_-D1i" (String#4238, DoABC#4)


