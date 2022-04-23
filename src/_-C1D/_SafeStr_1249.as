// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-C1D._SafeStr_1249

package _-C1D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1249 implements IMessageParser 
    {

        private var _SafeStr_7053:int;
        private var _SafeStr_6578:int;
        private var _SafeStr_4938:String;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6578 = _arg_1.readInteger();
            _SafeStr_7053 = _arg_1.readInteger();
            _SafeStr_4938 = _arg_1.readString();
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7053 = 0;
            _SafeStr_6578 = 0;
            _SafeStr_4938 = null;
            return (true);
        }

        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }

        public function get messageId():int
        {
            return (_SafeStr_6578);
        }

        public function get timestamp():String
        {
            return (_SafeStr_4938);
        }


    }
}//package _-C1D

// _SafeStr_1249 = "_-G1P" (String#7594, DoABC#3)
// _SafeStr_4938 = "_-wS" (String#10482, DoABC#3)
// _SafeStr_6578 = "_-RO" (String#8375, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


