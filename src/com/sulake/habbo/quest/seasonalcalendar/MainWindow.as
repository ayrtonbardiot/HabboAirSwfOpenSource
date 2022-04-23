// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.seasonalcalendar.MainWindow

package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.quest.HabboQuestEngine;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.utils.WindowToggle;
    import com.sulake.habbo.quest.events.QuestsListEvent;
    import com.sulake.habbo.quest.events.QuestCompletedEvent;
    import _-41O._SafeStr_1607;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class MainWindow implements _SafeStr_13 
    {

        private var _questEngine:HabboQuestEngine;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4080:WindowToggle;
        private var _calendar:Calendar;
        private var _SafeStr_5633:CatalogPromo;
        private var _SafeStr_5634:RareTeaser;
        private var _SafeStr_5636:Boolean = false;
        private var _SafeStr_5635:int;

        public function MainWindow(_arg_1:HabboQuestEngine)
        {
            _questEngine = _arg_1;
            _calendar = new Calendar(_questEngine, this);
            _SafeStr_5633 = new CatalogPromo(_questEngine, this);
            _SafeStr_5634 = new RareTeaser(_questEngine);
            _questEngine.events.addEventListener("qe_quests_seasonal", onSeasonalQuests);
            _questEngine.events.addEventListener("qce_seasonal", onSeasonalQuestCompleted);
        }

        public function dispose():void
        {
            if (_questEngine)
            {
                _questEngine.events.removeEventListener("qe_quests_seasonal", onSeasonalQuests);
                _questEngine.events.removeEventListener("qce_seasonal", onSeasonalQuestCompleted);
                _questEngine = null;
            };
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_4080)
            {
                _SafeStr_4080.dispose();
                _SafeStr_4080 = null;
            };
            if (_calendar)
            {
                _calendar.close();
                _calendar.dispose();
                _calendar = null;
            };
            if (_SafeStr_5633)
            {
                _SafeStr_5633.dispose();
                _SafeStr_5633 = null;
            };
            if (_SafeStr_5634)
            {
                _SafeStr_5634.dispose();
                _SafeStr_5634 = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function isVisible():Boolean
        {
            return ((_window) && (_window.visible));
        }

        public function close():void
        {
            if (_calendar)
            {
                _calendar.close();
            };
            if (_window)
            {
                _window.visible = false;
            };
        }

        public function onRoomExit():void
        {
            this.close();
        }

        public function onToolbarClick():void
        {
            if (!_window)
            {
                _questEngine.requestSeasonalQuests();
                return;
            };
            if (((!(_SafeStr_4080)) || (_SafeStr_4080.disposed)))
            {
                _SafeStr_4080 = new WindowToggle(_window, _window.desktop, _questEngine.requestSeasonalQuests, close);
            };
            _SafeStr_4080.toggle();
        }

        public function getCalendarImageGalleryHost():String
        {
            var _local_1:String = _questEngine.getSeasonalCampaignCodePrefix();
            return ((_questEngine.configuration.getProperty("image.library.url") + _local_1) + "_quest_calendar/");
        }

        public function onQuests(_arg_1:Array, _arg_2:Boolean):void
        {
            if (((!(this.isVisible())) && (!(_arg_2))))
            {
                return;
            };
            _SafeStr_5635 = resolveCurrentDay(_arg_1);
            _calendar.onQuests(_arg_1);
            refresh();
            if (_arg_2)
            {
                this._window.visible = true;
                this._window.activate();
            };
        }

        private function onSeasonalQuests(_arg_1:QuestsListEvent):void
        {
            this.onQuests(_arg_1.quests, true);
        }

        private function onSeasonalQuestCompleted(_arg_1:QuestCompletedEvent):void
        {
            _questEngine.questController.questTracker.forceWindowCloseAfterAnimationsFinished();
            _questEngine.requestSeasonalQuests();
        }

        public function onActivityPoints(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_5633.onActivityPoints(_arg_1, _arg_2);
        }

        private function resolveCurrentDay(_arg_1:Array):int
        {
            var _local_2:int;
            for each (var _local_3:_SafeStr_1607 in _arg_1)
            {
                if (_questEngine.isSeasonalQuest(_local_3))
                {
                    _local_2 = Math.max(_local_2, _local_3.sortOrder);
                };
            };
            return (_local_2);
        }

        private function refresh():void
        {
            prepareWindow();
            _calendar.refresh();
            _SafeStr_5633.refresh();
            _SafeStr_5634.refresh();
        }

        private function prepareWindow():void
        {
            if (this._window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_questEngine.getXmlWindow("SeasonalCalendar"));
            var _local_1:String = (("quests." + _questEngine.getSeasonalCampaignCodePrefix()) + ".title");
            _window.caption = _questEngine.localization.getLocalizationWithParams(_local_1, _local_1);
            _window.findChildByTag("close").procedure = onWindowClose;
            _calendar.prepare(_window);
            _SafeStr_5633.prepare(_window);
            _SafeStr_5634.prepare(_window);
            _window.center();
        }

        private function onWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                close();
            };
        }

        public function get currentDay():int
        {
            return (_SafeStr_5635);
        }

        public function get catalogPromo():CatalogPromo
        {
            return (_SafeStr_5633);
        }

        public function update(_arg_1:uint):void
        {
            if (((((!(_questEngine.configuration == null)) && (_questEngine.isFirstLoginOfDay)) && (!(_SafeStr_5636))) && (_questEngine.isSeasonalCalendarEnabled())))
            {
                _questEngine.requestSeasonalQuests();
                _SafeStr_5636 = true;
            };
        }


    }
}//package com.sulake.habbo.quest.seasonalcalendar

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4080 = "_-D1I" (String#2500, DoABC#4)
// _SafeStr_5633 = "_-PU" (String#6664, DoABC#4)
// _SafeStr_5634 = "_-Q1i" (String#8053, DoABC#4)
// _SafeStr_5635 = "_-W1W" (String#17182, DoABC#4)
// _SafeStr_5636 = "_-X" (String#21830, DoABC#4)


