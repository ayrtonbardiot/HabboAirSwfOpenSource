// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.sound.music.SongStartRequestData

package com.sulake.habbo.sound.music
{
    import flash.utils.getTimer;

    public class SongStartRequestData 
    {

        private var _SafeStr_4222:int;
        private var _SafeStr_5822:Number;
        private var _playLength:Number;
        private var _playRequestTime:int;
        private var _SafeStr_5823:Number;
        private var _SafeStr_5824:Number;

        public function SongStartRequestData(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number=2, _arg_5:Number=1)
        {
            _SafeStr_4222 = _arg_1;
            _SafeStr_5822 = _arg_2;
            _playLength = _arg_3;
            _SafeStr_5823 = _arg_4;
            _SafeStr_5824 = _arg_5;
            _playRequestTime = getTimer();
        }

        public function get songId():int
        {
            return (_SafeStr_4222);
        }

        public function get startPos():Number
        {
            if (_SafeStr_5822 < 0)
            {
                return (0);
            };
            return (_SafeStr_5822 + ((getTimer() - _playRequestTime) / 1000));
        }

        public function get playLength():Number
        {
            return (_playLength);
        }

        public function get fadeInSeconds():Number
        {
            return (_SafeStr_5823);
        }

        public function get fadeOutSeconds():Number
        {
            return (_SafeStr_5824);
        }


    }
}//package com.sulake.habbo.sound.music

// _SafeStr_4222 = "_-Tb" (String#2462, DoABC#4)
// _SafeStr_5822 = "_-B1M" (String#15283, DoABC#4)
// _SafeStr_5823 = "_-t1Y" (String#18678, DoABC#4)
// _SafeStr_5824 = "_-wr" (String#18594, DoABC#4)


