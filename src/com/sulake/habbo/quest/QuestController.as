// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.QuestController

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.quest.seasonalcalendar.MainWindow;
    import _-41O._SafeStr_1607;

    public class QuestController implements _SafeStr_13, _SafeStr_41 
    {

        private var _questEngine:HabboQuestEngine;
        private var _SafeStr_5150:QuestsList;
        private var _questDetails:QuestDetails;
        private var _SafeStr_5152:QuestCompleted;
        private var _SafeStr_5151:QuestTracker;
        private var _SafeStr_5153:NextQuestTimer;
        private var _SafeStr_5149:MainWindow;

        public function QuestController(_arg_1:HabboQuestEngine)
        {
            _questEngine = _arg_1;
            _SafeStr_5151 = new QuestTracker(_questEngine);
            _SafeStr_5150 = new QuestsList(_questEngine);
            _questDetails = new QuestDetails(_questEngine);
            _SafeStr_5152 = new QuestCompleted(_questEngine);
            _SafeStr_5153 = new NextQuestTimer(_questEngine);
            _SafeStr_5149 = new MainWindow(_questEngine);
        }

        public function onToolbarClick():void
        {
            if (_questEngine.isSeasonalCalendarEnabled())
            {
                _SafeStr_5149.onToolbarClick();
                _SafeStr_5150.close();
            }
            else
            {
                _SafeStr_5150.onToolbarClick();
            };
        }

        public function onQuest(_arg_1:_SafeStr_1607):void
        {
            _SafeStr_5151.onQuest(_arg_1);
            _questDetails.onQuest(_arg_1);
            _SafeStr_5152.onQuest(_arg_1);
            _SafeStr_5153.onQuest(_arg_1);
        }

        public function onQuestCompleted(_arg_1:_SafeStr_1607, _arg_2:Boolean):void
        {
            _SafeStr_5151.onQuestCompleted(_arg_1, _arg_2);
            _questDetails.onQuestCompleted(_arg_1);
            _SafeStr_5152.onQuestCompleted(_arg_1, _arg_2);
        }

        public function onQuestCancelled():void
        {
            _SafeStr_5151.onQuestCancelled();
            _questDetails.onQuestCancelled();
            _SafeStr_5152.onQuestCancelled();
            _SafeStr_5153.onQuestCancelled();
        }

        public function onRoomEnter():void
        {
            _SafeStr_5151.onRoomEnter();
        }

        public function onRoomExit():void
        {
            _SafeStr_5150.onRoomExit();
            _SafeStr_5149.onRoomExit();
            _SafeStr_5151.onRoomExit();
            _questDetails.onRoomExit();
            _SafeStr_5153.onRoomExit();
        }

        public function update(_arg_1:uint):void
        {
            _SafeStr_5152.update(_arg_1);
            _SafeStr_5151.update(_arg_1);
            _SafeStr_5153.update(_arg_1);
            _SafeStr_5150.update(_arg_1);
            _questDetails.update(_arg_1);
            _SafeStr_5149.update(_arg_1);
        }

        public function dispose():void
        {
            _questEngine = null;
            if (_SafeStr_5150)
            {
                _SafeStr_5150.dispose();
                _SafeStr_5150 = null;
            };
            if (_SafeStr_5151)
            {
                _SafeStr_5151.dispose();
                _SafeStr_5151 = null;
            };
            if (_questDetails)
            {
                _questDetails.dispose();
                _questDetails = null;
            };
            if (_SafeStr_5152)
            {
                _SafeStr_5152.dispose();
                _SafeStr_5152 = null;
            };
            if (_SafeStr_5153)
            {
                _SafeStr_5153.dispose();
                _SafeStr_5153 = null;
            };
            if (_SafeStr_5149)
            {
                _SafeStr_5149.dispose();
                _SafeStr_5149 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function get questsList():QuestsList
        {
            return (_SafeStr_5150);
        }

        public function get questDetails():QuestDetails
        {
            return (_questDetails);
        }

        public function get questTracker():QuestTracker
        {
            return (_SafeStr_5151);
        }

        public function get seasonalCalendarWindow():MainWindow
        {
            return (_SafeStr_5149);
        }

        public function onActivityPoints(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_5149)
            {
                _SafeStr_5149.onActivityPoints(_arg_1, _arg_2);
            };
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_5149 = "_-zO" (String#5574, DoABC#4)
// _SafeStr_5150 = "_-G1e" (String#5973, DoABC#4)
// _SafeStr_5151 = "_-S1a" (String#5356, DoABC#4)
// _SafeStr_5152 = "_-Tl" (String#6545, DoABC#4)
// _SafeStr_5153 = "_-w1l" (String#6610, DoABC#4)


