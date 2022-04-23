// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2SnowWarGameStats

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2SnowWarGameStats 
    {

        private var _SafeStr_8423:int;
        private var _SafeStr_8424:int;

        public function Game2SnowWarGameStats(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_8423 = _arg_1.readInteger();
            _SafeStr_8424 = _arg_1.readInteger();
        }

        public function get playerWithMostKills():int
        {
            return (_SafeStr_8423);
        }

        public function get playerWithMostHits():int
        {
            return (_SafeStr_8424);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_8423 = "_-P1j" (String#8245, DoABC#3)
// _SafeStr_8424 = "_-S2" (String#8429, DoABC#3)


