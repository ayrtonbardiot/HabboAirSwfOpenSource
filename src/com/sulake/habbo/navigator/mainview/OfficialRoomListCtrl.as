// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.mainview.OfficialRoomListCtrl

package com.sulake.habbo.navigator.mainview
{
    import com.sulake.habbo.navigator.IViewCtrl;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import _-Ja._SafeStr_1549;
    import com.sulake.core.window.components.*;
    import com.sulake.habbo.navigator.*;

    public class OfficialRoomListCtrl implements IViewCtrl 
    {

        private var _navigator:HabboNavigator;
        private var _content:_SafeStr_3133;
        private var _SafeStr_4162:IItemListWindow;
        private var _SafeStr_6515:PromotedRoomsListCtrl;

        public function OfficialRoomListCtrl(_arg_1:HabboNavigator):void
        {
            _navigator = _arg_1;
            _SafeStr_6515 = new PromotedRoomsListCtrl(_navigator);
        }

        public function dispose():void
        {
            if (_SafeStr_6515 != null)
            {
                _SafeStr_6515.dispose();
                _SafeStr_6515 = null;
            };
        }

        public function set content(_arg_1:_SafeStr_3133):void
        {
            _content = _arg_1;
            _SafeStr_4162 = ((_content) ? IItemListWindow(_content.findChildByName("item_list_official")) : null);
        }

        public function get content():_SafeStr_3133
        {
            return (_content);
        }

        public function refresh():void
        {
            var _local_4:int;
            var _local_5:Boolean;
            var _local_3:* = null;
            var _local_1:Boolean;
            var _local_2:Array = this.getVisibleEntries();
            _SafeStr_4162.autoArrangeItems = false;
            refreshPromotedRooms();
            _local_4 = 0;
            while (true)
            {
                _local_5 = (!((_local_4 % 2) == 0));
                _local_3 = _SafeStr_3133(_SafeStr_4162.getListItemAt((_local_4 + 1)));
                if (_local_4 < _local_2.length)
                {
                    refreshEntry(true, _local_5, _local_3, _local_2[_local_4]);
                }
                else
                {
                    _local_1 = refreshEntry(false, _local_5, _local_3, null);
                    if (_local_1) break;
                };
                _local_4++;
            };
            _SafeStr_4162.autoArrangeItems = true;
        }

        private function getVisibleEntries():Array
        {
            var _local_2:Array = _navigator.data.officialRooms.entries;
            var _local_1:Array = [];
            var _local_4:int;
            for each (var _local_3:_SafeStr_1549 in _local_2)
            {
                if (_local_3.folderId > 0)
                {
                    if (_local_3.folderId == _local_4)
                    {
                        _local_1.push(_local_3);
                    };
                }
                else
                {
                    _local_4 = ((_local_3.open) ? _local_3.index : 0);
                    _local_1.push(_local_3);
                };
            };
            return (_local_1);
        }

        private function refreshEntry(_arg_1:Boolean, _arg_2:Boolean, _arg_3:_SafeStr_3133, _arg_4:_SafeStr_1549):Boolean
        {
            if (_arg_3 == null)
            {
                if (!_arg_1)
                {
                    return (true);
                };
                _arg_3 = _navigator.officialRoomEntryManager.createEntry(_arg_2);
                _SafeStr_4162.addListItem(_arg_3);
            };
            _navigator.officialRoomEntryManager.refreshEntry(_arg_3, _arg_1, _arg_4);
            return (false);
        }

        private function refreshPromotedRooms():void
        {
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_SafeStr_4162.getListItemAt(0));
            _SafeStr_6515.refresh(_local_1, _navigator.data.promotedRooms.entries);
        }


    }
}//package com.sulake.habbo.navigator.mainview

// _SafeStr_1549 = "_-jk" (String#3003, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_6515 = "_-nF" (String#8750, DoABC#4)


