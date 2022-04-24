// by nota

//_-TY.Game2UserLeftGameMessageParser

package _-TY
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2UserLeftGameMessageParser implements IMessageParser 
    {

        private var _SafeStr_4128:int;


        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            return (true);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }


    }
}//package _-TY

// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


