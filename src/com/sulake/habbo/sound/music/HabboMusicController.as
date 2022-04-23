// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.music.HabboMusicController

package com.sulake.habbo.sound.music
{
    import com.sulake.habbo.sound._SafeStr_3169;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import com.sulake.core.communication.connection.IConnection;
    import flash.events.IEventDispatcher;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.sound._SafeStr_3348;
    import flash.utils.Timer;
    import _-jK._SafeStr_984;
    import _-jK._SafeStr_1001;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.sound.events.NowPlayingEvent;
    import com.sulake.habbo.sound.events.SoundCompleteEvent;
    import com.sulake.habbo.sound._SafeStr_3135;
    import com.sulake.habbo.sound.ISongInfo;
    import _-v5._SafeStr_945;
    import com.sulake.habbo.sound.trax.TraxSequencer;
    import _-v5._SafeStr_729;
    import flash.events.TimerEvent;
    import _-cP._SafeStr_1080;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
    import flash.utils.getTimer;
    import _-cP._SafeStr_1188;
    import flash.events.Event;
    import _-v5._SafeStr_179;
    import com.sulake.habbo.sound.*;

    public class HabboMusicController implements _SafeStr_3169, _SafeStr_13 
    {

        public static const SKIP_POSITION_SET:int = -1;
        private static const MAXIMUM_NOTIFY_PRIORITY:int = 0;

        private var _soundManager:HabboSoundManagerFlash10;
        private var _connection:IConnection;
        private var _SafeStr_3983:IEventDispatcher;
        private var _roomEvents:IEventDispatcher;
        private var _SafeStr_5142:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_5143:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_5145:Array = [];
        private var _SafeStr_5141:_SafeStr_3348 = null;
        private var _disposed:Boolean = false;
        private var _SafeStr_5137:Array = [];
        private var _SafeStr_5138:Array = [];
        private var _SafeStr_5139:int = -1;
        private var _SafeStr_5146:int = -1;
        private var _SafeStr_5140:int = -1;
        private var _SafeStr_5136:Timer;
        private var _SafeStr_5144:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_5147:Array = [];
        private var _messageEvents:Array = [];
        private var _SafeStr_5148:int = -1;
        private var _previousNotificationTime:int = -1;

        public function HabboMusicController(_arg_1:HabboSoundManagerFlash10, _arg_2:IEventDispatcher, _arg_3:IEventDispatcher, _arg_4:IConnection)
        {
            var _local_5:int;
            super();
            _soundManager = _arg_1;
            _SafeStr_3983 = _arg_2;
            _roomEvents = _arg_3;
            _connection = _arg_4;
            _messageEvents.push(new _SafeStr_984(onSongInfoMessage));
            _messageEvents.push(new _SafeStr_1001(onSongDiskInventoryMessage));
            for each (var _local_6:IMessageEvent in _messageEvents)
            {
                _connection.addMessageEvent(_local_6);
            };
            _roomEvents.addEventListener("ROSM_JUKEBOX_INIT", onJukeboxInit);
            _roomEvents.addEventListener("ROSM_JUKEBOX_DISPOSE", onJukeboxDispose);
            _roomEvents.addEventListener("ROSM_SOUND_MACHINE_INIT", onSoundMachineInit);
            _roomEvents.addEventListener("ROSM_SOUND_MACHINE_DISPOSE", onSoundMachineDispose);
            _SafeStr_5136 = new Timer(1000);
            _SafeStr_5136.start();
            _SafeStr_5136.addEventListener("timer", sendNextSongRequestMessage);
            _SafeStr_3983.addEventListener("SCE_TRAX_SONG_COMPLETE", onSongFinishedPlayingEvent);
            _local_5 = 0;
            while (_local_5 < 4)
            {
                _SafeStr_5137[_local_5] = null;
                _SafeStr_5138[_local_5] = 0;
                _local_5++;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get events():IEventDispatcher
        {
            return (_SafeStr_3983);
        }

        protected function onSongFinishedPlayingEvent(_arg_1:SoundCompleteEvent):void
        {
            var _local_2:int;
            _SafeStr_14.log((("Song " + _arg_1.id) + " finished playing"));
            if (getSongIdPlayingAtPriority(_SafeStr_5139) == _arg_1.id)
            {
                if (((getTopRequestPriority() == _SafeStr_5139) && (getSongRequestCountAtPriority(_SafeStr_5139) == _SafeStr_5140)))
                {
                    resetSongStartRequest(_SafeStr_5139);
                };
                _local_2 = _SafeStr_5139;
                playSongWithHighestPriority();
                if (_local_2 >= 2)
                {
                    _SafeStr_3983.dispatchEvent(new NowPlayingEvent("NPW_USER_STOP_SONG", _local_2, _arg_1.id, -1));
                };
            };
        }

        public function dispose():void
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:* = null;
            if (!_disposed)
            {
                _soundManager = null;
                _SafeStr_5145 = null;
                if (_connection)
                {
                    for each (var _local_4:IMessageEvent in _messageEvents)
                    {
                        _connection.removeMessageEvent(_local_4);
                        _local_4.dispose();
                    };
                    _messageEvents = null;
                    _connection = null;
                };
                if (_SafeStr_5141)
                {
                    _SafeStr_5141.dispose();
                    _SafeStr_5141 = null;
                };
                if (_SafeStr_5142)
                {
                    _local_3 = 0;
                    while (_local_3 < _SafeStr_5142.length)
                    {
                        _local_1 = (_SafeStr_5142.getWithIndex(_local_3) as SongDataEntry);
                        _local_2 = (_local_1.soundObject as _SafeStr_3135);
                        if (_local_2 != null)
                        {
                            _local_2.stop();
                        };
                        _local_1.soundObject = null;
                        _local_3++;
                    };
                    _SafeStr_5142.dispose();
                    _SafeStr_5142 = null;
                };
                if (_SafeStr_5143 != null)
                {
                    _SafeStr_5143.dispose();
                    _SafeStr_5143 = null;
                };
                _SafeStr_5136.stop();
                _SafeStr_5136 = null;
                if (_roomEvents)
                {
                    _roomEvents.removeEventListener("ROSM_JUKEBOX_INIT", onJukeboxInit);
                    _roomEvents.removeEventListener("ROSM_JUKEBOX_DISPOSE", onJukeboxDispose);
                    _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_INIT", onSoundMachineInit);
                    _roomEvents.removeEventListener("ROSM_SOUND_MACHINE_DISPOSE", onSoundMachineDispose);
                };
                if (_SafeStr_5144 != null)
                {
                    _SafeStr_5144.dispose();
                    _SafeStr_5144 = null;
                };
                _disposed = true;
            };
        }

        public function getRoomItemPlaylist(_arg_1:int=-1):_SafeStr_3348
        {
            return (_SafeStr_5141);
        }

        private function addSongStartRequest(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number):Boolean
        {
            if (((_arg_1 < 0) || (_arg_1 >= 4)))
            {
                return (false);
            };
            var _local_7:SongStartRequestData = new SongStartRequestData(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
            _SafeStr_5137[_arg_1] = _local_7;
            var _local_8:* = _arg_1;
            var _local_9:* = (_SafeStr_5138[_local_8] + 1);
            _SafeStr_5138[_local_8] = _local_9;
            return (true);
        }

        private function getSongStartRequest(_arg_1:int):SongStartRequestData
        {
            return (_SafeStr_5137[_arg_1]);
        }

        private function getSongIdRequestedAtPriority(_arg_1:int):int
        {
            if (((_arg_1 < 0) || (_arg_1 >= 4)))
            {
                return (-1);
            };
            if (_SafeStr_5137[_arg_1] == null)
            {
                return (-1);
            };
            var _local_2:SongStartRequestData = _SafeStr_5137[_arg_1];
            return (_local_2.songId);
        }

        private function getSongRequestCountAtPriority(_arg_1:int):int
        {
            if (((_arg_1 < 0) || (_arg_1 >= 4)))
            {
                return (-1);
            };
            return (_SafeStr_5138[_arg_1]);
        }

        private function getTopRequestPriority():int
        {
            var _local_1:int;
            _local_1 = (_SafeStr_5137.length - 1);
            while (_local_1 >= 0)
            {
                if (_SafeStr_5137[_local_1] != null)
                {
                    return (_local_1);
                };
                _local_1--;
            };
            return (-1);
        }

        private function resetSongStartRequest(_arg_1:int):void
        {
            if (((_arg_1 >= 0) && (_arg_1 < 4)))
            {
                _SafeStr_5137[_arg_1] = null;
            };
        }

        private function reRequestSongAtPriority(_arg_1:int):void
        {
            var _local_2:* = _arg_1;
            var _local_3:* = (_SafeStr_5138[_local_2] + 1);
            _SafeStr_5138[_local_2] = _local_3;
        }

        private function processSongEntryForPlaying(_arg_1:int, _arg_2:Boolean=true):Boolean
        {
            var _local_4:SongDataEntry = getSongDataEntry(_arg_1);
            if (_local_4 == null)
            {
                addSongInfoRequest(_arg_1);
                return (false);
            };
            if (_local_4.soundObject == null)
            {
                _local_4.soundObject = _soundManager.loadTraxSong(_local_4.id, _local_4.songData);
            };
            var _local_3:_SafeStr_3135 = _local_4.soundObject;
            if (!_local_3.ready)
            {
                return (false);
            };
            return (true);
        }

        public function playSong(_arg_1:int, _arg_2:int, _arg_3:Number=0, _arg_4:Number=0, _arg_5:Number=0.5, _arg_6:Number=0.5):Boolean
        {
            _SafeStr_14.log((("Requesting " + _arg_1) + " for playing"));
            if (!addSongStartRequest(_arg_2, _arg_1, _arg_3, _arg_4, _arg_5, _arg_6))
            {
                return (false);
            };
            if (!processSongEntryForPlaying(_arg_1))
            {
                return (false);
            };
            if (_arg_2 >= _SafeStr_5139)
            {
                playSongObject(_arg_2, _arg_1);
            }
            else
            {
                _SafeStr_14.log(((("Higher priority song blocked playing. Stored song " + _arg_1) + " for priority ") + _arg_2));
            };
            return (true);
        }

        private function playSongWithHighestPriority():void
        {
            var _local_2:int;
            var _local_3:int;
            _SafeStr_5139 = -1;
            _SafeStr_5146 = -1;
            _SafeStr_5140 = -1;
            var _local_1:int = getTopRequestPriority();
            _local_2 = _local_1;
            while (_local_2 >= 0)
            {
                _local_3 = getSongIdRequestedAtPriority(_local_2);
                if (((_local_3 >= 0) && (playSongObject(_local_2, _local_3))))
                {
                    return;
                };
                _local_2--;
            };
        }

        public function stop(_arg_1:int):void
        {
            var _local_2:* = (_arg_1 == _SafeStr_5139);
            var _local_3:* = (getTopRequestPriority() == _arg_1);
            if (_local_2)
            {
                resetSongStartRequest(_arg_1);
                stopSongAtPriority(_arg_1);
            }
            else
            {
                resetSongStartRequest(_arg_1);
                if (_local_3)
                {
                    reRequestSongAtPriority(_SafeStr_5139);
                };
            };
        }

        private function stopSongAtPriority(_arg_1:int):Boolean
        {
            var _local_3:int;
            var _local_2:* = null;
            if (((_arg_1 == _SafeStr_5139) && (_SafeStr_5139 >= 0)))
            {
                _local_3 = getSongIdPlayingAtPriority(_arg_1);
                if (_local_3 >= 0)
                {
                    _local_2 = getSongDataEntry(_local_3);
                    stopSongDataEntry(_local_2);
                    return (true);
                };
            };
            return (false);
        }

        private function stopSongDataEntry(_arg_1:SongDataEntry):void
        {
            var _local_2:* = null;
            if (_arg_1 != null)
            {
                _SafeStr_14.log(("Stopping current song " + _arg_1.id));
                _local_2 = _arg_1.soundObject;
                if (_local_2 != null)
                {
                    _local_2.stop();
                };
            };
        }

        private function getSongDataEntry(_arg_1:int):SongDataEntry
        {
            var _local_2:SongDataEntry;
            if (_SafeStr_5142 != null)
            {
                _local_2 = (_SafeStr_5142.getValue(_arg_1) as SongDataEntry);
            };
            return (_local_2);
        }

        public function updateVolume(_arg_1:Number):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < 4)
            {
                _local_4 = getSongIdPlayingAtPriority(_local_3);
                if (_local_4 >= 0)
                {
                    _local_2 = (getSongDataEntry(_local_4) as SongDataEntry);
                    if (((!(_local_2 == null)) && (!(_local_2.soundObject == null))))
                    {
                        _local_2.soundObject.volume = _arg_1;
                    };
                };
                _local_3++;
            };
        }

        public function onSongLoaded(_arg_1:int):void
        {
            var _local_3:int;
            _SafeStr_14.log(("Song loaded : " + _arg_1));
            var _local_2:int = getTopRequestPriority();
            if (_local_2 >= 0)
            {
                _local_3 = getSongIdRequestedAtPriority(_local_2);
                if (_arg_1 == _local_3)
                {
                    playSongObject(_local_2, _arg_1);
                };
            };
        }

        public function addSongInfoRequest(_arg_1:int):void
        {
            requestSong(_arg_1, true);
        }

        public function requestSongInfoWithoutSamples(_arg_1:int):void
        {
            requestSong(_arg_1, false);
        }

        private function requestSong(_arg_1:int, _arg_2:Boolean):void
        {
            if (_SafeStr_5143.getValue(_arg_1) == null)
            {
                _SafeStr_5143.add(_arg_1, _arg_2);
                _SafeStr_5145.push(_arg_1);
            };
        }

        public function getSongInfo(_arg_1:int):ISongInfo
        {
            var _local_2:SongDataEntry = getSongDataEntry(_arg_1);
            if (_local_2 == null)
            {
                requestSongInfoWithoutSamples(_arg_1);
            };
            return (_local_2);
        }

        public function requestUserSongDisks():void
        {
            if (_connection == null)
            {
                return;
            };
            _connection.send(new _SafeStr_945());
        }

        public function getSongDiskInventorySize():int
        {
            return (_SafeStr_5144.length);
        }

        public function getSongDiskInventoryDiskId(_arg_1:int):int
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_5144.length)))
            {
                return (_SafeStr_5144.getKey(_arg_1));
            };
            return (-1);
        }

        public function getSongDiskInventorySongId(_arg_1:int):int
        {
            if (((_arg_1 >= 0) && (_arg_1 < _SafeStr_5144.length)))
            {
                return (_SafeStr_5144.getWithIndex(_arg_1));
            };
            return (-1);
        }

        public function getSongIdPlayingAtPriority(_arg_1:int):int
        {
            if (_arg_1 != _SafeStr_5139)
            {
                return (-1);
            };
            return (_SafeStr_5146);
        }

        public function samplesUnloaded(_arg_1:Array):void
        {
            var _local_5:int;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_6:int;
            _local_5 = 0;
            while (_local_5 < _SafeStr_5142.length)
            {
                _local_3 = (_SafeStr_5142.getWithIndex(_local_5) as SongDataEntry);
                _local_4 = (_local_3.soundObject as TraxSequencer);
                if ((((!(_local_3.id == _SafeStr_5146)) && (!(_local_4 == null))) && (_local_4.ready)))
                {
                    _local_2 = _local_4.traxData.getSampleIds();
                    _local_6 = 0;
                    while (_local_6 < _arg_1.length)
                    {
                        if (_local_2.indexOf(_arg_1[_local_6]) != -1)
                        {
                            _local_3.soundObject = null;
                            _local_4.dispose();
                            _SafeStr_14.log(((("Unloaded " + _local_3.name) + " by ") + _local_3.creator));
                        };
                        _local_6++;
                    };
                };
                _local_5++;
            };
        }

        public function get samplesIdsInUse():Array
        {
            var _local_5:int;
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_1:* = null;
            var _local_4:Array = [];
            _local_5 = 0;
            while (_local_5 < _SafeStr_5137.length)
            {
                if (_SafeStr_5137[_local_5] != null)
                {
                    _local_3 = _SafeStr_5137[_local_5];
                    _local_2 = _SafeStr_5142.getValue(_local_3.songId);
                    if (_local_2 != null)
                    {
                        _local_1 = (_local_2.soundObject as TraxSequencer);
                        if (_local_1 != null)
                        {
                            _local_4 = _local_4.concat(_local_1.traxData.getSampleIds());
                        };
                    };
                };
                _local_5++;
            };
            return (_local_4);
        }

        private function sendNextSongRequestMessage(_arg_1:TimerEvent):void
        {
            if (_SafeStr_5145.length < 1)
            {
                return;
            };
            if (_connection == null)
            {
                return;
            };
            _connection.send(new _SafeStr_729(_SafeStr_5145));
            _SafeStr_14.log(("Requested song info's : " + _SafeStr_5145));
            _SafeStr_5145 = [];
        }

        private function onSongInfoMessage(_arg_1:IMessageEvent):void
        {
            var _local_8:int;
            var _local_9:* = null;
            var _local_10:Boolean;
            var _local_4:Boolean;
            var _local_11:* = null;
            var _local_12:* = null;
            var _local_5:int;
            var _local_6:int;
            var _local_3:_SafeStr_984 = (_arg_1 as _SafeStr_984);
            var _local_2:_SafeStr_1080 = (_local_3.getParser() as _SafeStr_1080);
            var _local_7:Array = _local_2.songs;
            _local_8 = 0;
            while (_local_8 < _local_7.length)
            {
                _local_9 = _local_7[_local_8];
                _local_10 = (getSongDataEntry(_local_9.id) == null);
                _local_4 = areSamplesRequested(_local_9.id);
                if (_local_10)
                {
                    _local_11 = null;
                    if (_local_4)
                    {
                        _local_11 = _soundManager.loadTraxSong(_local_9.id, _local_9.data);
                    };
                    _local_12 = new SongDataEntry(_local_9.id, _local_9.length, _local_9.name, _local_9.creator, _local_11);
                    _local_12.songData = _local_9.data;
                    _SafeStr_5142.add(_local_9.id, _local_12);
                    _local_5 = getTopRequestPriority();
                    _local_6 = getSongIdRequestedAtPriority(_local_5);
                    if ((((!(_local_11 == null)) && (_local_11.ready)) && (_local_9.id == _local_6)))
                    {
                        playSongObject(_local_5, _local_6);
                    };
                    _SafeStr_3983.dispatchEvent(new SongInfoReceivedEvent("SIR_TRAX_SONG_INFO_RECEIVED", _local_9.id));
                    while (_SafeStr_5147.indexOf(_local_9.id) != -1)
                    {
                        _SafeStr_5147.splice(_SafeStr_5147.indexOf(_local_9.id), 1);
                        if (_SafeStr_5147.length == 0)
                        {
                            _SafeStr_3983.dispatchEvent(new SongDiskInventoryReceivedEvent("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT"));
                        };
                    };
                    _SafeStr_14.log(("Received song info : " + _local_9.id));
                };
                _local_8++;
            };
        }

        private function playSongObject(_arg_1:int, _arg_2:int):Boolean
        {
            if ((((_arg_2 == -1) || (_arg_1 < 0)) || (_arg_1 >= 4)))
            {
                return (false);
            };
            var _local_6:Boolean;
            if (stopSongAtPriority(_SafeStr_5139))
            {
                _local_6 = true;
            };
            var _local_5:SongDataEntry = getSongDataEntry(_arg_2);
            if (_local_5 == null)
            {
                _SafeStr_14.log((("WARNING: Unable to find song entry id " + _arg_2) + " that was supposed to be loaded."));
                return (false);
            };
            var _local_3:_SafeStr_3135 = _local_5.soundObject;
            if (((_local_3 == null) || (!(_local_3.ready))))
            {
                return (false);
            };
            if (_local_6)
            {
                _SafeStr_14.log(("Waiting previous song to stop before playing song " + _arg_2));
                return (true);
            };
            _local_3.volume = _soundManager.traxVolume;
            var _local_9:* = -1;
            var _local_7:* = 0;
            var _local_4:* = 2;
            var _local_8:* = 1;
            var _local_10:SongStartRequestData = getSongStartRequest(_arg_1);
            if (_local_10 != null)
            {
                _local_9 = _local_10.startPos;
                _local_7 = _local_10.playLength;
                _local_4 = _local_10.fadeInSeconds;
                _local_8 = _local_10.fadeOutSeconds;
            };
            if (_local_9 >= (_local_5.length / 1000))
            {
                return (false);
            };
            if (_local_9 == -1)
            {
                _local_9 = 0;
            };
            _local_3.fadeInSeconds = _local_4;
            _local_3.fadeOutSeconds = _local_8;
            _local_3.position = _local_9;
            _local_3.play(_local_7);
            _SafeStr_5139 = _arg_1;
            _SafeStr_5140 = getSongRequestCountAtPriority(_arg_1);
            _SafeStr_5146 = _arg_2;
            if (_SafeStr_5139 <= 0)
            {
                notifySongPlaying(_local_5);
            };
            if (_arg_1 > 0)
            {
                _SafeStr_3983.dispatchEvent(new NowPlayingEvent("NPE_USER_PLAY_SONG", _arg_1, _local_5.id, -1));
            };
            _SafeStr_14.log(((((((((("Started playing song " + _arg_2) + " at position ") + _local_9) + " for ") + _local_7) + " seconds (length ") + (_local_5.length / 1000)) + ") with priority ") + _arg_1));
            return (true);
        }

        private function notifySongPlaying(_arg_1:SongDataEntry):void
        {
            var _local_2:* = 8000;
            var _local_3:int = getTimer();
            if (((_arg_1.length >= _local_2) && ((!(_SafeStr_5148 == _arg_1.id)) || (_local_3 > (_previousNotificationTime + _local_2)))))
            {
                _soundManager.notifyPlayedSong(_arg_1.name, _arg_1.creator);
                _SafeStr_5148 = _arg_1.id;
                _previousNotificationTime = _local_3;
            };
        }

        private function areSamplesRequested(_arg_1:int):Boolean
        {
            if (_SafeStr_5143.getValue(_arg_1) == null)
            {
                return (false);
            };
            return (_SafeStr_5143.getValue(_arg_1));
        }

        private function onSongDiskInventoryMessage(_arg_1:IMessageEvent):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_3:_SafeStr_1001 = (_arg_1 as _SafeStr_1001);
            var _local_2:_SafeStr_1188 = (_local_3.getParser() as _SafeStr_1188);
            _SafeStr_5144.reset();
            _local_4 = 0;
            while (_local_4 < _local_2.songDiskCount)
            {
                _local_5 = _local_2.getDiskId(_local_4);
                _local_6 = _local_2.getSongId(_local_4);
                _SafeStr_5144.add(_local_5, _local_6);
                if (_SafeStr_5142.getValue(_local_6) == null)
                {
                    _SafeStr_5147.push(_local_6);
                    requestSongInfoWithoutSamples(_local_6);
                };
                _local_4++;
            };
            if (_SafeStr_5147.length == 0)
            {
                _SafeStr_3983.dispatchEvent(new SongDiskInventoryReceivedEvent("SDIR_SONG_DISK_INVENTORY_RECEIVENT_EVENT"));
            };
        }

        private function onSoundMachineInit(_arg_1:Event):void
        {
            disposeRoomPlaylist();
            _SafeStr_5141 = (new SoundMachinePlayListController(_soundManager, this, _SafeStr_3983, _roomEvents, _connection) as _SafeStr_3348);
        }

        private function onSoundMachineDispose(_arg_1:Event):void
        {
            disposeRoomPlaylist();
        }

        private function onJukeboxInit(_arg_1:Event):void
        {
            disposeRoomPlaylist();
            _SafeStr_5141 = (new JukeboxPlayListController(_soundManager, this, _SafeStr_3983, _connection) as _SafeStr_3348);
            _connection.send(new _SafeStr_179());
        }

        private function onJukeboxDispose(_arg_1:Event):void
        {
            disposeRoomPlaylist();
        }

        private function disposeRoomPlaylist():void
        {
            if (_SafeStr_5141 != null)
            {
                _SafeStr_5141.dispose();
                _SafeStr_5141 = null;
            };
        }


    }
}//package com.sulake.habbo.sound.music

// _SafeStr_1001 = "_-AF" (String#22699, DoABC#4)
// _SafeStr_1080 = "_-v13" (String#29615, DoABC#4)
// _SafeStr_1188 = "_-x1u" (String#30196, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1653 = "_-Gq" (String#39649, DoABC#4)
// _SafeStr_179 = "_-5p" (String#31020, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3135 = "_-Je" (String#3060, DoABC#4)
// _SafeStr_3169 = "_-KZ" (String#5121, DoABC#4)
// _SafeStr_3348 = "_-Fw" (String#4529, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_5136 = "_-R1O" (String#10008, DoABC#4)
// _SafeStr_5137 = "_-u1v" (String#5291, DoABC#4)
// _SafeStr_5138 = "_-Zr" (String#7884, DoABC#4)
// _SafeStr_5139 = "_-22X" (String#4162, DoABC#4)
// _SafeStr_5140 = "_-51i" (String#13363, DoABC#4)
// _SafeStr_5141 = "_-sC" (String#5526, DoABC#4)
// _SafeStr_5142 = "_-q1Q" (String#4750, DoABC#4)
// _SafeStr_5143 = "_-T1W" (String#6735, DoABC#4)
// _SafeStr_5144 = "_-f1l" (String#5338, DoABC#4)
// _SafeStr_5145 = "_-8g" (String#6966, DoABC#4)
// _SafeStr_5146 = "_-R1G" (String#10474, DoABC#4)
// _SafeStr_5147 = "_-ZB" (String#7968, DoABC#4)
// _SafeStr_5148 = "_-z1t" (String#19479, DoABC#4)
// _SafeStr_729 = "_-x1Y" (String#29989, DoABC#4)
// _SafeStr_945 = "_-rY" (String#30297, DoABC#4)
// _SafeStr_984 = "_-sb" (String#18031, DoABC#4)


