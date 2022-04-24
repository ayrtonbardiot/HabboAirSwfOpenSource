// by nota

//com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorItemListView

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class PlayListEditorItemListView 
    {

        private var _SafeStr_6675:IItemListWindow;
        private var _items:Array;
        private var _SafeStr_4981:PlayListEditorWidget;
        private var _SafeStr_4859:PlayListEditorItem;
        private var _SafeStr_5215:int = -1;
        private var _SafeStr_6676:int = -1;

        public function PlayListEditorItemListView(_arg_1:PlayListEditorWidget, _arg_2:IItemListWindow)
        {
            _SafeStr_6675 = _arg_2;
            _SafeStr_4981 = _arg_1;
            _SafeStr_4859 = null;
        }

        public function get selectedItemIndex():int
        {
            return (_SafeStr_5215);
        }

        public function destroy():void
        {
            if (_SafeStr_6675 == null)
            {
                return;
            };
            _SafeStr_6675.destroyListItems();
        }

        public function refresh(_arg_1:Array, _arg_2:int):void
        {
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            if (_SafeStr_6675 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_6676 = -1;
            _items = [];
            _SafeStr_6675.destroyListItems();
            for each (var _local_6:ISongInfo in _arg_1)
            {
                _local_3 = _local_6.name;
                _local_7 = _local_6.creator;
                _local_5 = _SafeStr_4981.getDiskColorTransformFromSongData(_local_6.songData);
                _local_4 = new PlayListEditorItem(_SafeStr_4981, _local_3, _local_7, _local_5);
                _local_4.window.procedure = itemEventProc;
                _local_4.removeButton.procedure = itemEventProc;
                _SafeStr_6675.addListItem(_local_4.window);
                _items.push(_local_4);
            };
            setItemIndexPlaying(_arg_2);
        }

        public function setItemIndexPlaying(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_items == null)
            {
                return;
            };
            if (_arg_1 < 0)
            {
                for each (var _local_3:PlayListEditorItem in _items)
                {
                    _local_3.setIconState("PLEI_ICON_STATE_NORMAL");
                };
                return;
            };
            if (_arg_1 >= _items.length)
            {
                return;
            };
            if (((_SafeStr_6676 >= 0) && (_SafeStr_6676 < _items.length)))
            {
                _local_2 = (_items[_SafeStr_6676] as PlayListEditorItem);
                _local_2.setIconState("PLEI_ICON_STATE_NORMAL");
            };
            _local_2 = (_items[_arg_1] as PlayListEditorItem);
            _local_2.setIconState("PLEI_ICON_STATE_PLAYING");
            _SafeStr_6676 = _arg_1;
        }

        public function deselectAny():void
        {
            if (_SafeStr_4859 != null)
            {
                _SafeStr_4859.deselect();
                _SafeStr_4859 = null;
                _SafeStr_5215 = -1;
            };
        }

        private function itemEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:int;
            var _local_3:* = (_arg_1.type == "WME_DOUBLE_CLICK");
            if (((_arg_1.type == "WME_CLICK") || (_local_3)))
            {
                if (((_arg_2.name == "button_remove_from_playlist") || (_local_3)))
                {
                    if (_SafeStr_4859 != null)
                    {
                        _SafeStr_4859.deselect();
                    };
                    if (_SafeStr_5215 > -1)
                    {
                        _SafeStr_4981.sendRemoveFromPlayListMessage(_SafeStr_5215);
                    };
                    _SafeStr_4859 = null;
                    _SafeStr_5215 = -1;
                }
                else
                {
                    if (_SafeStr_4859 != null)
                    {
                        _SafeStr_4859.deselect();
                    };
                    _local_4 = _SafeStr_6675.getListItemIndex(_arg_1.window);
                    if (_local_4 != -1)
                    {
                        _SafeStr_5215 = _local_4;
                        _SafeStr_4859 = _items[_local_4];
                        _SafeStr_4859.select();
                        if (_arg_2.name == "button_remove_from_playlist")
                        {
                            _SafeStr_4981.sendRemoveFromPlayListMessage(_local_4);
                        };
                        if (_SafeStr_4981.mainWindowHandler != null)
                        {
                            _SafeStr_4981.mainWindowHandler.musicInventoryView.deselectAny();
                        };
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.playlisteditor

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4859 = "_-JC" (String#1312, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5215 = "_-m1N" (String#4397, DoABC#4)
// _SafeStr_6675 = "_-p1l" (String#3960, DoABC#4)
// _SafeStr_6676 = "_-B1w" (String#8898, DoABC#4)


