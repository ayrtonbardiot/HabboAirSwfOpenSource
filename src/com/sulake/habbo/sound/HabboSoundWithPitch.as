// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.HabboSoundWithPitch

package com.sulake.habbo.sound
{
    import com.sulake.core.runtime._SafeStr_41;
    import flash.media.Sound;
    import flash.utils.ByteArray;
    import flash.media.SoundTransform;

    public class HabboSoundWithPitch extends HabboSoundBase implements _SafeStr_41 
    {

        private const SILENCE_MS:uint = 50;
        private const FADEIN_MS:uint = 175;

        private var _SafeStr_4407:Number;
        private var _SafeStr_4410:Sound;
        private var _SafeStr_4408:ByteArray;
        private var _SafeStr_4413:int;
        private var _SafeStr_4409:uint = 0;
        private var _SafeStr_4411:uint = 0;
        private var _SafeStr_4412:Boolean = false;

        public function HabboSoundWithPitch(_arg_1:Sound, _arg_2:Number=1)
        {
            super(_arg_1);
            _SafeStr_4407 = _arg_2;
            _SafeStr_4410 = new Sound();
            extractMonoSamples();
            setPitch(_SafeStr_4407);
        }

        override public function dispose():void
        {
            super.dispose();
            _SafeStr_4410 = null;
            if (_SafeStr_4408 != null)
            {
                _SafeStr_4408.clear();
                _SafeStr_4408 = null;
            };
        }

        override public function play(_arg_1:Number=0):Boolean
        {
            stop();
            _SafeStr_4411 = _SafeStr_4409;
            _SafeStr_4412 = false;
            setComplete(false);
            setSoundChannel(_SafeStr_4410.play(0, 0, new SoundTransform(0)));
            return (true);
        }

        override public function stop():Boolean
        {
            if (getSoundChannel() != null)
            {
                getSoundChannel().stop();
            };
            return (true);
        }

        public function update(_arg_1:uint):void
        {
            _SafeStr_4409 = (_SafeStr_4409 + _arg_1);
            var _local_2:uint = (_SafeStr_4409 - _SafeStr_4411);
            if (((_SafeStr_4411 > 0) && (_local_2 < 50)))
            {
                setChannelVolume(0);
            }
            else
            {
                if ((((_SafeStr_4411 > 0) && (_local_2 >= 50)) && (_local_2 < 175)))
                {
                    setChannelVolume((volume * (_local_2 / 175)));
                }
                else
                {
                    if (!_SafeStr_4412)
                    {
                        setChannelVolume(volume);
                        _SafeStr_4412 = true;
                    };
                };
            };
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4408 == null);
        }

        public function setPitch(_arg_1:Number):void
        {
            var _local_5:Number;
            var _local_4:int;
            _SafeStr_4407 = _arg_1;
            var _local_6:ByteArray = new ByteArray();
            var _local_3:uint = uint(((_SafeStr_4408.length / 4) * _SafeStr_4407));
            var _local_2:* = 0;
            _local_4 = 0;
            while (((_local_4 < _local_3) && ((_local_2 * 4) < _SafeStr_4408.length)))
            {
                _SafeStr_4408.position = (_local_2 * 4);
                _local_5 = _SafeStr_4408.readFloat();
                _local_6.writeFloat(_local_5);
                _local_6.writeFloat(_local_5);
                _local_2 = (_local_2 + _SafeStr_4407);
                _local_4++;
            };
            _local_6.position = 0;
            _SafeStr_4410.loadPCMFromByteArray(_local_6, (_local_6.length / 8), "float");
        }

        private function extractMonoSamples():void
        {
            var _local_2:int;
            var _local_3:Number;
            var _local_1:ByteArray = new ByteArray();
            _soundObject.extract(_local_1, (_soundObject.length * 44.1), 0);
            _SafeStr_4408 = new ByteArray();
            _SafeStr_4413 = (_local_1.length / 8);
            _local_1.position = 0;
            _local_2 = 0;
            while (_local_2 < _SafeStr_4413)
            {
                _local_3 = _local_1.readFloat();
                _local_1.readFloat();
                _SafeStr_4408.writeFloat(_local_3);
                _local_2++;
            };
        }


    }
}//package com.sulake.habbo.sound

// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4407 = "_-E1T" (String#3270, DoABC#4)
// _SafeStr_4408 = "_-aq" (String#2263, DoABC#4)
// _SafeStr_4409 = "_-5l" (String#12924, DoABC#4)
// _SafeStr_4410 = "_-Gg" (String#11050, DoABC#4)
// _SafeStr_4411 = "_-XS" (String#12440, DoABC#4)
// _SafeStr_4412 = "_-Ar" (String#13160, DoABC#4)
// _SafeStr_4413 = "_-SI" (String#18723, DoABC#4)


