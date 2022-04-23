// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1429

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1429 implements IMessageParser 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4101:String;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get itemData():String
        {
            return (_SafeStr_4101);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = 0;
            _SafeStr_4101 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_2:String = _arg_1.readString();
            _SafeStr_3820 = _local_2;
            _SafeStr_4101 = _arg_1.readString();
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1429 = "_-c7" (String#9133, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4101 = "_-C1F" (String#7359, DoABC#3)


