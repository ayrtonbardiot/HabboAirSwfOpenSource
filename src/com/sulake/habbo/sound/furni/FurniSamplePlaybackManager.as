// by nota

//com.sulake.habbo.sound.furni.FurniSamplePlaybackManager

package com.sulake.habbo.sound.furni
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.sound.HabboSoundManagerFlash10;
    import flash.events.IEventDispatcher;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.sound.HabboSoundWithPitch;
    import com.sulake.habbo.room.events.RoomEngineObjectSamplePlaybackEvent;
    import flash.net.URLRequest;
    import flash.media.Sound;
    import flash.events.Event;
    import flash.events.IOErrorEvent;

    public class FurniSamplePlaybackManager implements _SafeStr_13 
    {

        private var _soundManager:HabboSoundManagerFlash10;
        private var _roomEvents:IEventDispatcher;
        private var _disposed:Boolean = false;
        private var _SafeStr_4755:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4408:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4753:_SafeStr_24 = new _SafeStr_24();
        private var _loadingSamples2:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4754:_SafeStr_24 = new _SafeStr_24();
        private var _volume:Number = 1;

        public function FurniSamplePlaybackManager(_arg_1:HabboSoundManagerFlash10, _arg_2:IEventDispatcher)
        {
            _soundManager = _arg_1;
            _roomEvents = _arg_2;
            _roomEvents.addEventListener("REOSPE_ROOM_OBJECT_INITIALIZED", onRoomObjectInitializedEvent);
            _roomEvents.addEventListener("REOSPE_ROOM_OBJECT_DISPOSED", onRoomObjectDisposedEvent);
            _roomEvents.addEventListener("REOSPE_PLAY_SAMPLE", onRoomObjectPlaySampleEvent);
            _roomEvents.addEventListener("REOSPE_CHANGE_PITCH", onRoomObjectChangeSamplePitchEvent);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_roomEvents)
                {
                    _roomEvents.removeEventListener("REOSPE_ROOM_OBJECT_INITIALIZED", onRoomObjectInitializedEvent);
                    _roomEvents.removeEventListener("REOSPE_ROOM_OBJECT_DISPOSED", onRoomObjectDisposedEvent);
                    _roomEvents.removeEventListener("REOSPE_PLAY_SAMPLE", onRoomObjectPlaySampleEvent);
                    _roomEvents.removeEventListener("REOSPE_CHANGE_PITCH", onRoomObjectChangeSamplePitchEvent);
                    _roomEvents = null;
                };
                if (_SafeStr_4408)
                {
                    _SafeStr_4408.dispose();
                    _SafeStr_4408 = null;
                };
                if (_SafeStr_4753)
                {
                    _SafeStr_4753.dispose();
                    _SafeStr_4753 = null;
                };
                if (_loadingSamples2)
                {
                    _loadingSamples2.dispose();
                    _loadingSamples2 = null;
                };
                if (_SafeStr_4754)
                {
                    _SafeStr_4754.dispose();
                    _SafeStr_4754 = null;
                };
                if (_SafeStr_4755)
                {
                    _SafeStr_4755.dispose();
                    _SafeStr_4755 = null;
                };
                _soundManager = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function updateVolume(_arg_1:Number):void
        {
            _volume = _arg_1;
            for each (var _local_2:HabboSoundWithPitch in _SafeStr_4408.getValues())
            {
                _local_2.volume = _volume;
            };
        }

        private function onRoomObjectInitializedEvent(_arg_1:RoomEngineObjectSamplePlaybackEvent):void
        {
            if (_arg_1.sampleId != -1)
            {
                addSampleForFurni(_arg_1.objectId, _arg_1.sampleId);
                if (_SafeStr_4754.hasKey(_arg_1.objectId))
                {
                    _SafeStr_4754.remove(_arg_1.objectId);
                };
                _SafeStr_4754.add(_arg_1.objectId, _arg_1.pitch);
            };
        }

        private function onRoomObjectDisposedEvent(_arg_1:RoomEngineObjectSamplePlaybackEvent):void
        {
            removeSampleForFurni(_arg_1.objectId);
        }

        private function onRoomObjectPlaySampleEvent(_arg_1:RoomEngineObjectSamplePlaybackEvent):void
        {
            if (_SafeStr_4408.getValue(_arg_1.objectId) != null)
            {
                playSample(_arg_1.objectId);
            };
        }

        private function onRoomObjectChangeSamplePitchEvent(_arg_1:RoomEngineObjectSamplePlaybackEvent):void
        {
            if (_SafeStr_4408.getValue(_arg_1.objectId) != null)
            {
                changeSamplePitch(_arg_1.objectId, _arg_1.pitch);
            };
        }

        private function addSampleForFurni(_arg_1:int, _arg_2:int):void
        {
            if (((_SafeStr_4408.getValue(_arg_1) == null) && (_SafeStr_4753.getValues().indexOf(_arg_2) == -1)))
            {
                loadSample(_arg_2, _arg_1);
            };
        }

        private function removeSampleForFurni(_arg_1:int):void
        {
            var _local_3:HabboSoundWithPitch = _SafeStr_4408.remove(_arg_1);
            var _local_2:int = _SafeStr_4755.remove(_arg_1);
            if (((!(_local_3 == null)) && (canDisposeSound(_local_2))))
            {
                _soundManager.removeUpdateReceiver(_local_3);
                _local_3.dispose();
            };
        }

        private function canDisposeSound(_arg_1:int):Boolean
        {
            for each (var _local_2:int in _SafeStr_4755.getKeys())
            {
                if (_SafeStr_4755.getValue(_local_2) == _arg_1)
                {
                    return (false);
                };
            };
            return (true);
        }

        private function playSample(_arg_1:int):void
        {
            var _local_2:HabboSoundWithPitch = _SafeStr_4408.getValue(_arg_1);
            if (_local_2 != null)
            {
                _local_2.stop();
                _local_2.play();
            };
        }

        private function changeSamplePitch(_arg_1:int, _arg_2:Number):void
        {
            var _local_3:HabboSoundWithPitch = _SafeStr_4408.getValue(_arg_1);
            if (_local_3 != null)
            {
                _local_3.setPitch(_arg_2);
            };
        }

        private function loadSample(_arg_1:int, _arg_2:int):void
        {
            var _local_4:int = findLoadedObjectIdBySampleId(_arg_1);
            _SafeStr_4755.add(_arg_2, _arg_1);
            if (_local_4 != -1)
            {
                loadSampleForAllFurni(_arg_1, _SafeStr_4408.getValue(_local_4));
                return;
            };
            var _local_6:String = _soundManager.getProperty("flash.dynamic.download.url");
            _local_6 = (_local_6 + _soundManager.getProperty("flash.dynamic.download.samples.template"));
            _local_6 = _local_6.replace(/%typeid%/, _arg_1.toString());
            var _local_3:URLRequest = new URLRequest(_local_6);
            var _local_5:Sound = new Sound();
            _local_5.addEventListener("complete", onSampleLoadComplete);
            _local_5.addEventListener("ioError", ioErrorHandler);
            _local_5.load(_local_3);
            _SafeStr_4753.add(_local_5, _arg_2);
            _loadingSamples2.add(_local_5, _arg_1);
        }

        private function loadSampleForAllFurni(_arg_1:int, _arg_2:HabboSoundWithPitch):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            for each (var _local_3:int in _SafeStr_4755.getKeys())
            {
                if (_SafeStr_4755.getValue(_local_3) == _arg_1)
                {
                    _SafeStr_4408.add(_local_3, _arg_2);
                };
            };
        }

        private function findLoadedObjectIdBySampleId(_arg_1:int):int
        {
            for each (var _local_2:int in _SafeStr_4755.getKeys())
            {
                if (_SafeStr_4755.getValue(_local_2) == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (-1);
        }

        private function onSampleLoadComplete(_arg_1:Event):void
        {
            if (disposed)
            {
                return;
            };
            var _local_5:Sound = (_arg_1.target as Sound);
            if (((_local_5 == null) || (_SafeStr_4753.getValue(_local_5) == null)))
            {
                return;
            };
            var _local_3:int = _SafeStr_4753.getValue(_local_5);
            var _local_4:int = _loadingSamples2.getValue(_local_5);
            var _local_2:HabboSoundWithPitch = new HabboSoundWithPitch(_local_5, _SafeStr_4754.getValue(_local_3));
            _soundManager.registerUpdateReceiver(_local_2, 0);
            _local_2.volume = _volume;
            _SafeStr_4408.add(_local_3, _local_2);
            loadSampleForAllFurni(_local_4, _local_2);
            _SafeStr_4753.remove(_local_5);
            _loadingSamples2.remove(_local_5);
        }

        private function ioErrorHandler(_arg_1:IOErrorEvent):void
        {
            _SafeStr_14.log(((("Error loading sound " + _arg_1.target) + " text ") + _arg_1.text));
        }


    }
}//package com.sulake.habbo.sound.furni

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_4408 = "_-aq" (String#2263, DoABC#4)
// _SafeStr_4753 = "_-N1u" (String#3473, DoABC#4)
// _SafeStr_4754 = "_-S19" (String#6813, DoABC#4)
// _SafeStr_4755 = "_-eF" (String#5081, DoABC#4)


