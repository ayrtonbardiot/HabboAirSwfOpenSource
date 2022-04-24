// by nota

//_-71X.UserGameAchievementsMessageParser

package _-71X
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-IV._SafeStr_1425;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserGameAchievementsMessageParser implements IMessageParser 
    {

        private var _SafeStr_7127:int;
        private var _SafeStr_4403:_SafeStr_1425;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7127 = _arg_1.readInteger();
            _SafeStr_4403 = new _SafeStr_1425();
            _SafeStr_4403.parse(_arg_1);
            return (true);
        }

        public function get gameTypeId():int
        {
            return (_SafeStr_7127);
        }

        public function get achievements():Array
        {
            return (_SafeStr_4403.achievements);
        }

        public function get defaultCategory():String
        {
            return (_SafeStr_4403.defaultCategory);
        }


    }
}//package _-71X

// _SafeStr_1425 = "_-G1h" (String#7604, DoABC#3)
// _SafeStr_4403 = "_-RC" (String#8367, DoABC#3)
// _SafeStr_7127 = "_-co" (String#9157, DoABC#3)


