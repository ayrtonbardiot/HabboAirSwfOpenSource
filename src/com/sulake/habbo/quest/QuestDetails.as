// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.quest.QuestDetails

package com.sulake.habbo.quest
{
    import com.sulake.core.runtime._SafeStr_13;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3263;
    import _-41O._SafeStr_1607;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-61d._SafeStr_448;
    import _-61d._SafeStr_410;
    import _-61d._SafeStr_917;

    public class QuestDetails implements _SafeStr_13 
    {

        private static const _SafeStr_8698:int = 56;
        private static const SPACING:int = 5;
        private static const TEXT_HEIGHT_SPACING:int = 5;
        private static const _SafeStr_5826:Point = new Point(8, 8);
        private static const _SafeStr_5827:Array = ["PLACE_ITEM", "PLACE_FLOOR", "PLACE_WALLPAPER", "PET_DRINK", "PET_EAT"];

        private var _questEngine:HabboQuestEngine;
        private var _window:_SafeStr_3263;
        private var _SafeStr_5825:Boolean;
        private var _SafeStr_5684:_SafeStr_1607;
        private var _msecsToRefresh:int;
        private var _SafeStr_5828:Boolean = false;

        public function QuestDetails(_arg_1:HabboQuestEngine)
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
        }

        public function get disposed():Boolean
        {
            return (_questEngine == null);
        }

        public function onQuest(_arg_1:_SafeStr_1607):void
        {
            if (_SafeStr_5825)
            {
                _SafeStr_5825 = false;
                openDetails(_arg_1);
            }
            else
            {
                if (((_SafeStr_5684 == null) || (!(_SafeStr_5684.id == _arg_1.id))))
                {
                    close();
                };
            };
        }

        public function onQuestCompleted(_arg_1:_SafeStr_1607):void
        {
            close();
        }

        public function onQuestCancelled():void
        {
            close();
        }

        public function onRoomExit():void
        {
            close();
        }

        private function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        public function showDetails(_arg_1:_SafeStr_1607):void
        {
            if (((_window) && (_window.visible)))
            {
                _window.visible = false;
                return;
            };
            openDetails(_arg_1);
        }

        public function openDetails(_arg_1:_SafeStr_1607, _arg_2:Boolean=false):void
        {
            var _local_5:* = null;
            _SafeStr_5684 = _arg_1;
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_5828 = _arg_2;
            if (_window == null)
            {
                _window = _SafeStr_3263(_questEngine.getXmlWindow("QuestDetails"));
                _window.findChildByTag("close").procedure = onDetailsWindowClose;
                _window.center();
                _local_5 = _questEngine.questController.questsList.createListEntry(onAcceptQuest, onCancelQuest);
                _local_5.x = _SafeStr_5826.x;
                _local_5.y = _SafeStr_5826.y;
                _window.content.addChild(_local_5);
                _window.findChildByName("link_region").procedure = onLinkProc;
            };
            _local_5 = _SafeStr_3133(_window.findChildByName("entry_container"));
            _questEngine.questController.questsList.refreshEntryDetails(_local_5, _arg_1);
            var _local_8:* = (_SafeStr_5684.waitPeriodSeconds > 0);
            var _local_3:ITextWindow = ITextWindow(_local_5.findChildByName("hint_txt"));
            var _local_9:int = getTextHeight(_local_3);
            if (!_local_8)
            {
                _local_3.caption = _questEngine.getQuestHint(_arg_1);
                _local_3.height = (_local_3.textHeight + 5);
            };
            _local_3.visible = (!(_local_8));
            var _local_4:int = (getTextHeight(_local_3) - _local_9);
            var _local_7:int = setupLink("link_region", ((_local_3.y + _local_3.height) + 5));
            var _local_6:_SafeStr_3133 = _SafeStr_3133(_local_5.findChildByName("quest_container"));
            _local_6.height = (_local_6.height + (_local_4 + _local_7));
            _questEngine.questController.questsList.setEntryHeight(_local_5);
            _window.height = (_local_5.height + 56);
            _window.visible = true;
            _window.activate();
        }

        private function setupLink(_arg_1:String, _arg_2:int):int
        {
            var _local_3:Boolean = hasCatalogLink();
            var _local_8:Boolean = ((!(_local_3)) && (hasNavigatorLink()));
            var _local_5:Boolean = (((!(_local_3)) && (!(_local_8))) && (hasRoomLink()));
            var _local_6:Boolean = (((_local_3) || (_local_8)) || (_local_5));
            var _local_7:IRegionWindow = IRegionWindow(_window.findChildByName(_arg_1));
            _local_7.y = _arg_2;
            var _local_4:int;
            if (((_local_6) && (!(_local_7.visible))))
            {
                _local_4 = (5 + _local_7.height);
            };
            if (((!(_local_6)) && (_local_7.visible)))
            {
                _local_4 = (-(5) - _local_7.height);
            };
            _local_7.visible = _local_6;
            _local_7.findChildByName("link_catalog").visible = _local_3;
            _local_7.findChildByName("link_navigator").visible = _local_8;
            _local_7.findChildByName("link_room").visible = _local_5;
            return (_local_4);
        }

        private function hasCatalogLink():Boolean
        {
            return ((_SafeStr_5684.waitPeriodSeconds < 1) && (_SafeStr_5827.indexOf(_SafeStr_5684.type) > -1));
        }

        private function hasNavigatorLink():Boolean
        {
            var _local_2:Boolean = _questEngine.hasLocalizedValue((_SafeStr_5684.getCampaignLocalizationKey() + ".searchtag"));
            var _local_1:Boolean = _questEngine.hasLocalizedValue((_SafeStr_5684.getCampaignLocalizationKey() + ".searchtag"));
            return ((_SafeStr_5684.waitPeriodSeconds < 1) && ((_local_2) || (_local_1)));
        }

        private function hasRoomLink():Boolean
        {
            return (((_SafeStr_5684.waitPeriodSeconds < 1) && (_questEngine.isSeasonalQuest(_SafeStr_5684))) && (_questEngine.hasQuestRoomsIds()));
        }

        private function getTextHeight(_arg_1:ITextWindow):int
        {
            return ((_arg_1.visible) ? _arg_1.height : 0);
        }

        private function onDetailsWindowClose(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _window.visible = false;
            };
        }

        public function set openForNextQuest(_arg_1:Boolean):void
        {
            _SafeStr_5825 = _arg_1;
        }

        private function onLinkProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109=null):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (hasCatalogLink())
                {
                    _questEngine.openCatalog(_SafeStr_5684);
                }
                else
                {
                    if (hasNavigatorLink())
                    {
                        _questEngine.openNavigator(_SafeStr_5684);
                    }
                    else
                    {
                        _questEngine.goToQuestRooms();
                    };
                };
            };
        }

        public function update(_arg_1:uint):void
        {
            if (((_window == null) || (!(_window.visible))))
            {
                return;
            };
            _msecsToRefresh = (_msecsToRefresh - _arg_1);
            if (_msecsToRefresh > 0)
            {
                return;
            };
            _msecsToRefresh = 1000;
            var _local_2:Boolean = _questEngine.questController.questsList.refreshDelay(_window, _SafeStr_5684);
            if (_local_2)
            {
                openDetails(_SafeStr_5684, _SafeStr_5828);
            };
        }

        private function onAcceptQuest(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (_questEngine.currentlyInRoom)
                {
                    _questEngine.send(new _SafeStr_448(_SafeStr_5684.id));
                }
                else
                {
                    _questEngine.send(new _SafeStr_410(_SafeStr_5684.id));
                };
                _window.visible = false;
                _questEngine.questController.seasonalCalendarWindow.close();
                if (((_SafeStr_5828) && (_questEngine.isSeasonalQuest(_SafeStr_5684))))
                {
                    _questEngine.goToQuestRooms();
                };
            };
        }

        private function onCancelQuest(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _questEngine.send(new _SafeStr_917());
            };
        }


    }
}//package com.sulake.habbo.quest

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1607 = "_-oH" (String#1847, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_410 = "_-51e" (String#9595, DoABC#4)
// _SafeStr_448 = "_-81L" (String#19793, DoABC#4)
// _SafeStr_5684 = "_-91m" (String#1582, DoABC#4)
// _SafeStr_5825 = "_-l10" (String#11564, DoABC#4)
// _SafeStr_5826 = "_-v15" (String#14816, DoABC#4)
// _SafeStr_5827 = "_-31I" (String#19642, DoABC#4)
// _SafeStr_5828 = "_-R16" (String#13994, DoABC#4)
// _SafeStr_8698 = "_-12X" (String#31004, DoABC#4)
// _SafeStr_917 = "_-Sy" (String#18701, DoABC#4)


