// by nota

//com.sulake.habbo.sound.trax.TraxSequencer

package com.sulake.habbo.sound.trax
{
    import com.sulake.habbo.sound._SafeStr_3135;
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;
    import flash.events.IEventDispatcher;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.Timer;
    import flash.media.SoundTransform;
    import flash.utils.getTimer;
    import flash.events.SampleDataEvent;
    import flash.utils.ByteArray;
    import flash.events.TimerEvent;
    import com.sulake.habbo.sound.events.SoundCompleteEvent;

    public class TraxSequencer implements _SafeStr_3135, _SafeStr_13 
    {

        private static const SAMPLES_PER_SECOND:Number = 44100;
        private static const BUFFER_LENGTH:uint = 0x2000;
        private static const SAMPLES_BAR_LENGTH:uint = 88000;
        private static const BAR_LENGTH:uint = 88000;
        private static const MIXING_BUFFER:Vector.<int> = new Vector.<int>(0x2000, true);
        private static const INTERPOLATION_BUFFER:Vector.<int> = new Vector.<int>(0x2000, true);

        private var _disposed:Boolean = false;
        private var _SafeStr_3983:IEventDispatcher;
        private var _volume:Number;
        private var _sound:Sound;
        private var _SafeStr_4216:SoundChannel;
        private var _SafeStr_4215:TraxData;
        private var _SafeStr_4221:_SafeStr_24;
        private var _SafeStr_4211:Boolean;
        private var _SafeStr_4222:int;
        private var _SafeStr_4225:int = 0;
        private var _SafeStr_4210:uint;
        private var _SafeStr_4220:Array;
        private var _SafeStr_4218:Boolean;
        private var _SafeStr_4212:Boolean = true;
        private var _SafeStr_4217:uint;
        private var _SafeStr_4224:uint = 30;
        private var _SafeStr_4229:Boolean;
        private var _SafeStr_4227:Boolean;
        private var _SafeStr_4214:int;
        private var _SafeStr_4213:int;
        private var _SafeStr_4230:int;
        private var _SafeStr_4231:int;
        private var _SafeStr_4223:Timer;
        private var _SafeStr_4226:Timer;
        private var _SafeStr_4219:Boolean;
        private var _expectedStreamPosition:int = 0;
        private var _SafeStr_4228:int = 0;

        public function TraxSequencer(_arg_1:int, _arg_2:TraxData, _arg_3:_SafeStr_24, _arg_4:IEventDispatcher)
        {
            _SafeStr_3983 = _arg_4;
            _SafeStr_4222 = _arg_1;
            _volume = 1;
            _sound = new Sound();
            _SafeStr_4216 = null;
            _SafeStr_4221 = _arg_3;
            _SafeStr_4215 = _arg_2;
            _SafeStr_4211 = true;
            _SafeStr_4210 = 0;
            _SafeStr_4220 = [];
            _SafeStr_4218 = false;
            _SafeStr_4217 = 0;
            _SafeStr_4212 = false;
            _SafeStr_4229 = false;
            _SafeStr_4227 = false;
            _SafeStr_4214 = 0;
            _SafeStr_4213 = 0;
            _SafeStr_4230 = 0;
            _SafeStr_4231 = 0;
        }

        public function set position(_arg_1:Number):void
        {
            _SafeStr_4210 = (_arg_1 * 44100);
        }

        public function get volume():Number
        {
            return (_volume);
        }

        public function get position():Number
        {
            return (_SafeStr_4210 / 44100);
        }

        public function get ready():Boolean
        {
            return (_SafeStr_4211);
        }

        public function set ready(_arg_1:Boolean):void
        {
            _SafeStr_4211 = _arg_1;
        }

        public function get finished():Boolean
        {
            return (_SafeStr_4212);
        }

        public function get fadeOutSeconds():Number
        {
            return (_SafeStr_4213 / 44100);
        }

        public function set fadeOutSeconds(_arg_1:Number):void
        {
            _SafeStr_4213 = (_arg_1 * 44100);
        }

        public function get fadeInSeconds():Number
        {
            return (_SafeStr_4214 / 44100);
        }

        public function set fadeInSeconds(_arg_1:Number):void
        {
            _SafeStr_4214 = (_arg_1 * 44100);
        }

        public function get traxData():TraxData
        {
            return (_SafeStr_4215);
        }

        public function set volume(_arg_1:Number):void
        {
            _volume = _arg_1;
            if (_SafeStr_4216 != null)
            {
                _SafeStr_4216.soundTransform = new SoundTransform(_volume);
            };
        }

        public function get length():Number
        {
            return (_SafeStr_4217 / 44100);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                stopImmediately();
                _SafeStr_4215 = null;
                _SafeStr_4221 = null;
                _SafeStr_4220 = null;
                _SafeStr_3983 = null;
                _sound = null;
                _disposed = true;
            };
        }

        public function prepare():Boolean
        {
            if (!_SafeStr_4211)
            {
                _SafeStr_14.log("Cannot start trax playback until samples ready!");
                return (false);
            };
            if (!_SafeStr_4218)
            {
                if (_SafeStr_4215 != null)
                {
                    _SafeStr_4219 = false;
                    if (_SafeStr_4215.hasMetaData)
                    {
                        _SafeStr_4219 = _SafeStr_4215.metaCutMode;
                    };
                    if (_SafeStr_4219)
                    {
                        if (!prepareSequence())
                        {
                            _SafeStr_14.log("Cannot start playback, prepare sequence failed!");
                            return (false);
                        };
                    }
                    else
                    {
                        if (!prepareLegacySequence())
                        {
                            _SafeStr_14.log("Cannot start playback, prepare legacy sequence failed!");
                            return (false);
                        };
                    };
                };
            };
            return (true);
        }

        private function prepareLegacySequence():Boolean
        {
            var _local_8:int;
            var _local_3:* = null;
            var _local_7:* = null;
            var _local_4:uint;
            var _local_2:uint;
            var _local_9:int;
            var _local_5:int;
            var _local_12:* = null;
            var _local_11:int;
            var _local_6:int;
            var _local_10:int;
            if (_SafeStr_4220 == null)
            {
                return (false);
            };
            var _local_1:uint = getTimer();
            _local_8 = 0;
            while (_local_8 < _SafeStr_4215.channels.length)
            {
                _local_3 = new _SafeStr_24();
                _local_7 = (_SafeStr_4215.channels[_local_8] as TraxChannel);
                _local_4 = 0;
                _local_2 = 0;
                _local_9 = 0;
                while (_local_9 < _local_7.itemCount)
                {
                    _local_5 = _local_7.getItem(_local_9).id;
                    _local_12 = (_SafeStr_4221.getValue(_local_5) as TraxSample);
                    _local_12.setUsageFromSong(_SafeStr_4222, _local_1);
                    if (_local_12 != null)
                    {
                        _local_11 = getSampleBars(_local_12.length);
                        _local_6 = int((_local_7.getItem(_local_9).length / _local_11));
                        _local_10 = 0;
                        while (_local_10 < _local_6)
                        {
                            if (_local_5 != 0)
                            {
                                _local_3.add(_local_4, _local_12);
                            };
                            _local_2 = (_local_2 + _local_11);
                            _local_4 = (_local_2 * 88000);
                            _local_10++;
                        };
                    }
                    else
                    {
                        _SafeStr_14.log("Error in prepareLegacySequence(), sample was null!");
                        return (false);
                    };
                    if (_SafeStr_4217 < _local_4)
                    {
                        _SafeStr_4217 = _local_4;
                    };
                    _local_9++;
                };
                _SafeStr_4220.push(_local_3);
                _local_8++;
            };
            _SafeStr_4218 = true;
            return (true);
        }

        private function prepareSequence():Boolean
        {
            var _local_6:int;
            var _local_12:* = null;
            var _local_5:* = null;
            var _local_2:uint;
            var _local_11:uint;
            var _local_13:Boolean;
            var _local_7:int;
            var _local_4:int;
            var _local_9:* = null;
            var _local_3:int;
            var _local_14:int;
            var _local_8:int;
            var _local_1:int;
            if (_SafeStr_4220 == null)
            {
                return (false);
            };
            var _local_10:uint = getTimer();
            _local_6 = 0;
            while (_local_6 < _SafeStr_4215.channels.length)
            {
                _local_12 = new _SafeStr_24();
                _local_5 = (_SafeStr_4215.channels[_local_6] as TraxChannel);
                _local_2 = 0;
                _local_11 = 0;
                _local_13 = false;
                _local_7 = 0;
                while (_local_7 < _local_5.itemCount)
                {
                    _local_4 = _local_5.getItem(_local_7).id;
                    _local_9 = (_SafeStr_4221.getValue(_local_4) as TraxSample);
                    _local_9.setUsageFromSong(_SafeStr_4222, _local_10);
                    if (_local_9 != null)
                    {
                        _local_3 = _local_11;
                        _local_14 = _local_2;
                        _local_8 = getSampleBars(_local_9.length);
                        _local_1 = _local_5.getItem(_local_7).length;
                        while (_local_3 < (_local_11 + _local_1))
                        {
                            if (((!(_local_4 == 0)) || (_local_13)))
                            {
                                _local_12.add(_local_14, _local_9);
                                _local_13 = false;
                            };
                            _local_3 = (_local_3 + _local_8);
                            _local_14 = (_local_3 * 88000);
                            if (_local_3 > (_local_11 + _local_1))
                            {
                                _local_13 = true;
                            };
                        };
                        _local_11 = (_local_11 + _local_5.getItem(_local_7).length);
                        _local_2 = (_local_11 * 88000);
                    }
                    else
                    {
                        _SafeStr_14.log("Error in prepareSequence(), sample was null!");
                        return (false);
                    };
                    if (_SafeStr_4217 < _local_2)
                    {
                        _SafeStr_4217 = _local_2;
                    };
                    _local_7++;
                };
                _SafeStr_4220.push(_local_12);
                _local_6++;
            };
            _SafeStr_4218 = true;
            return (true);
        }

        public function play(_arg_1:Number=0):Boolean
        {
            if (!prepare())
            {
                return (false);
            };
            removeFadeoutStopTimer();
            if (_SafeStr_4216 != null)
            {
                stopImmediately();
            };
            if (_SafeStr_4214 > 0)
            {
                _SafeStr_4229 = true;
                _SafeStr_4230 = 0;
            };
            _SafeStr_4227 = false;
            _SafeStr_4231 = 0;
            _SafeStr_4212 = false;
            _sound.addEventListener("sampleData", onSampleData);
            _SafeStr_4225 = (_arg_1 * 44100);
            _expectedStreamPosition = 0;
            _SafeStr_4228 = 0;
            _SafeStr_4216 = _sound.play();
            volume = _volume;
            return (true);
        }

        public function render(_arg_1:SampleDataEvent):Boolean
        {
            if (!prepare())
            {
                return (false);
            };
            while (!(_SafeStr_4212))
            {
                onSampleData(_arg_1);
            };
            return (true);
        }

        public function stop():Boolean
        {
            if (((_SafeStr_4213 > 0) && (!(_SafeStr_4212))))
            {
                stopWithFadeout();
            }
            else
            {
                playingComplete();
            };
            return (true);
        }

        private function stopImmediately():void
        {
            removeStopTimer();
            if (_SafeStr_4216 != null)
            {
                _SafeStr_4216.stop();
                _SafeStr_4216 = null;
            };
            if (_sound != null)
            {
                _sound.removeEventListener("sampleData", onSampleData);
            };
        }

        private function stopWithFadeout():void
        {
            if (_SafeStr_4223 == null)
            {
                _SafeStr_4227 = true;
                _SafeStr_4231 = 0;
                _SafeStr_4223 = new Timer((_SafeStr_4224 + (_SafeStr_4213 / (44100 / 1000))), 1);
                _SafeStr_4223.start();
                _SafeStr_4223.addEventListener("timerComplete", onFadeOutComplete);
            };
        }

        private function getSampleBars(_arg_1:uint):int
        {
            if (_SafeStr_4219)
            {
                return (Math.round((_arg_1 / 88000)));
            };
            return (Math.ceil((_arg_1 / 88000)));
        }

        private function getChannelSequenceOffsets():Array
        {
            var _local_1:int;
            var _local_3:int;
            var _local_5:* = null;
            var _local_4:int;
            var _local_2:Array = [];
            if (_SafeStr_4220 != null)
            {
                _local_1 = _SafeStr_4220.length;
                _local_3 = 0;
                while (_local_3 < _local_1)
                {
                    _local_5 = _SafeStr_4220[_local_3];
                    _local_4 = 0;
                    while (((_local_4 < _local_5.length) && (_local_5.getKey(_local_4) < _SafeStr_4210)))
                    {
                        _local_4++;
                    };
                    _local_2.push((_local_4 - 1));
                    _local_3++;
                };
            };
            return (_local_2);
        }

        private function mixChannelsIntoBuffer():void
        {
            var _local_6:int;
            var _local_7:* = null;
            var _local_14:int;
            var _local_8:* = null;
            var _local_2:int;
            var _local_5:int;
            var _local_13:int;
            var _local_11:int;
            var _local_3:int;
            var _local_10:int;
            var _local_9:int;
            if (_SafeStr_4220 == null)
            {
                return;
            };
            var _local_4:Array = getChannelSequenceOffsets();
            var _local_1:int = _SafeStr_4220.length;
            var _local_12:TraxChannelSample;
            _local_6 = (_local_1 - 1);
            while (_local_6 >= 0)
            {
                _local_7 = _SafeStr_4220[_local_6];
                _local_14 = _local_4[_local_6];
                _local_8 = _local_7.getWithIndex(_local_14);
                if (_local_8 == null)
                {
                    _local_12 = null;
                }
                else
                {
                    _local_2 = _local_7.getKey(_local_14);
                    _local_5 = (_SafeStr_4210 - _local_2);
                    if (((_local_8.id == 0) || (_local_5 < 0)))
                    {
                        _local_12 = null;
                    }
                    else
                    {
                        _local_12 = new TraxChannelSample(_local_8, _local_5);
                    };
                };
                _local_13 = 0x2000;
                if ((_SafeStr_4217 - _SafeStr_4210) < _local_13)
                {
                    _local_13 = (_SafeStr_4217 - _SafeStr_4210);
                };
                _local_11 = 0;
                while (_local_11 < _local_13)
                {
                    _local_3 = _local_13;
                    if (_local_14 < (_local_7.length - 1))
                    {
                        _local_10 = _local_7.getKey((_local_14 + 1));
                        if ((_local_13 + _SafeStr_4210) >= _local_10)
                        {
                            _local_3 = (_local_10 - _SafeStr_4210);
                        };
                    };
                    if (_local_3 > (_local_13 - _local_11))
                    {
                        _local_3 = (_local_13 - _local_11);
                    };
                    if (_local_6 == (_local_1 - 1))
                    {
                        if (_local_12 != null)
                        {
                            _local_12.setSample(MIXING_BUFFER, _local_11, _local_3);
                            _local_11 = (_local_11 + _local_3);
                        }
                        else
                        {
                            _local_9 = 0;
                            while (_local_9 < _local_3)
                            {
                                MIXING_BUFFER[_local_11++] = 0;
                                _local_9++;
                            };
                        };
                    }
                    else
                    {
                        if (_local_12 != null)
                        {
                            _local_12.addSample(MIXING_BUFFER, _local_11, _local_3);
                        };
                        _local_11 = (_local_11 + _local_3);
                    };
                    if (_local_11 < _local_13)
                    {
                        _local_8 = _local_7.getWithIndex(++_local_14);
                        if (((_local_8 == null) || (_local_8.id == 0)))
                        {
                            _local_12 = null;
                        }
                        else
                        {
                            _local_12 = new TraxChannelSample(_local_8, 0);
                        };
                    };
                };
                _local_6--;
            };
        }

        private function checkSongFinishing():void
        {
            var _local_1:int = ((_SafeStr_4217 < _SafeStr_4225) ? _SafeStr_4217 : ((_SafeStr_4225 > 0) ? _SafeStr_4225 : _SafeStr_4217));
            if (((_SafeStr_4210 > (_local_1 + (_SafeStr_4224 * (44100 / 1000)))) && (!(_SafeStr_4212))))
            {
                _SafeStr_4212 = true;
                if (_SafeStr_4226 != null)
                {
                    _SafeStr_4226.reset();
                    _SafeStr_4226.removeEventListener("timerComplete", onPlayingComplete);
                };
                _SafeStr_4226 = new Timer(2, 1);
                _SafeStr_4226.start();
                _SafeStr_4226.addEventListener("timerComplete", onPlayingComplete);
            }
            else
            {
                if (((_SafeStr_4210 > (_local_1 - _SafeStr_4213)) && (!(_SafeStr_4227))))
                {
                    _SafeStr_4229 = false;
                    _SafeStr_4227 = true;
                    _SafeStr_4231 = 0;
                };
            };
        }

        private function onSampleData(_arg_1:SampleDataEvent):void
        {
            if (_arg_1.position > _expectedStreamPosition)
            {
                _SafeStr_4228++;
                _SafeStr_14.log("Audio buffer under run...");
                _expectedStreamPosition = _arg_1.position;
            };
            if (volume > 0)
            {
                mixChannelsIntoBuffer();
            };
            var _local_2:* = 0x2000;
            if ((_SafeStr_4217 - _SafeStr_4210) < _local_2)
            {
                _local_2 = (_SafeStr_4217 - _SafeStr_4210);
                if (_local_2 < 0)
                {
                    _local_2 = 0;
                };
            };
            if (volume <= 0)
            {
                _local_2 = 0;
            };
            writeAudioToOutputStream(_arg_1.data, _local_2);
            _SafeStr_4210 = (_SafeStr_4210 + 0x2000);
            _expectedStreamPosition = (_expectedStreamPosition + 0x2000);
            if (_SafeStr_4216 != null)
            {
                _SafeStr_4224 = (((_arg_1.position / 44100) * 1000) - _SafeStr_4216.position);
            };
            checkSongFinishing();
        }

        private function writeAudioToOutputStream(_arg_1:ByteArray, _arg_2:int):void
        {
            var _local_3:Number;
            var _local_4:Number;
            var _local_6:int;
            if (_arg_2 > 0)
            {
                if (((!(_SafeStr_4229)) && (!(_SafeStr_4227))))
                {
                    writeMixingBufferToOutputStream(_arg_1, _arg_2);
                }
                else
                {
                    if (_SafeStr_4229)
                    {
                        _local_3 = (1 / _SafeStr_4214);
                        _local_4 = (_SafeStr_4230 / _SafeStr_4214);
                        _SafeStr_4230 = (_SafeStr_4230 + 0x2000);
                        if (_SafeStr_4230 > _SafeStr_4214)
                        {
                            _SafeStr_4229 = false;
                        };
                    }
                    else
                    {
                        if (_SafeStr_4227)
                        {
                            _local_3 = (-1 / _SafeStr_4213);
                            _local_4 = (1 - (_SafeStr_4231 / _SafeStr_4213));
                            _SafeStr_4231 = (_SafeStr_4231 + 0x2000);
                            if (_SafeStr_4231 > _SafeStr_4213)
                            {
                                _SafeStr_4231 = _SafeStr_4213;
                            };
                        };
                    };
                    writeMixingBufferToOutputStreamWithFade(_arg_1, _arg_2, _local_4, _local_3);
                };
            };
            var _local_5:* = 0;
            _local_6 = _arg_2;
            while (_local_6 < 0x2000)
            {
                _arg_1.writeFloat(_local_5);
                _arg_1.writeFloat(_local_5);
                _local_6++;
            };
        }

        private function writeMixingBufferToOutputStream(_arg_1:ByteArray, _arg_2:int):void
        {
            var _local_3:int;
            var _local_4:* = 0;
            _local_3 = 0;
            while (_local_3 < _arg_2)
            {
                _local_4 = (MIXING_BUFFER[_local_3] * 3.0517578125E-5);
                _arg_1.writeFloat(_local_4);
                _arg_1.writeFloat(_local_4);
                _local_3++;
            };
        }

        private function writeMixingBufferToOutputStreamWithFade(_arg_1:ByteArray, _arg_2:int, _arg_3:Number, _arg_4:Number):void
        {
            var _local_6:* = 0;
            var _local_5:int;
            _local_5 = 0;
            while (_local_5 < _arg_2)
            {
                if (((_arg_3 < 0) || (_arg_3 > 1))) break;
                _local_6 = ((MIXING_BUFFER[_local_5] * 3.0517578125E-5) * _arg_3);
                _arg_3 = (_arg_3 + _arg_4);
                _arg_1.writeFloat(_local_6);
                _arg_1.writeFloat(_local_6);
                _local_5++;
            };
            if (_arg_3 < 0)
            {
                while (_local_5 < _arg_2)
                {
                    _arg_1.writeFloat(0);
                    _arg_1.writeFloat(0);
                    _local_5++;
                };
            }
            else
            {
                if (_arg_3 > 1)
                {
                    while (_local_5 < _arg_2)
                    {
                        _local_6 = (MIXING_BUFFER[_local_5] * 3.0517578125E-5);
                        _arg_3 = (_arg_3 + _arg_4);
                        _arg_1.writeFloat(_local_6);
                        _arg_1.writeFloat(_local_6);
                        _local_5++;
                    };
                };
            };
        }

        private function onPlayingComplete(_arg_1:TimerEvent):void
        {
            if (_SafeStr_4212)
            {
                playingComplete();
            };
        }

        private function onFadeOutComplete(_arg_1:TimerEvent):void
        {
            removeFadeoutStopTimer();
            playingComplete();
        }

        private function playingComplete():void
        {
            stopImmediately();
            _SafeStr_3983.dispatchEvent(new SoundCompleteEvent("SCE_TRAX_SONG_COMPLETE", _SafeStr_4222));
        }

        private function removeFadeoutStopTimer():void
        {
            if (_SafeStr_4223 != null)
            {
                _SafeStr_4223.removeEventListener("timerComplete", onFadeOutComplete);
                _SafeStr_4223.reset();
                _SafeStr_4223 = null;
            };
        }

        private function removeStopTimer():void
        {
            if (_SafeStr_4226 != null)
            {
                _SafeStr_4226.reset();
                _SafeStr_4226.removeEventListener("timerComplete", onPlayingComplete);
                _SafeStr_4226 = null;
            };
        }


    }
}//package com.sulake.habbo.sound.trax

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3135 = "_-Je" (String#3060, DoABC#4)
// _SafeStr_3983 = "_-OX" (String#641, DoABC#4)
// _SafeStr_4210 = "_-al" (String#4011, DoABC#4)
// _SafeStr_4211 = "_-pm" (String#4979, DoABC#4)
// _SafeStr_4212 = "_-JY" (String#6466, DoABC#4)
// _SafeStr_4213 = "_-DF" (String#5669, DoABC#4)
// _SafeStr_4214 = "_-LK" (String#7056, DoABC#4)
// _SafeStr_4215 = "_-o1K" (String#5557, DoABC#4)
// _SafeStr_4216 = "_-FD" (String#3025, DoABC#4)
// _SafeStr_4217 = "_-C1Q" (String#4407, DoABC#4)
// _SafeStr_4218 = "_-dh" (String#10142, DoABC#4)
// _SafeStr_4219 = "_-Tx" (String#11319, DoABC#4)
// _SafeStr_4220 = "_-db" (String#5049, DoABC#4)
// _SafeStr_4221 = "_-yu" (String#11364, DoABC#4)
// _SafeStr_4222 = "_-Tb" (String#2462, DoABC#4)
// _SafeStr_4223 = "_-zx" (String#6716, DoABC#4)
// _SafeStr_4224 = "_-51t" (String#14626, DoABC#4)
// _SafeStr_4225 = "_-C1S" (String#12469, DoABC#4)
// _SafeStr_4226 = "_-hj" (String#5608, DoABC#4)
// _SafeStr_4227 = "_-tS" (String#6053, DoABC#4)
// _SafeStr_4228 = "_-11C" (String#13798, DoABC#4)
// _SafeStr_4229 = "_-I1" (String#7025, DoABC#4)
// _SafeStr_4230 = "_-mg" (String#7645, DoABC#4)
// _SafeStr_4231 = "_-216" (String#4611, DoABC#4)


