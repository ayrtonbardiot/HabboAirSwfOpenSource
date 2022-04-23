// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl

package com.sulake.habbo.navigator.roomsettings
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import _-o1x._SafeStr_411;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowMouseEvent;
    import _-o1x._SafeStr_163;
    import com.sulake.core.window.components.IRegionWindow;

    public class RoomFilterCtrl implements _SafeStr_13 
    {

        private var _flatId:int;
        private var _navigator:_SafeStr_1697;
        private var _SafeStr_5375:int = -1;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5371:Array;
        private var _SafeStr_5372:IItemListWindow;
        private var _SafeStr_5373:ITextFieldWindow;

        public function RoomFilterCtrl(_arg_1:_SafeStr_1697)
        {
            _navigator = _arg_1;
            _SafeStr_5371 = [];
        }

        public function startRoomFilterEdit(_arg_1:int):void
        {
            _flatId = _arg_1;
            _navigator.send(new _SafeStr_411(_flatId));
            refreshWindow();
        }

        private function refreshWindow():void
        {
            if (_navigator.data.enteredGuestRoom == null)
            {
                return;
            };
            prepareWindow();
            _window.visible = true;
            _window.invalidate();
            _window.activate();
            _navigator.tracking.trackEventLogOncePerSession("InterfaceExplorer", "open", "room.filter.seen");
        }

        private function prepareWindow():void
        {
            if (_window != null)
            {
                return;
            };
            _window = _SafeStr_3263(_navigator.getXmlWindow("iro_room_filter_framed"));
            _window.findChildByName("badword_remove_btn").addEventListener("WME_CLICK", onRemoveWordClick);
            _window.findChildByName("badword_add_btn").addEventListener("WME_CLICK", onAddWordClick);
            _window.findChildByTag("close").addEventListener("WME_CLICK", onCloseButtonClick);
            _SafeStr_5373 = (_window.findChildByName("roomfilter_addword_txt") as ITextFieldWindow);
            _SafeStr_5372 = IItemListWindow(_window.findChildByName("badwords_itemlist"));
            refreshBadWords();
            _window.center();
        }

        public function onRoomFilterSettings(_arg_1:Array):void
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _arg_1.length)
            {
                if (_SafeStr_5371.indexOf(_arg_1[_local_2]) == -1)
                {
                    _SafeStr_5371.push(_arg_1[_local_2]);
                };
                _local_2++;
            };
            if (_SafeStr_5372)
            {
                _SafeStr_5372.removeListItems();
                refreshBadWords();
            };
        }

        private function refreshBadWords():void
        {
            var _local_2:int;
            var _local_1:* = null;
            _SafeStr_5372.autoArrangeItems = false;
            _local_2 = 0;
            while (true)
            {
                _local_1 = _SafeStr_3133(_SafeStr_5372.getListItemAt(_local_2));
                if (_local_1 == null)
                {
                    if (_SafeStr_5371[_local_2] == null) break;
                    _local_1 = getListEntry(_local_2);
                    _SafeStr_5372.addListItem(_local_1);
                };
                if (_SafeStr_5371[_local_2] != null)
                {
                    _local_1.color = this.getBgColor(_local_2, false);
                    refreshEntryDetails(_local_1, _SafeStr_5371[_local_2]);
                    _local_1.visible = true;
                    _local_1.height = 20;
                }
                else
                {
                    _local_1.height = 0;
                    _local_1.visible = false;
                };
                _local_2++;
            };
            _SafeStr_5372.autoArrangeItems = true;
            _SafeStr_5372.invalidate();
        }

        private function refreshEntryDetails(_arg_1:_SafeStr_3133, _arg_2:String):void
        {
            _arg_1.findChildByName("badword_txt").caption = _arg_2;
        }

        private function onCloseButtonClick(_arg_1:_SafeStr_3116):void
        {
            disposeWindow();
        }

        private function onAddWordClick(_arg_1:WindowMouseEvent):void
        {
            addBadWord(_SafeStr_5373.text);
        }

        private function addBadWord(_arg_1:String):void
        {
            if (((!(_SafeStr_5373 == null)) && (_SafeStr_5373.text.length > 0)))
            {
                _navigator.send(new _SafeStr_163(_flatId, _SafeStr_163._SafeStr_5374, _arg_1));
                _navigator.send(new _SafeStr_411(_flatId));
                _SafeStr_5373.text = "bobba";
            };
        }

        private function onRemoveWordClick(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5375 < 0)
            {
                return;
            };
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_SafeStr_5372.getListItemAt(_SafeStr_5375));
            if (!_local_2)
            {
                return;
            };
            var _local_3:String = _local_2.findChildByName("badword_txt").caption;
            _local_2.height = 0;
            _local_2.visible = false;
            _local_2 = null;
            if (_SafeStr_5371.indexOf(_local_3) >= 0)
            {
                _SafeStr_5371.splice(_SafeStr_5371.indexOf(_local_3), 1);
            };
            _navigator.send(new _SafeStr_163(_flatId, _SafeStr_163._SafeStr_5376, _local_3));
        }

        private function refreshColorsAfterClick(_arg_1:IItemListWindow):void
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_5371.length)
            {
                _local_2 = _SafeStr_3133(_arg_1.getListItemAt(_local_3));
                _local_2.color = this.getBgColor(_local_3, false);
                _local_3++;
            };
        }

        private function getListEntry(_arg_1:int):_SafeStr_3133
        {
            if (!_navigator)
            {
                return (null);
            };
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_navigator.getXmlWindow("ros_badword"));
            if (!_local_2)
            {
                return (null);
            };
            var _local_3:IRegionWindow = IRegionWindow(_local_2.findChildByName("bg_region"));
            _local_3.addEventListener("WME_CLICK", onBgMouseClick);
            _local_3.addEventListener("WME_OVER", onBgMouseOver);
            _local_3.addEventListener("WME_OUT", onBgMouseOut);
            _local_2.id = _arg_1;
            return (_local_2);
        }

        protected function getBgColor(_arg_1:int, _arg_2:Boolean):uint
        {
            if (_arg_1 == _SafeStr_5375)
            {
                return (4288329945);
            };
            return ((_arg_2) ? 4290173439 : (((_arg_1 % 2) != 0) ? 0xFFFFFFFF : 4293519841));
        }

        private function onBgMouseClick(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_5375 = _arg_1.target.parent.id;
            refreshColorsAfterClick((_arg_1.target.findParentByName("badwords_itemlist") as IItemListWindow));
        }

        private function onBgMouseOver(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_arg_1.target.parent);
            _local_2.color = getBgColor(-1, true);
        }

        private function onBgMouseOut(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3133 = _SafeStr_3133(_arg_1.target.parent);
            _local_2.color = getBgColor(_local_2.id, false);
        }

        public function close():void
        {
            this._flatId = 0;
            if (_window != null)
            {
                _window.visible = false;
            };
        }

        public function disposeWindow():void
        {
            if (_window)
            {
                _window.visible = false;
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_5372)
            {
                _SafeStr_5372.removeListItems();
                _SafeStr_5372.dispose();
                _SafeStr_5372 = null;
            };
            if (_SafeStr_5373)
            {
                _SafeStr_5373.dispose();
                _SafeStr_5373 = null;
            };
            if (_SafeStr_5371)
            {
                _SafeStr_5371.length = 0;
            };
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            disposeWindow();
            _navigator = null;
        }

        public function get disposed():Boolean
        {
            return (_navigator == null);
        }


    }
}//package com.sulake.habbo.navigator.roomsettings

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_163 = "_-f1Z" (String#13541, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_411 = "_-jO" (String#18067, DoABC#4)
// _SafeStr_5371 = "_-Y0" (String#5287, DoABC#4)
// _SafeStr_5372 = "_-6l" (String#4731, DoABC#4)
// _SafeStr_5373 = "_-Ux" (String#6595, DoABC#4)
// _SafeStr_5374 = "_-o1R" (String#40181, DoABC#4)
// _SafeStr_5375 = "_-i1M" (String#6688, DoABC#4)
// _SafeStr_5376 = "_-01k" (String#35037, DoABC#4)


