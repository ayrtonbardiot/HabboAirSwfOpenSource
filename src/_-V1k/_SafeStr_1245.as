// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-V1k._SafeStr_1245

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1245 implements IMessageParser 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_5449:Boolean;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get success():Boolean
        {
            return (_SafeStr_5449);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_5449 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-V1k

// _SafeStr_1245 = "_-kq" (String#9715, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_5449 = "_-od" (String#9957, DoABC#3)


