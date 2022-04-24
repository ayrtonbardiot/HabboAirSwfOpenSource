// by nota

//com.sulake.habbo.catalog.viewer.widgets.SongDiskProductViewCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-jK._SafeStr_720;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.catalog.viewer._SafeStr_3151;
    import _-v5._SafeStr_184;
    import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;

    public class SongDiskProductViewCatalogWidget extends ProductViewCatalogWidget 
    {

        private var _soundManager:_SafeStr_2088;
        private var _connection:IConnection;
        private var _playPreviewContainer:_SafeStr_3133;
        private var _playButton:_SafeStr_3122;
        private var _SafeStr_6908:_SafeStr_3109;
        private var _SafeStr_6891:int = -1;
        private var _officialSongId:String = "";
        private var _timeLocalization:String = "";
        private var _officialSongIdListener:IMessageEvent = null;

        public function SongDiskProductViewCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:HabboCatalog)
        {
            super(_arg_1, _arg_2);
            _playButton = (_window.findChildByName("listen") as _SafeStr_3122);
            _SafeStr_6908 = _window.findChildByName("ctlg_song_length");
            if (_playButton != null)
            {
                _playButton.addEventListener("WME_CLICK", onClickPlay);
                _playButton.disable();
            };
            _playPreviewContainer = (_window.findChildByName("playPreviewContainer") as _SafeStr_3133);
            if (_playPreviewContainer != null)
            {
                _playPreviewContainer.visible = false;
            };
            _soundManager = _arg_2.soundManager;
            if (_soundManager != null)
            {
                _soundManager.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
            };
            _connection = _arg_2.connection;
            if (((_connection) && (!(_officialSongIdListener))))
            {
                _officialSongIdListener = new _SafeStr_720(onOfficialSongIdMessageEvent);
                _connection.addMessageEvent(_officialSongIdListener);
            };
        }

        override public function dispose():void
        {
            if (_playButton != null)
            {
                _playButton.removeEventListener("WME_CLICK", onClickPlay);
            };
            if (((!(_soundManager == null)) && (!(_soundManager.musicController == null))))
            {
                _soundManager.musicController.stop(3);
                if (_soundManager.events != null)
                {
                    _soundManager.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
                };
                _soundManager = null;
                if (((_connection) && (_officialSongIdListener)))
                {
                    _connection.removeMessageEvent(_officialSongIdListener);
                    _officialSongIdListener = null;
                };
                _connection = null;
            };
            super.dispose();
        }

        override public function closed():void
        {
            super.closed();
            if (((!(_soundManager == null)) && (!(_soundManager.musicController == null))))
            {
                _soundManager.musicController.stop(3);
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            if (page.offers.length == 0)
            {
                return (false);
            };
            events.addEventListener("SELECT_PRODUCT", onSelectProduct);
            return (true);
        }

        private function onClickPlay(_arg_1:WindowMouseEvent):void
        {
            if (((!(_soundManager == null)) && (!(_soundManager.musicController == null))))
            {
                forceNoFadeoutOnPlayingSong(0);
                forceNoFadeoutOnPlayingSong(3);
                _soundManager.musicController.playSong(_SafeStr_6891, 3, 15, 40, 0.5, 2);
            };
        }

        private function forceNoFadeoutOnPlayingSong(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_3:int = _soundManager.musicController.getSongIdPlayingAtPriority(_arg_1);
            if (_local_3 != -1)
            {
                _local_2 = _soundManager.musicController.getSongInfo(_local_3);
                if (_local_2.soundObject != null)
                {
                    _local_2.soundObject.fadeOutSeconds = 0;
                };
            };
        }

        private function onSelectProduct(_arg_1:SelectProductEvent):void
        {
            if (((_arg_1 == null) || (_arg_1.offer == null)))
            {
                return;
            };
            var _local_2:_SafeStr_3151 = _arg_1.offer.product;
            if (_local_2.extraParam.length > 0)
            {
                _SafeStr_6891 = parseInt(_local_2.extraParam);
                if (_SafeStr_6891 == 0)
                {
                    _officialSongId = _local_2.extraParam;
                    if (_connection)
                    {
                        _connection.send(new _SafeStr_184(_officialSongId));
                    };
                };
                if (_playPreviewContainer != null)
                {
                    _playPreviewContainer.visible = true;
                };
            }
            else
            {
                _SafeStr_6891 = -1;
            };
            updateView();
        }

        private function updateView():void
        {
            var _local_1:int;
            var _local_4:int;
            var _local_8:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_2:Boolean;
            var _local_5:int = getSongLength();
            if (_local_5 >= 0)
            {
                _local_1 = int((_local_5 / 60));
                _local_4 = (_local_5 % 60);
                _local_8 = ("" + _local_1);
                _local_6 = ("" + _local_4);
                if (_local_4 < 10)
                {
                    _local_6 = ("0" + _local_6);
                };
                _local_3 = (page.viewer.catalog as HabboCatalog).localization;
                _local_3.registerParameter("catalog.song.length", "min", _local_8);
                _local_7 = _local_3.registerParameter("catalog.song.length", "sec", _local_6);
                _local_2 = true;
                if (_SafeStr_6908 != null)
                {
                    _SafeStr_6908.caption = _local_7;
                };
            }
            else
            {
                if (_SafeStr_6908 != null)
                {
                    _SafeStr_6908.caption = "";
                };
            };
            if (_playButton != null)
            {
                if (_local_2)
                {
                    _playButton.enable();
                }
                else
                {
                    _playButton.disable();
                };
            };
        }

        private function getSongLength():int
        {
            var _local_1:* = null;
            if (((!(_soundManager == null)) && (!(_soundManager.musicController == null))))
            {
                _local_1 = _soundManager.musicController.getSongInfo(_SafeStr_6891);
                if (_local_1 != null)
                {
                    return (_local_1.length / 1000);
                };
                _soundManager.musicController.requestSongInfoWithoutSamples(_SafeStr_6891);
            };
            return (-1);
        }

        private function onSongInfoReceivedEvent(_arg_1:SongInfoReceivedEvent):void
        {
            if (_arg_1.id == _SafeStr_6891)
            {
                updateView();
            };
        }

        private function onOfficialSongIdMessageEvent(_arg_1:_SafeStr_720):void
        {
            if (_arg_1.getParser().officialSongId == _officialSongId)
            {
                _SafeStr_6891 = _arg_1.getParser().songId;
                updateView();
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_184 = "_-tB" (String#29093, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3151 = "_-22v" (String#1574, DoABC#4)
// _SafeStr_6891 = "_-z1o" (String#4669, DoABC#4)
// _SafeStr_6908 = "_-X1L" (String#11402, DoABC#4)
// _SafeStr_720 = "_-Sc" (String#23141, DoABC#4)


