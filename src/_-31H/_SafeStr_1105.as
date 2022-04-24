// by nota

//_-31H._SafeStr_1105

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1105 implements IMessageParser 
    {

        private var _SafeStr_7050:String;
        private var _SafeStr_7051:int;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7050 = _arg_1.readString();
            _SafeStr_7051 = _arg_1.readInteger();
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7050 = null;
            return (true);
        }

        public function get globalId():String
        {
            return (_SafeStr_7050);
        }

        public function get convertedId():int
        {
            return (_SafeStr_7051);
        }


    }
}//package _-31H

// _SafeStr_1105 = "_-X6" (String#8790, DoABC#3)
// _SafeStr_7050 = "_-21H" (String#6628, DoABC#3)
// _SafeStr_7051 = "_-M2" (String#8020, DoABC#3)


