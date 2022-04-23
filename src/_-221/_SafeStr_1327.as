// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-221._SafeStr_1327

package _-221
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1327 implements IMessageParser 
    {

        public static const _SafeStr_7031:int = 7;
        public static const _SafeStr_7032:int = 8;

        private var _SafeStr_7022:int;
        private var _otherUserName:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7022 = _arg_1.readInteger();
            _otherUserName = _arg_1.readString();
            return (true);
        }

        public function get reason():int
        {
            return (_SafeStr_7022);
        }

        public function get otherUserName():String
        {
            return (_otherUserName);
        }


    }
}//package _-221

// _SafeStr_1327 = "_-a1q" (String#8989, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)
// _SafeStr_7031 = "_-j1O" (String#9599, DoABC#3)
// _SafeStr_7032 = "_-12i" (String#6578, DoABC#3)


