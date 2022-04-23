// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerStatsData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2PlayerStatsData 
    {

        private var _SafeStr_5367:int;
        private var _SafeStr_8414:int;
        private var _SafeStr_8415:int;
        private var _SafeStr_8416:int;
        private var _SafeStr_8417:int;
        private var _SafeStr_8418:int;
        private var _SafeStr_8419:int;
        private var _SafeStr_8420:int;
        private var _SafeStr_8421:int;
        private var _SafeStr_8422:int;

        public function Game2PlayerStatsData(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_5367 = _arg_1.readInteger();
            _SafeStr_8414 = _arg_1.readInteger();
            _SafeStr_8415 = _arg_1.readInteger();
            _SafeStr_8416 = _arg_1.readInteger();
            _SafeStr_8417 = _arg_1.readInteger();
            _SafeStr_8418 = _arg_1.readInteger();
            _SafeStr_8419 = _arg_1.readInteger();
            _SafeStr_8420 = _arg_1.readInteger();
            _SafeStr_8421 = _arg_1.readInteger();
            _SafeStr_8422 = _arg_1.readInteger();
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }

        public function get kills():int
        {
            return (_SafeStr_8414);
        }

        public function get deaths():int
        {
            return (_SafeStr_8415);
        }

        public function get snowballHits():int
        {
            return (_SafeStr_8416);
        }

        public function get snowballHitsTaken():int
        {
            return (_SafeStr_8417);
        }

        public function get snowballsThrown():int
        {
            return (_SafeStr_8418);
        }

        public function get snowballsCreated():int
        {
            return (_SafeStr_8419);
        }

        public function get snowballsFromMachine():int
        {
            return (_SafeStr_8420);
        }

        public function get friendlyHits():int
        {
            return (_SafeStr_8421);
        }

        public function get friendlyKills():int
        {
            return (_SafeStr_8422);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)
// _SafeStr_8414 = "_-HL" (String#7694, DoABC#3)
// _SafeStr_8415 = "_-Q1" (String#8282, DoABC#3)
// _SafeStr_8416 = "_-4l" (String#6862, DoABC#3)
// _SafeStr_8417 = "_-fw" (String#9379, DoABC#3)
// _SafeStr_8418 = "_-pU" (String#10011, DoABC#3)
// _SafeStr_8419 = "_-XG" (String#8800, DoABC#3)
// _SafeStr_8420 = "_-32H" (String#6743, DoABC#3)
// _SafeStr_8421 = "_-z1n" (String#10675, DoABC#3)
// _SafeStr_8422 = "_-F1d" (String#7547, DoABC#3)


