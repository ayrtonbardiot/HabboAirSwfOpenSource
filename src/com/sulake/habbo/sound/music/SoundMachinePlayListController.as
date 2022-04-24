// by nota

//com.sulake.habbo.sound.music.SoundMachinePlayListController

package com.sulake.habbo.sound.music
{
    import com.sulake.habbo.sound._SafeStr_3348;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import com.sulake.core.communication.connection.IConnection;
    import flash.events.IEventDispatcher;
    import _-jK._SafeStr_704;
    import _-jK._SafeStr_369;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.events.Event;
    import com.sulake.habbo.sound.ISongInfo;
    import com.sulake.habbo.sound.events.SoundCompleteEvent;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import _-v5._SafeStr_637;
    import _-jK._SafeStr_1543;
    import _-cP._SafeStr_1302;
    import com.sulake.habbo.sound.events.PlayListStatusEvent;
    import _-cP._SafeStr_1309;
    import com.sulake.habbo.sound.*;

    public class SoundMachinePlayListController implements _SafeStr_3348 
    {

        private var _soundManager:HabboSoundManagerFlash10;
        private var _SafeStr_3976:HabboMusicController;
        private var _connection:IConnection;
        private var _SafeStr_3983:IEventDispatcher;
        private var _roomEvents:IEventDispatcher;
        private var _SafeStr_6137:int = -1;
        private var _SafeStr_6136:Array = [];
        private var _SafeStr_6138:Boolean;
        private var _disposed:Boolean = false;
        private var _messageEvents:Array;

        public function SoundMachinePlayListController(_arg_1:HabboSoundManagerFlash10, _arg_2:HabboMusicController, _arg_3:IEventDispatcher, _arg_4:IEventDispatcher, _arg_5:IConnection)
        {
            _soundManager = _arg_1;
            _SafeStr_3983 = _arg_3;
            _roomEvents = _arg_4;
            _connection = _arg_5;
            _SafeStr_3976 = _arg_2;
            _messageEvents = [];
            _messageEvents.push(new _SafeStr_704(onPlayListMessage));
            _messageEvents.push(new _SafeStr_369(onPlayListSongAddedMessage));
            for each (var _local_6:IMessageEvent in _messageEvents)
            {
                _connection.addMessageEvent(_local_6);
            };
            _SafeStr_3983.addEventListener("SCE_TRAX_SONG_COMPLETE", onSongFinishedPlayingEvent);
            _SafeStr_3983.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
            _roomEvents.addEventListener("ROSM_SOUND_MACHINE_SWITCHED_ON", onSoundMachinePlayEvent);
            _roomEvents.addEventListener("ROSM_SOUND_MACHINE_SWITCHED_OFF", onSoundMachineStopEvent);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get priority():int
        {
            return (0);
        }

        public function get length():int
        {
            if (_SafeStr_6136 == null)
            {
                return (0);
            };
            return (_SafeStr_6136.length);
        }

        public function get playPosition():int
        {
            return (-1);
        }

        public function get nowPlayingSongId():int
        {
            return (_SafeStr_6137);
        }

        public function get isPlaying():Boolean
        {
            return (_SafeStr_6138);
        }

        public function set playPosition(_arg_1:int):void
        {
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_6138)
                {
                    stopPlaying();
                };
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
                _SafeStr_6136 = null;
                _SafeStr_3976 = null;
                if (_SafeStr_3983)
                {
                    _SafeStr_3983.removeEventListener("SCE_TRAX_SONG_COMPLETE", onSongFinishedPlayingEvent);
                    _SafeStr_3983 = null;
                };
                if (_roomEvents)
                {
                    _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_SWITCHED_ON", onSoundMachinePlayEvent);
                    _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_SWITCHED_OFF", onSoundMachineStopEvent);
                    _roomEvents = null;
                };
                _disposed = true;
            };
        }

        private function onSoundMachinePlayEvent(_arg_1:Event):void
        {
            startPlaying();
        }

        private function onSoundMachineStopEvent(_arg_1:Event):void
        {
            stopPlaying();
        }

        public function startPlaying():void
        {
            if (_SafeStr_6138)
            {
                return;
            };
            if (((_SafeStr_6136 == null) || (_SafeStr_6136.length == 0)))
            {
                requestPlayList();
                _SafeStr_6138 = true;
                return;
            };
            stopPlaying();
            _SafeStr_6137 = -1;
            _SafeStr_6138 = true;
            playNextSong();
        }

        public function checkSongPlayState(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_SafeStr_6137 == _arg_1)
            {
                playCurrentSongAndNotify(_SafeStr_6137);
                _local_2 = getNextEntry();
                if (_local_2 != null)
                {
                    _SafeStr_3976.addSongInfoRequest(_local_2.id);
                };
            };
        }

        public function stopPlaying():void
        {
            _SafeStr_6137 = -1;
            _SafeStr_6138 = false;
            _SafeStr_3976.stop(0);
        }

        public function updateVolume(_arg_1:Number):void
        {
        }

        public function addItem(_arg_1:ISongInfo, _arg_2:int=0):int
        {
            return (-1);
        }

        public function moveItem(_arg_1:int, _arg_2:int):void
        {
        }

        public function removeItem(_arg_1:int):void
        {
        }

        private function onSongFinishedPlayingEvent(_arg_1:SoundCompleteEvent):void
        {
            if (_arg_1.id == _SafeStr_6137)
            {
                playNextSong();
            };
        }

        private function onSongInfoReceivedEvent(_arg_1:SongInfoReceivedEvent):void
        {
            var _local_2:* = null;
            var _local_4:int;
            var _local_3:* = null;
            if (((_SafeStr_6136 == null) || (_SafeStr_6136.length == 0)))
            {
                return;
            };
            _local_4 = 0;
            while (_local_4 < _SafeStr_6136.length)
            {
                _local_2 = _SafeStr_6136[_local_4];
                if (_local_2.id == _arg_1.id)
                {
                    _local_3 = (_SafeStr_3976.getSongInfo(_arg_1.id) as SongDataEntry);
                    if (_local_3 != null)
                    {
                        _SafeStr_6136[_local_4] = _local_3;
                    };
                    return;
                };
                _local_4++;
            };
        }

        private function playNextSong():void
        {
            var _local_1:SongDataEntry = getNextEntry();
            if (_local_1 != null)
            {
                _SafeStr_6137 = _local_1.id;
                playCurrentSongAndNotify(_SafeStr_6137);
            };
        }

        private function playCurrentSongAndNotify(_arg_1:int):void
        {
            var _local_2:SongDataEntry = (getEntryWithId(_arg_1) as SongDataEntry);
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:Number = _local_2.startPlayHeadPos;
            _local_2.startPlayHeadPos = 0;
            if (_SafeStr_3976.playSong(_arg_1, 0, _local_3, 0, 0, 0))
            {
                _SafeStr_14.log(((("Trax song started by playlist: " + _local_2.name) + " by ") + _local_2.creator));
            };
        }

        private function getNextEntry():SongDataEntry
        {
            var _local_1:* = null;
            var _local_2:int;
            if (((_SafeStr_6136 == null) || (_SafeStr_6136.length == 0)))
            {
                return (null);
            };
            var _local_3:int;
            _local_2 = 0;
            while (_local_2 < _SafeStr_6136.length)
            {
                _local_1 = _SafeStr_6136[_local_2];
                if (_local_1.id == _SafeStr_6137)
                {
                    _local_3 = (_local_2 + 1);
                };
                _local_2++;
            };
            if (_local_3 >= _SafeStr_6136.length)
            {
                _local_3 = 0;
            };
            return (_SafeStr_6136[_local_3]);
        }

        public function getEntry(_arg_1:int):ISongInfo
        {
            if ((((_SafeStr_6136 == null) || (_arg_1 < 0)) || (_arg_1 >= _SafeStr_6136.length)))
            {
                return (null);
            };
            return (_SafeStr_6136[_arg_1]);
        }

        public function getEntryWithId(_arg_1:int):ISongInfo
        {
            var _local_2:* = null;
            var _local_3:int;
            if (((_SafeStr_6136 == null) || (_SafeStr_6136.length == 0)))
            {
                return (null);
            };
            _local_3 = 0;
            while (_local_3 < _SafeStr_6136.length)
            {
                _local_2 = _SafeStr_6136[_local_3];
                if (_local_2.id == _arg_1)
                {
                    return (_local_2);
                };
                _local_3++;
            };
            return (null);
        }

        public function requestPlayList():void
        {
            if (_connection == null)
            {
                return;
            };
            _connection.send(new _SafeStr_637());
        }

        private function convertParserPlayList(_arg_1:Array):Array
        {
            var _local_3:Array = [];
            for each (var _local_2:_SafeStr_1543 in _arg_1)
            {
                _local_3.push(new SongDataEntry(_local_2.id, _local_2.length, _local_2.name, _local_2.creator, null));
            };
            return (_local_3);
        }

        private function onPlayListMessage(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_7:int;
            var _local_5:_SafeStr_704 = (_arg_1 as _SafeStr_704);
            var _local_4:_SafeStr_1302 = (_local_5.getParser() as _SafeStr_1302);
            var _local_6:int = _local_4.synchronizationCount;
            var _local_3:Array = convertParserPlayList(_local_4.playList);
            if (((_local_3 == null) || (_local_3.length == 0)))
            {
                return;
            };
            _SafeStr_6136 = _local_3;
            var _local_8:int;
            _local_7 = 0;
            while (_local_7 < _local_3.length)
            {
                _local_2 = _SafeStr_6136[_local_7];
                _local_8 = (_local_8 + _local_2.length);
                _local_7++;
            };
            if (_local_6 < 0)
            {
                _local_6 = 0;
            };
            _local_6 = (_local_6 % _local_8);
            _local_7 = 0;
            while (_local_7 < _local_3.length)
            {
                _local_2 = _SafeStr_6136[_local_7];
                if (_local_6 > _local_2.length)
                {
                    _local_6 = (_local_6 - _local_2.length);
                }
                else
                {
                    _SafeStr_6137 = _local_2.id;
                    _local_2.startPlayHeadPos = (_local_6 / 1000);
                    break;
                };
                _local_7++;
            };
            _SafeStr_3983.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
            if (((!(_local_2 == null)) && (_SafeStr_6138)))
            {
                playCurrentSongAndNotify(_local_2.id);
            };
        }

        private function onPlayListSongAddedMessage(_arg_1:IMessageEvent):void
        {
            var _local_4:_SafeStr_369 = (_arg_1 as _SafeStr_369);
            var _local_3:_SafeStr_1309 = (_local_4.getParser() as _SafeStr_1309);
            var _local_2:SongDataEntry = new SongDataEntry(_local_3.entry.id, _local_3.entry.length, _local_3.entry.name, _local_3.entry.creator, null);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_6136.push(_local_2);
            _SafeStr_3983.dispatchEvent(new PlayListStatusEvent("PLUE_PLAY_LIST_UPDATED"));
            if (!_SafeStr_6138)
            {
                return;
            };
            if (_SafeStr_6136.length == 1)
            {
                playCurrentSongAndNotify(_local_2.id);
            }
            else
            {
                checkSongPlayState(_local_2.id);
            };
        }


    }
}//package com.sulake.habbo.sound.music

// _SafeStr_1302 = "_-S1c" (String#29132, DoABC#4)
// _SafeStr_1309 = "_-k1b" (String#31153, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1543 = "_-L1G" (String#26541, DoABC#4)
// _SafeStr_3348 = "_-Fw" (String#4529, DoABC#4)
// _SafeStr_369 = "_-ar" (String#19041, DoABC#4)
// _SafeStr_3976 = "_-40" (String#1128, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_6136 = "_-Wb" (String#2592, DoABC#4)
// _SafeStr_6137 = "_-T12" (String#3733, DoABC#4)
// _SafeStr_6138 = "_-eq" (String#4266, DoABC#4)
// _SafeStr_637 = "_-Z1b" (String#31335, DoABC#4)
// _SafeStr_704 = "_-T1v" (String#21844, DoABC#4)


