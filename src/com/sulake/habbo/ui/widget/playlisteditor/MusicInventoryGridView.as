// by nota

//com.sulake.habbo.ui.widget.playlisteditor.MusicInventoryGridView

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.habbo.sound._SafeStr_3169;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;

    public class MusicInventoryGridView 
    {

        private var _SafeStr_3976:_SafeStr_3169;
        private var _SafeStr_6843:IItemGridWindow;
        private var _items:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4981:PlayListEditorWidget;
        private var _SafeStr_4859:MusicInventoryGridItem;

        public function MusicInventoryGridView(_arg_1:PlayListEditorWidget, _arg_2:IItemGridWindow, _arg_3:_SafeStr_3169)
        {
            _SafeStr_3976 = _arg_3;
            _SafeStr_6843 = _arg_2;
            _SafeStr_4981 = _arg_1;
            _SafeStr_4859 = null;
            _SafeStr_3976.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
        }

        public function get itemCount():int
        {
            return (_items.length);
        }

        public function destroy():void
        {
            if (_SafeStr_6843 != null)
            {
                _SafeStr_6843.destroyGridItems();
                _SafeStr_6843 = null;
            };
            if (_SafeStr_3976 != null)
            {
                if (_SafeStr_3976.events != null)
                {
                    _SafeStr_3976.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
                };
                _SafeStr_3976 = null;
            };
            if (_items)
            {
                _items.reset();
                _items = null;
            };
            _SafeStr_4859 = null;
            _SafeStr_4981 = null;
        }

        public function refresh():void
        {
            var _local_4:int;
            var _local_9:int;
            var _local_11:int;
            var _local_12:* = null;
            var _local_1:* = null;
            var _local_13:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            if (_SafeStr_6843 == null)
            {
                return;
            };
            _SafeStr_6843.removeGridItems();
            var _local_8:_SafeStr_24 = _items;
            var _local_2:_SafeStr_24 = new _SafeStr_24();
            var _local_5:Array = _local_8.getKeys();
            _items = new _SafeStr_24();
            var _local_6:int = _SafeStr_3976.getSongDiskInventorySize();
            _local_4 = 0;
            while (_local_4 < _local_6)
            {
                _local_9 = _SafeStr_3976.getSongDiskInventoryDiskId(_local_4);
                _local_11 = _SafeStr_3976.getSongDiskInventorySongId(_local_4);
                _local_12 = _SafeStr_3976.getSongInfo(_local_11);
                _local_1 = null;
                _local_13 = null;
                if (_local_12 != null)
                {
                    _local_1 = _local_12.name;
                    _local_13 = _SafeStr_4981.getDiskColorTransformFromSongData(_local_12.songData);
                };
                if (_local_5.indexOf(_local_9) == -1)
                {
                    _local_3 = new MusicInventoryGridItem(_SafeStr_4981, _local_9, _local_11, _local_1, _local_13);
                }
                else
                {
                    _local_3 = _local_8[_local_9];
                    _local_5.splice(_local_5.indexOf(_local_9), 1);
                };
                _local_3.window.procedure = gridItemEventProc;
                _local_3.toPlayListButton.procedure = gridItemEventProc;
                _SafeStr_6843.addGridItem(_local_3.window);
                _items.add(_local_9, _local_3);
                _local_4++;
            };
            for each (var _local_10:int in _local_5)
            {
                _local_7 = _local_8[_local_10];
                _local_7.destroy();
                _local_8.remove(_local_10);
            };
        }

        public function setPreviewIconToPause():void
        {
            if (_SafeStr_4859 != null)
            {
                _SafeStr_4859.playButtonState = 1;
            };
        }

        public function setPreviewIconToPlay():void
        {
            if (_SafeStr_4859 != null)
            {
                _SafeStr_4859.playButtonState = 0;
            };
        }

        public function deselectAny():void
        {
            if (_SafeStr_4859 != null)
            {
                _SafeStr_4859.deselect();
                _SafeStr_4859 = null;
            };
        }

        private function gridItemEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:int;
            var _local_5:* = null;
            var _local_3:* = (_arg_1.type == "WME_DOUBLE_CLICK");
            if (((_arg_1.type == "WME_CLICK") || (_local_3)))
            {
                if (((_arg_2.name == "button_to_playlist") || (_local_3)))
                {
                    if (_SafeStr_4859 != null)
                    {
                        _SafeStr_4859.deselect();
                        stopPreview();
                        _SafeStr_4981.sendAddToPlayListMessage(_SafeStr_4859.diskId);
                        _SafeStr_4859 = null;
                    };
                }
                else
                {
                    if (_arg_2.name == "button_play_pause")
                    {
                        if (_SafeStr_4859.playButtonState == 0)
                        {
                            _SafeStr_4859.playButtonState = 2;
                            _SafeStr_4981.playUserSong(_SafeStr_4859.songId);
                        }
                        else
                        {
                            stopPreview();
                        };
                    }
                    else
                    {
                        _local_4 = _SafeStr_6843.getGridItemIndex(_arg_1.window);
                        if (_local_4 != -1)
                        {
                            _local_5 = _items.getWithIndex(_local_4);
                            if (_local_5 != _SafeStr_4859)
                            {
                                if (_SafeStr_4859 != null)
                                {
                                    _SafeStr_4859.deselect();
                                };
                                _SafeStr_4859 = _local_5;
                                _SafeStr_4859.select();
                                stopPreview();
                            };
                            if (_SafeStr_4981.mainWindowHandler != null)
                            {
                                _SafeStr_4981.mainWindowHandler.playListEditorView.deselectAny();
                            };
                        };
                    };
                };
            };
        }

        private function stopPreview():void
        {
            _SafeStr_4981.stopUserSong();
            setPreviewIconToPlay();
        }

        private function onSongInfoReceivedEvent(_arg_1:SongInfoReceivedEvent):void
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            if (_SafeStr_3976 != null)
            {
                _local_4 = _SafeStr_3976.getSongInfo(_arg_1.id);
                if (_local_4 != null)
                {
                    _local_2 = _local_4.name;
                    _local_5 = _SafeStr_4981.getDiskColorTransformFromSongData(_local_4.songData);
                    _local_3 = _items[_arg_1.id];
                    if (_local_3 != null)
                    {
                        _local_3.update(_arg_1.id, _local_2, _local_5);
                    };
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.playlisteditor

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3169 = "_-KZ" (String#5121, DoABC#4)
// _SafeStr_3976 = "_-40" (String#1128, DoABC#4)
// _SafeStr_4859 = "_-JC" (String#1312, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6843 = "_-d1m" (String#6759, DoABC#4)


