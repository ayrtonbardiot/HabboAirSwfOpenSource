// by nota

//com.sulake.habbo.ui.widget.playlisteditor.PlayListEditorWidget

package com.sulake.habbo.ui.widget.playlisteditor
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.window._SafeStr_3109;
    import flash.events.IEventDispatcher;
    import flash.geom.ColorTransform;
    import com.sulake.habbo.sound._SafeStr_3348;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListModificationMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListPlayStateMessage;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListUserActionMessage;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorEvent;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPlayListEditorNowPlayingEvent;

    public class PlayListEditorWidget extends RoomWidgetBase 
    {

        private static const DISK_COLOR_RED_MIN:int = 130;
        private static const DISK_COLOR_RED_RANGE:int = 100;
        private static const DISK_COLOR_GREEN_MIN:int = 130;
        private static const DISK_COLOR_GREEN_RANGE:int = 100;
        private static const DISK_COLOR_BLUE_MIN:int = 130;
        private static const DISK_COLOR_BLUE_RANGE:int = 100;

        private var _catalog:IHabboCatalog;
        private var _configuration:_SafeStr_19;
        private var _soundManager:_SafeStr_2088;
        private var _SafeStr_4079:MainWindowHandler;
        private var _SafeStr_4318:int;

        public function PlayListEditorWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_2088, _arg_4:_SafeStr_21, _arg_5:_SafeStr_18, _arg_6:_SafeStr_19, _arg_7:IHabboCatalog)
        {
            super(_arg_1, _arg_2, _arg_4, _arg_5);
            _soundManager = _arg_3;
            _configuration = _arg_6;
            _catalog = _arg_7;
            _SafeStr_4079 = null;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_4079)
                {
                    _SafeStr_4079.destroy();
                    _SafeStr_4079 = null;
                };
                _soundManager = null;
                super.dispose();
            };
        }

        override public function get mainWindow():_SafeStr_3109
        {
            if (_SafeStr_4079 == null)
            {
                return (null);
            };
            return (_SafeStr_4079.window);
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            _arg_1.addEventListener("RWPLEE_SHOW_PLAYLIST_EDITOR", onShowPlayListEditorEvent);
            _arg_1.addEventListener("RWPLEE_HIDE_PLAYLIST_EDITOR", onHidePlayListEditorEvent);
            _arg_1.addEventListener("RWPLEE_INVENTORY_UPDATED", onInventoryUpdatedEvent);
            _arg_1.addEventListener("RWPLEE_SONG_DISK_INVENTORY_UPDATED", onSongDiskInventoryUpdatedEvent);
            _arg_1.addEventListener("RWPLEE_PLAY_LIST_UPDATED", onPlayListUpdatedEvent);
            _arg_1.addEventListener("RWPLEE_PLAY_LIST_FULL", onPlayListFullEvent);
            _arg_1.addEventListener("RWPLENPE_SONG_CHANGED", onNowPlayingChangedEvent);
            _arg_1.addEventListener("RWPLENPE_USER_PLAY_SONG", onNowPlayingChangedEvent);
            _arg_1.addEventListener("RWPLENPW_USER_STOP_SONG", onNowPlayingChangedEvent);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            _arg_1.removeEventListener("RWPLEE_SHOW_PLAYLIST_EDITOR", onShowPlayListEditorEvent);
            _arg_1.removeEventListener("RWPLEE_HIDE_PLAYLIST_EDITOR", onHidePlayListEditorEvent);
            _arg_1.removeEventListener("RWPLEE_INVENTORY_UPDATED", onInventoryUpdatedEvent);
            _arg_1.removeEventListener("RWPLEE_SONG_DISK_INVENTORY_UPDATED", onSongDiskInventoryUpdatedEvent);
            _arg_1.removeEventListener("RWPLEE_PLAY_LIST_UPDATED", onPlayListUpdatedEvent);
            _arg_1.removeEventListener("RWPLEE_PLAY_LIST_FULL", onPlayListFullEvent);
            _arg_1.removeEventListener("RWPLENPE_SONG_CHANGED", onNowPlayingChangedEvent);
            _arg_1.removeEventListener("RWPLENPE_USER_PLAY_SONG", onNowPlayingChangedEvent);
            _arg_1.removeEventListener("RWPLENPW_USER_STOP_SONG", onNowPlayingChangedEvent);
        }

        public function get mainWindowHandler():MainWindowHandler
        {
            return (_SafeStr_4079);
        }

        public function getDiskColorTransformFromSongData(_arg_1:String):ColorTransform
        {
            var _local_5:int;
            var _local_2:uint;
            var _local_4:uint;
            var _local_3:uint;
            _local_5 = 0;
            while (_local_5 < _arg_1.length)
            {
                switch ((_local_5 % 3))
                {
                    case 0:
                        _local_2 = (_local_2 + ((_arg_1.charCodeAt(_local_5) * 37) as int));
                        break;
                    case 1:
                        _local_4 = (_local_4 + ((_arg_1.charCodeAt(_local_5) * 37) as int));
                        break;
                    case 2:
                        _local_3 = (_local_3 + ((_arg_1.charCodeAt(_local_5) * 37) as int));
                };
                _local_5++;
            };
            _local_2 = ((_local_2 % 100) + 130);
            _local_4 = ((_local_4 % 100) + 130);
            _local_3 = ((_local_3 % 100) + 130);
            return (new ColorTransform((_local_2 / 0xFF), (_local_4 / 0xFF), (_local_3 / 0xFF)));
        }

        public function sendAddToPlayListMessage(_arg_1:int):void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:_SafeStr_3348 = _soundManager.musicController.getRoomItemPlaylist();
            if (_local_2 != null)
            {
                _local_3 = _local_2.length;
                _local_4 = new RoomWidgetPlayListModificationMessage("RWPLAM_ADD_TO_PLAYLIST", _local_3, _arg_1);
                if (messageListener != null)
                {
                    messageListener.processWidgetMessage(_local_4);
                };
            };
        }

        public function sendRemoveFromPlayListMessage(_arg_1:int):void
        {
            var _local_2:RoomWidgetPlayListModificationMessage = new RoomWidgetPlayListModificationMessage("RWPLAM_REMOVE_FROM_PLAYLIST", _arg_1);
            if (messageListener != null)
            {
                messageListener.processWidgetMessage(_local_2);
            };
        }

        public function sendTogglePlayPauseStateMessage():void
        {
            var _local_1:int;
            if (((!(_SafeStr_4079 == null)) && (!(_SafeStr_4079.playListEditorView == null))))
            {
                _local_1 = ((_SafeStr_4079.playListEditorView.selectedItemIndex != -1) ? _SafeStr_4079.playListEditorView.selectedItemIndex : 0);
            };
            var _local_2:RoomWidgetPlayListPlayStateMessage = new RoomWidgetPlayListPlayStateMessage("RWPLPS_TOGGLE_PLAY_PAUSE", _SafeStr_4318, _local_1);
            if (messageListener != null)
            {
                messageListener.processWidgetMessage(_local_2);
            };
        }

        public function playUserSong(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_3:int = _soundManager.musicController.getSongIdPlayingAtPriority(0);
            if (_local_3 != -1)
            {
                _local_2 = _soundManager.musicController.getSongInfo(_local_3);
                if (_local_2.soundObject != null)
                {
                    _local_2.soundObject.fadeOutSeconds = 0;
                };
            };
            _soundManager.musicController.playSong(_arg_1, 2, 0, 0, 0, 0);
        }

        public function stopUserSong():void
        {
            _soundManager.musicController.stop(2);
        }

        public function getImageGalleryAssetBitmap(_arg_1:String):BitmapData
        {
            var _local_2:* = null;
            var _local_3:BitmapDataAsset = (this.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_3 == null)
            {
                return (null);
            };
            _local_2 = (_local_3.content as BitmapData);
            return (_local_2.clone());
        }

        public function retrieveWidgetImage(_arg_1:String):void
        {
            var _local_4:String = _configuration.getProperty("image.library.playlist.url");
            var _local_5:String = ((_local_4 + _arg_1) + ".gif");
            _SafeStr_14.log(("[PlayListEditorWidget]  : " + _local_5));
            var _local_2:URLRequest = new URLRequest(_local_5);
            var _local_3:AssetLoaderStruct = this.assets.loadAssetFromFile(_arg_1, _local_2, "image/gif");
            _local_3.addEventListener("AssetLoaderEventComplete", onWidgetImageReady);
        }

        public function openSongDiskShopCataloguePage():void
        {
            var _local_1:RoomWidgetPlayListUserActionMessage = new RoomWidgetPlayListUserActionMessage("RWPLUA_OPEN_CATALOGUE_BUTTON_PRESSED");
            if (messageListener != null)
            {
                messageListener.processWidgetMessage(_local_1);
            };
            _catalog.openCatalogPage("trax_songs");
        }

        public function alertPlayListFull():void
        {
            this.windowManager.alert("${playlist.editor.alert.playlist.full.title}", "${playlist.editor.alert.playlist.full}", 0, alertHandler);
        }

        private function alertHandler(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }

        private function onShowPlayListEditorEvent(_arg_1:RoomWidgetPlayListEditorEvent):void
        {
            var _local_2:* = null;
            _SafeStr_4318 = _arg_1.furniId;
            if (!_SafeStr_4079)
            {
                _SafeStr_4079 = new MainWindowHandler(this, _soundManager.musicController);
                _SafeStr_4079.window.visible = false;
            };
            if (!_SafeStr_4079.window.visible)
            {
                _SafeStr_4079.show();
                _soundManager.musicController.requestUserSongDisks();
                _local_2 = _soundManager.musicController.getRoomItemPlaylist();
                if (_local_2 != null)
                {
                    _local_2.requestPlayList();
                };
            };
        }

        private function onHidePlayListEditorEvent(_arg_1:RoomWidgetPlayListEditorEvent):void
        {
            if (_SafeStr_4079 != null)
            {
                if (_SafeStr_4079.window.visible)
                {
                    _SafeStr_4079.hide();
                };
            };
        }

        private function onInventoryUpdatedEvent(_arg_1:RoomWidgetPlayListEditorEvent):void
        {
            if (!_SafeStr_4079)
            {
                return;
            };
            if (_SafeStr_4079.window.visible)
            {
                _soundManager.musicController.requestUserSongDisks();
            };
        }

        private function onWidgetImageReady(_arg_1:AssetLoaderEvent):void
        {
            var _local_2:* = null;
            if (_arg_1.type == "AssetLoaderEventComplete")
            {
                _local_2 = (_arg_1.target as AssetLoaderStruct);
                if (_local_2 != null)
                {
                    if (_SafeStr_4079 != null)
                    {
                        _SafeStr_4079.refreshLoadableAsset(_local_2.assetName);
                    };
                };
            };
        }

        private function onSongDiskInventoryUpdatedEvent(_arg_1:RoomWidgetPlayListEditorEvent):void
        {
            if (_SafeStr_4079)
            {
                _SafeStr_4079.onSongDiskInventoryReceived();
            };
        }

        private function onPlayListUpdatedEvent(_arg_1:RoomWidgetPlayListEditorEvent):void
        {
            if (_SafeStr_4079)
            {
                _SafeStr_4079.onPlayListUpdated();
            };
        }

        private function onPlayListFullEvent(_arg_1:RoomWidgetPlayListEditorEvent):void
        {
            alertPlayListFull();
        }

        private function onNowPlayingChangedEvent(_arg_1:RoomWidgetPlayListEditorNowPlayingEvent):void
        {
            if (_SafeStr_4079)
            {
                _SafeStr_4079.onNowPlayingChanged(_arg_1);
            };
        }


    }
}//package com.sulake.habbo.ui.widget.playlisteditor

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3348 = "_-Fw" (String#4529, DoABC#4)
// _SafeStr_4079 = "_-f1q" (String#323, DoABC#4)
// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)


