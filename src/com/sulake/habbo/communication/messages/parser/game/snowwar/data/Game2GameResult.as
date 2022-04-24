// by nota

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2GameResult

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2GameResult 
    {

        public static const _SafeStr_8407:int = 0;
        public static const _SafeStr_8408:int = 1;
        public static const _SafeStr_8409:int = 2;

        private var _SafeStr_8410:Boolean;
        private var _SafeStr_8411:int;
        private var _SafeStr_8412:int;

        public function Game2GameResult(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_8410 = _arg_1.readBoolean();
            _SafeStr_8411 = _arg_1.readInteger();
            _SafeStr_8412 = _arg_1.readInteger();
        }

        public function get isDeathMatch():Boolean
        {
            return (_SafeStr_8410);
        }

        public function get resultType():int
        {
            return (_SafeStr_8411);
        }

        public function get winnerId():int
        {
            return (_SafeStr_8412);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_8407 = "_-n1J" (String#9872, DoABC#3)
// _SafeStr_8408 = "_-JX" (String#7821, DoABC#3)
// _SafeStr_8409 = "_-11l" (String#6556, DoABC#3)
// _SafeStr_8410 = "_-31Y" (String#6722, DoABC#3)
// _SafeStr_8411 = "_-qs" (String#10094, DoABC#3)
// _SafeStr_8412 = "_-v4" (String#10407, DoABC#3)


