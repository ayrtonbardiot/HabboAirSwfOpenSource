// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.music.JukeboxPlayListController

package com.sulake.habbo.sound.music
{
    import com.sulake.habbo.sound._SafeStr_3348;
    import com.sulake.habbo.sound._SafeStr_3169;
    import flash.events.IEventDispatcher;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import _-jK._SafeStr_625;
    import _-jK._SafeStr_998;
    import _-jK._SafeStr_747;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-v5._SafeStr_630;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.sound.events.SoundCompleteEvent;
    import _-cP._SafeStr_1294;
    import com.sulake.habbo.sound.events.NowPlayingEvent;
    import _-cP._SafeStr_1314;
    import com.sulake.habbo.sound.events.PlayListStatusEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;

    public class JukeboxPlayListController implements _SafeStr_3348 
    {

        private var _disposed:Boolean = false;
        private var _SafeStr_6138:Boolean = false;
        private var _SafeStr_5093:Array = [];
        private var _SafeStr_3976:_SafeStr_3169;
        private var _SafeStr_3983:IEventDispatcher;
        private var _connection:IConnection;
        private var _soundManager:HabboSoundManagerFlash10;
        private var _SafeStr_6137:int = -1;
        private var _missingSongInfo:Array = [];
        private var _messageEvents:Array;
        private var _playPosition:int = -1;

        public function JukeboxPlayListController(_arg_1:HabboSoundManagerFlash10, _arg_2:HabboMusicController, _arg_3:IEventDispatcher, _arg_4:IConnection)
        {
            _soundManager = _arg_1;
            _SafeStr_3976 = _arg_2;
            _SafeStr_3983 = _arg_3;
            _connection = _arg_4;
            _messageEvents = [];
            _messageEvents.push(new _SafeStr_625(onNowPlayingMessage));
            _messageEvents.push(new _SafeStr_998(onJukeboxSongDisksMessage));
            _messageEvents.push(new _SafeStr_747(onJukeboxPlayListFullMessage));
            for each (var _local_5:IMessageEvent in _messageEvents)
            {
                _connection.addMessageEvent(_local_5);
            };
            _SafeStr_3983.addEventListener("SCE_TRAX_SONG_COMPLETE", onSongFinishedPlayingEvent);
            _SafeStr_3976.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
        }

        public function get priority():int
        {
            return (0);
        }

        public function get nowPlayingSongId():int
        {
            return (_SafeStr_6137);
        }

        public function get playPosition():int
        {
            return (_playPosition);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get isPlaying():Boolean
        {
            return (_SafeStr_6138);
        }

        public function get length():int
        {
            if (_SafeStr_5093 == null)
            {
                return (0);
            };
            return (_SafeStr_5093.length);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                stopPlaying();
                if (_SafeStr_3976.events)
                {
                    _SafeStr_3976.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
                };
                _SafeStr_3976 = null;
                _soundManager = null;
                if (_connection)
                {
                    for each (var _local_1:IMessageEvent in _messageEvents)
                    {
                        _connection.removeMessageEvent(_local_1);
                        _local_1.dispose();
                    };
                    _messageEvents = null;
                    _connection = null;
                };
                if (_SafeStr_3983)
                {
                    _SafeStr_3983.removeEventListener("SCE_TRAX_SONG_COMPLETE", onSongFinishedPlayingEvent);
                    _SafeStr_3983 = null;
                };
                _disposed = true;
            };
        }

        public function stopPlaying():void
        {
            _SafeStr_3976.stop(priority);
            _SafeStr_6137 = -1;
            _playPosition = -1;
            _SafeStr_6138 = false;
        }

        public function requestPlayList():void
        {
            if (_connection == null)
            {
                return;
            };
            _connection.send(new _SafeStr_630());
        }

        public function getEntry(_arg_1:int):ISongInfo
        {
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_5093.length)))
            {
                return (null);
            };
            return (_SafeStr_5093[_arg_1]);
        }

        protected function onSongFinishedPlayingEvent(_arg_1:SoundCompleteEvent):void
        {
        }

        private function onNowPlayingMessage(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_625 = (_arg_1 as _SafeStr_625);
            var _local_2:_SafeStr_1294 = (_local_3.getParser() as _SafeStr_1294);
            _SafeStr_14.log(((((("Received Now Playing message with: " + _local_2.currentSongId) + ", ") + _local_2.nextSongId) + ", ") + _local_2.syncCount));
            _SafeStr_6138 = (!(_local_2.currentSongId == -1));
            if (_local_2.currentSongId >= 0)
            {
                _SafeStr_3976.playSong(_local_2.currentSongId, 0, (_local_2.syncCount / 1000), 0, 1, 1);
                _SafeStr_6137 = _local_2.currentSongId;
            }
            else
            {
                stopPlaying();
            };
            if (_local_2.nextSongId >= 0)
            {
                _SafeStr_3976.addSongInfoRequest(_local_2.nextSongId);
            };
            _playPosition = _local_2.currentPosition;
            _soundManager.events.dispatchEvent(new NowPlayingEvent("NPE_SONG_CHANGED", 0, _local_2.currentSongId, _local_2.currentPosition));
        }

        private function onJukeboxSongDisksMessage(_arg_1:IMessageEvent):void
        {
            var _local_4:int;
            var _local_7:int;
            var _local_6:int;
            var _local_3:* = null;
            var _local_5:_SafeStr_998 = (_arg_1 as _SafeStr_998);
            var _local_2:_SafeStr_1314 = (_local_5.getParser() as _SafeStr_1314);
            _SafeStr_14.log(("Received Jukebox song disks (=playlist) message, length of playlist: " + _local_2.songDisks.length));
            _SafeStr_5093 = [];
            _local_4 = 0;
            while (_local_4 < _local_2.songDisks.length)
            {
                _local_7 = _local_2.songDisks.getWithIndex(_local_4);
                _local_6 = _local_2.songDisks.getKey(_local_4);
                _local_3 = (_SafeStr_3976.getSongInfo(_local_7) as SongDataEntry);
                if (_local_3 == null)
                {
                    _local_3 = new SongDataEntry(_local_7, -1, null, null, null);
                    if (_missingSongInfo.indexOf(_local_7) < 0)
                    {
                        _missingSongInfo.push(_local_7);
                        _SafeStr_3976.requestSongInfoWithoutSamples(_local_7);
                    };
                };
                _local_3.diskId = _local_6;
                _SafeStr_5093.push(_local_3);
                _local_4++;
            };
            if (_missingSongInfo.length == 0)
            {
                _SafeStr_3983.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
            };
        }

        private function onJukeboxPlayListFullMessage(_arg_1:IMessageEvent):void
        {
            _SafeStr_14.log("Received jukebox playlist full message.");
            _SafeStr_3983.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_FULL"));
        }

        private function onSongInfoReceivedEvent(_arg_1:SongInfoReceivedEvent):void
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_6:int;
            var _local_3:* = null;
            _local_4 = 0;
            while (_local_4 < length)
            {
                _local_2 = _SafeStr_5093[_local_4];
                if (_local_2.id == _arg_1.id)
                {
                    _local_6 = _local_2.diskId;
                    _local_3 = (_SafeStr_3976.getSongInfo(_arg_1.id) as SongDataEntry);
                    if (_local_3 != null)
                    {
                        _local_3.diskId = _local_6;
                        _SafeStr_5093[_local_4] = _local_3;
                    };
                    break;
                };
                _local_4++;
            };
            var _local_5:int = _missingSongInfo.indexOf(_arg_1.id);
            if (_local_5 >= 0)
            {
                _missingSongInfo.splice(_local_5, 1);
            };
            if (_missingSongInfo.length == 0)
            {
                _SafeStr_3983.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
            };
        }


    }
}//package com.sulake.habbo.sound.music

// _SafeStr_1294 = "_-H1o" (String#30548, DoABC#4)
// _SafeStr_1314 = "_-6" (String#28361, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_3169 = "_-KZ" (String#5121, DoABC#4)
// _SafeStr_3348 = "_-Fw" (String#4529, DoABC#4)
// _SafeStr_3976 = "_-40" (String#1128, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_5093 = "_-Pc" (String#1317, DoABC#4)
// _SafeStr_6137 = "_-T12" (String#3733, DoABC#4)
// _SafeStr_6138 = "_-eq" (String#4266, DoABC#4)
// _SafeStr_625 = "_-hr" (String#18965, DoABC#4)
// _SafeStr_630 = "_-RE" (String#30932, DoABC#4)
// _SafeStr_747 = "_-Ct" (String#30063, DoABC#4)
// _SafeStr_998 = "_-b1q" (String#15835, DoABC#4)


