// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1197

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1197 implements IMessageParser 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_7104:Boolean;
        private var _SafeStr_7103:int;
        private var _SafeStr_7105:int;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get isExpired():Boolean
        {
            return (_SafeStr_7104);
        }

        public function get pickerId():int
        {
            return (_SafeStr_7103);
        }

        public function get delay():int
        {
            return (_SafeStr_7105);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = 0;
            _SafeStr_7105 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_3820 = _arg_1.readString();
            _SafeStr_7104 = _arg_1.readBoolean();
            _SafeStr_7103 = _arg_1.readInteger();
            _SafeStr_7105 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1197 = "_-121" (String#6561, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_7103 = "_-21v" (String#6654, DoABC#3)
// _SafeStr_7104 = "_-Fr" (String#7580, DoABC#3)
// _SafeStr_7105 = "_-X1l" (String#8783, DoABC#3)


