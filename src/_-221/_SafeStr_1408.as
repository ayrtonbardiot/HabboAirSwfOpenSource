// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-221._SafeStr_1408

package _-221
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1408 implements IMessageParser 
    {

        private var _SafeStr_7033:int;
        private var _SafeStr_7036:Boolean;


        public function get userID():int
        {
            return (_SafeStr_7033);
        }

        public function get userAccepts():Boolean
        {
            return (_SafeStr_7036);
        }

        public function flush():Boolean
        {
            _SafeStr_7033 = -1;
            _SafeStr_7036 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7033 = _arg_1.readInteger();
            _SafeStr_7036 = (_arg_1.readInteger() > 0);
            return (true);
        }


    }
}//package _-221

// _SafeStr_1408 = "_-O1G" (String#8137, DoABC#3)
// _SafeStr_7033 = "_-x1b" (String#10533, DoABC#3)
// _SafeStr_7036 = "_-910" (String#7150, DoABC#3)


