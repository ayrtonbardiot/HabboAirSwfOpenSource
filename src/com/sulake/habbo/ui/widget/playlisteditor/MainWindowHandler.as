// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.playlisteditor.MainWindowHandler

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.habbo.sound._SafeStr_3169;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.sound._SafeStr_3348;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Point;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class MainWindowHandler 
    {

        private static const SHOW_BUY_MORE_MUSIC_DISK_COUNT:int = 6;
        private static const MY_MUSIC_SHOW_SCROLLBAR_ITEM_COUNT_LIMIT:int = 9;
        private static const PLAYLIST_SHOW_SCROLLBAR_ITEM_COUNT_LIMIT:int = 5;

        private var _SafeStr_4981:PlayListEditorWidget;
        private var _SafeStr_3976:_SafeStr_3169;
        private var _SafeStr_4079:_SafeStr_3133;
        private var _SafeStr_5493:_SafeStr_3195;
        private var _SafeStr_5494:_SafeStr_3195;
        private var _SafeStr_5489:MusicInventoryGridView;
        private var _SafeStr_5490:PlayListEditorItemListView;
        private var _SafeStr_5492:MusicInventoryStatusView;
        private var _SafeStr_5491:PlayListStatusView;
        private var _SafeStr_5495:IScrollbarWindow;
        private var _SafeStr_5496:IScrollbarWindow;

        public function MainWindowHandler(_arg_1:PlayListEditorWidget, _arg_2:_SafeStr_3169)
        {
            var _local_3:* = null;
            super();
            _SafeStr_4981 = _arg_1;
            _SafeStr_3976 = _arg_2;
            var _local_5:Array = ["title_mymusic", "title_playlist", "background_preview_playing", "background_get_more_music", "background_add_songs"];
            for each (var _local_4:String in _local_5)
            {
                _local_3 = _SafeStr_4981.getImageGalleryAssetBitmap(_local_4);
                if (_local_3 != null)
                {
                    _local_3.dispose();
                }
                else
                {
                    _SafeStr_4981.retrieveWidgetImage(_local_4);
                };
            };
            createWindow();
            _SafeStr_5489 = new MusicInventoryGridView(_arg_1, getMusicInventoryGrid(), _arg_2);
            _SafeStr_5490 = new PlayListEditorItemListView(_arg_1, getPlayListEditorItemList());
            _SafeStr_5492 = new MusicInventoryStatusView(_arg_1, getMusicInventoryStatusContainer());
            _SafeStr_5491 = new PlayListStatusView(_arg_1, getPlayListStatusContainer());
            refreshLoadableAsset();
        }

        public function get window():_SafeStr_3109
        {
            return (_SafeStr_4079);
        }

        public function get musicInventoryView():MusicInventoryGridView
        {
            return (_SafeStr_5489);
        }

        public function get playListEditorView():PlayListEditorItemListView
        {
            return (_SafeStr_5490);
        }

        public function destroy():void
        {
            if (_SafeStr_3976)
            {
                _SafeStr_3976.stop(2);
                _SafeStr_3976 = null;
            };
            if (_SafeStr_5489)
            {
                _SafeStr_5489.destroy();
                _SafeStr_5489 = null;
            };
            if (_SafeStr_5490)
            {
                _SafeStr_5490.destroy();
                _SafeStr_5490 = null;
            };
            if (_SafeStr_5491)
            {
                _SafeStr_5491.destroy();
                _SafeStr_5491 = null;
            };
            if (_SafeStr_5492)
            {
                _SafeStr_5492.destroy();
                _SafeStr_5492 = null;
            };
            _SafeStr_4079.destroy();
            _SafeStr_4079 = null;
        }

        public function hide():void
        {
            _SafeStr_4079.visible = false;
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.stopUserSong();
            };
        }

        public function show():void
        {
            _SafeStr_3976.requestUserSongDisks();
            var _local_1:_SafeStr_3348 = _SafeStr_3976.getRoomItemPlaylist();
            if (_local_1 != null)
            {
                _local_1.requestPlayList();
                selectPlayListStatusViewByFurniPlayListState();
            };
            _SafeStr_4079.visible = true;
        }

        public function refreshLoadableAsset(_arg_1:String=""):void
        {
            if (((_arg_1 == "") || (_arg_1 == "title_mymusic")))
            {
                assignWindowBitmapByAsset(_SafeStr_5493, "music_inventory_splash_image", "title_mymusic");
            };
            if (((_arg_1 == "") || (_arg_1 == "title_playlist")))
            {
                assignWindowBitmapByAsset(_SafeStr_5494, "playlist_editor_splash_image", "title_playlist");
            };
            if (((_arg_1 == "") || (_arg_1 == "background_preview_playing")))
            {
                _SafeStr_5492.setPreviewPlayingBackgroundImage(_SafeStr_4981.getImageGalleryAssetBitmap("background_preview_playing"));
            };
            if (((_arg_1 == "") || (_arg_1 == "background_get_more_music")))
            {
                _SafeStr_5492.setGetMoreMusicBackgroundImage(_SafeStr_4981.getImageGalleryAssetBitmap("background_get_more_music"));
            };
            if (((_arg_1 == "") || (_arg_1 == "background_add_songs")))
            {
                _SafeStr_5491.addSongsBackgroundImage = _SafeStr_4981.getImageGalleryAssetBitmap("background_add_songs");
            };
        }

        private function assignWindowBitmapByAsset(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:String):void
        {
            var _local_4:* = null;
            var _local_5:_SafeStr_3264 = (_arg_1.getChildByName(_arg_2) as _SafeStr_3264);
            if (_local_5 != null)
            {
                _local_4 = _SafeStr_4981.getImageGalleryAssetBitmap(_arg_3);
                if (_local_4 != null)
                {
                    _local_5.bitmap = _local_4;
                    _local_5.width = _local_4.width;
                    _local_5.height = _local_4.height;
                };
            };
        }

        private function createWindow():void
        {
            if (_SafeStr_4981 == null)
            {
                return;
            };
            var _local_2:XmlAsset = (_SafeStr_4981.assets.getAssetByName("playlisteditor_main_window") as XmlAsset);
            _SafeStr_4079 = (_SafeStr_4981.windowManager.buildFromXML((_local_2.content as XML)) as _SafeStr_3133);
            if (_SafeStr_4079 == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _SafeStr_4079.position = new Point(80, 0);
            var _local_3:_SafeStr_3133 = (_SafeStr_4079.getChildByName("content_area") as _SafeStr_3133);
            if (_local_3 == null)
            {
                throw (new Error("Window is missing 'content_area' element"));
            };
            _SafeStr_5493 = (_local_3.getChildByName("my_music_border") as _SafeStr_3195);
            _SafeStr_5494 = (_local_3.getChildByName("playlist_border") as _SafeStr_3195);
            if (_SafeStr_5493 == null)
            {
                throw (new Error("Window content area is missing 'my_music_border' window element"));
            };
            if (_SafeStr_5494 == null)
            {
                throw (new Error("Window content area is missing 'playlist_border' window element"));
            };
            _SafeStr_5495 = (_SafeStr_5493.getChildByName("music_inventory_scrollbar") as IScrollbarWindow);
            _SafeStr_5496 = (_SafeStr_5494.getChildByName("playlist_scrollbar") as IScrollbarWindow);
            if (_SafeStr_5495 == null)
            {
                throw (new Error("Window content area is missing 'music_inventory_scrollbar' window element"));
            };
            if (_SafeStr_5496 == null)
            {
                throw (new Error("Window content area is missing 'playlist_scrollbar' window element"));
            };
            var _local_1:_SafeStr_3109 = _SafeStr_4079.findChildByTag("close");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", onClose);
            };
        }

        private function getMusicInventoryGrid():IItemGridWindow
        {
            return (_SafeStr_5493.getChildByName("music_inventory_itemgrid") as IItemGridWindow);
        }

        private function getPlayListEditorItemList():IItemListWindow
        {
            return (_SafeStr_5494.getChildByName("playlist_editor_itemlist") as IItemListWindow);
        }

        private function getMusicInventoryStatusContainer():_SafeStr_3133
        {
            return (_SafeStr_5493.getChildByName("preview_play_container") as _SafeStr_3133);
        }

        private function getPlayListStatusContainer():_SafeStr_3133
        {
            return (_SafeStr_5494.getChildByName("now_playing_container") as _SafeStr_3133);
        }

        private function selectPlayListStatusViewByFurniPlayListState():void
        {
            var _local_1:_SafeStr_3348 = _SafeStr_3976.getRoomItemPlaylist();
            if (_local_1 == null)
            {
                return;
            };
            if (_local_1.isPlaying)
            {
                _SafeStr_5491.selectView("PLSV_NOW_PLAYING");
            }
            else
            {
                if (_local_1.length > 0)
                {
                    _SafeStr_5491.selectView("PLSV_START_PLAYBACK");
                }
                else
                {
                    _SafeStr_5491.selectView("PLSV_ADD_SONGS");
                };
            };
        }

        private function selectMusicStatusViewByMusicState():void
        {
            if (isPreviewPlaying())
            {
                _SafeStr_5492.show();
                _SafeStr_5492.selectView("MISV_PREVIEW_PLAYING");
            }
            else
            {
                if (_SafeStr_3976.getSongDiskInventorySize() <= 6)
                {
                    _SafeStr_5492.show();
                    _SafeStr_5492.selectView("MISV_BUY_MORE");
                }
                else
                {
                    _SafeStr_5492.hide();
                };
            };
        }

        private function updatePlaylistEditorView():void
        {
            var _local_4:int;
            var _local_5:* = null;
            var _local_2:_SafeStr_3348 = _SafeStr_3976.getRoomItemPlaylist();
            var _local_3:Array = [];
            var _local_1:int = -1;
            if (_local_2 != null)
            {
                _local_4 = 0;
                while (_local_4 < _local_2.length)
                {
                    _local_5 = _local_2.getEntry(_local_4);
                    if (_local_5 != null)
                    {
                        _local_3.push(_local_5);
                    };
                    _local_4++;
                };
                _local_1 = _local_2.playPosition;
            };
            _SafeStr_5490.refresh(_local_3, _local_1);
        }

        public function onPlayListUpdated():void
        {
            var _local_3:* = null;
            updatePlaylistEditorView();
            selectPlayListStatusViewByFurniPlayListState();
            var _local_1:_SafeStr_3348 = _SafeStr_3976.getRoomItemPlaylist();
            if (_local_1 == null)
            {
                return;
            };
            var _local_2:int = _local_1.nowPlayingSongId;
            if (_local_2 != -1)
            {
                _local_3 = _SafeStr_3976.getSongInfo(_local_2);
                _SafeStr_5491.nowPlayingTrackName = _local_3.name;
                _SafeStr_5491.nowPlayingAuthorName = _local_3.creator;
            };
            _SafeStr_5496.visible = (_local_1.length > 5);
        }

        public function onSongDiskInventoryReceived():void
        {
            _SafeStr_5489.refresh();
            selectMusicStatusViewByMusicState();
            _SafeStr_5495.visible = (_SafeStr_5489.itemCount > 9);
        }

        public function onNowPlayingChanged(_arg_1:RoomWidgetPlayListEditorNowPlayingEvent):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            switch (_arg_1.type)
            {
                case "RWPLENPE_SONG_CHANGED":
                    selectPlayListStatusViewByFurniPlayListState();
                    _SafeStr_5490.setItemIndexPlaying(_arg_1.position);
                    if (_arg_1.id != -1)
                    {
                        _local_3 = _SafeStr_3976.getSongInfo(_arg_1.id);
                        _SafeStr_5491.nowPlayingTrackName = ((_local_3 != null) ? _local_3.name : "");
                        _SafeStr_5491.nowPlayingAuthorName = ((_local_3 != null) ? _local_3.creator : "");
                    };
                    return;
                case "RWPLENPE_USER_PLAY_SONG":
                    _SafeStr_5489.setPreviewIconToPause();
                    _local_2 = _SafeStr_3976.getSongInfo(_arg_1.id);
                    _SafeStr_5492.songName = ((_local_2 != null) ? _local_2.name : "");
                    _SafeStr_5492.songName = ((_local_2 != null) ? _local_2.name : "");
                    _SafeStr_5492.authorName = ((_local_2 != null) ? _local_2.creator : "");
                    selectMusicStatusViewByMusicState();
                    return;
                case "RWPLENPW_USER_STOP_SONG":
                    _SafeStr_5489.setPreviewIconToPlay();
                    selectMusicStatusViewByMusicState();
                    return;
            };
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            hide();
        }

        private function isPreviewPlaying():Boolean
        {
            return (!(_SafeStr_3976.getSongIdPlayingAtPriority(2) == -1));
        }


    }
}//package com.sulake.habbo.ui.widget.playlisteditor

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3169 = "_-KZ" (String#5121, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3348 = "_-Fw" (String#4529, DoABC#4)
// _SafeStr_3976 = "_-40" (String#1128, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5489 = "_-gi" (String#6051, DoABC#4)
// _SafeStr_5490 = "_-d7" (String#7724, DoABC#4)
// _SafeStr_5491 = "_-nq" (String#4938, DoABC#4)
// _SafeStr_5492 = "_-11o" (String#4560, DoABC#4)
// _SafeStr_5493 = "_-414" (String#8846, DoABC#4)
// _SafeStr_5494 = "_-OL" (String#10228, DoABC#4)
// _SafeStr_5495 = "_-BU" (String#14068, DoABC#4)
// _SafeStr_5496 = "_-I1l" (String#14415, DoABC#4)


