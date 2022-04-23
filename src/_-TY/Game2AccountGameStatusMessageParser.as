// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TY.Game2AccountGameStatusMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2AccountGameStatusMessageParser implements IMessageParser 
    {

        private var _SafeStr_7127:int;
        private var _SafeStr_5081:int;
        private var _SafeStr_7570:int;


        public function get gameTypeId():int
        {
            return (_SafeStr_7127);
        }

        public function get freeGamesLeft():int
        {
            return (_SafeStr_5081);
        }

        public function get gamesPlayedTotal():int
        {
            return (_SafeStr_7570);
        }

        public function get hasUnlimitedGames():Boolean
        {
            return (_SafeStr_5081 == -1);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7127 = _arg_1.readInteger();
            _SafeStr_5081 = _arg_1.readInteger();
            _SafeStr_7570 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-TY

// _SafeStr_5081 = "_-p1A" (String#9975, DoABC#3)
// _SafeStr_7127 = "_-co" (String#9157, DoABC#3)
// _SafeStr_7570 = "_-x18" (String#10504, DoABC#3)


