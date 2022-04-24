// by nota

//_-TY.Game2GameDirectoryStatusMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2GameDirectoryStatusMessageParser implements IMessageParser 
    {

        public static const _SafeStr_7571:int = 0;
        public static const _SafeStr_7572:int = 1;
        public static const _SafeStr_7573:int = 2;
        public static const _SafeStr_7574:int = 3;

        private var _status:int;
        private var _SafeStr_7575:int;
        private var _SafeStr_5083:int;
        private var _SafeStr_5081:int;


        public function get status():int
        {
            return (_status);
        }

        public function get blockLength():int
        {
            return (_SafeStr_7575);
        }

        public function get gamesPlayed():int
        {
            return (_SafeStr_5083);
        }

        public function get freeGamesLeft():int
        {
            return (_SafeStr_5081);
        }

        public function get hasUnlimitedGames():Boolean
        {
            return (_SafeStr_5081 == -1);
        }

        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _status = _arg_1.readInteger();
            _SafeStr_7575 = _arg_1.readInteger();
            _SafeStr_5083 = _arg_1.readInteger();
            _SafeStr_5081 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-TY

// _SafeStr_5081 = "_-p1A" (String#9975, DoABC#3)
// _SafeStr_5083 = "_-t16" (String#10242, DoABC#3)
// _SafeStr_7571 = "_-h1A" (String#9459, DoABC#3)
// _SafeStr_7572 = "_-QF" (String#8316, DoABC#3)
// _SafeStr_7573 = "_-i1W" (String#9531, DoABC#3)
// _SafeStr_7574 = "_-jz" (String#9656, DoABC#3)
// _SafeStr_7575 = "_-wD" (String#10475, DoABC#3)


