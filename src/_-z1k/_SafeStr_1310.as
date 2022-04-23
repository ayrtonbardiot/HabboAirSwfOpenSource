// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-z1k._SafeStr_1310

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1310 implements IMessageParser 
    {

        private var _SafeStr_7876:Boolean;
        private var _SafeStr_7877:int;
        private var _SafeStr_7878:String;
        private var _SafeStr_7879:Boolean;
        private var _SafeStr_7880:int;
        private var _SafeStr_7881:int;
        private var _SafeStr_5178:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7876 = _arg_1.readBoolean();
            _SafeStr_7880 = _arg_1.readInteger();
            _SafeStr_7879 = (_SafeStr_7880 === 0);
            _SafeStr_7877 = _arg_1.readInteger();
            _SafeStr_7878 = _arg_1.readString();
            _SafeStr_7881 = _arg_1.readInteger();
            _SafeStr_5178 = _arg_1.readInteger();
            if (!_SafeStr_7876)
            {
                _SafeStr_7877 = -1;
                _SafeStr_7878 = "";
            };
            return (true);
        }

        public function get rented():Boolean
        {
            return (_SafeStr_7876);
        }

        public function get renterId():int
        {
            return (_SafeStr_7877);
        }

        public function get renterName():String
        {
            return (_SafeStr_7878);
        }

        public function get canRent():Boolean
        {
            return (_SafeStr_7879);
        }

        public function get price():int
        {
            return (_SafeStr_5178);
        }

        public function get timeRemaining():int
        {
            return (_SafeStr_7881);
        }

        public function get canRentErrorCode():int
        {
            return (_SafeStr_7880);
        }


    }
}//package _-z1k

// _SafeStr_1310 = "_-02b" (String#6513, DoABC#3)
// _SafeStr_5178 = "_-4G" (String#6846, DoABC#3)
// _SafeStr_7876 = "_-v1L" (String#10384, DoABC#3)
// _SafeStr_7877 = "_-B1Q" (String#7308, DoABC#3)
// _SafeStr_7878 = "_-5" (String#6868, DoABC#3)
// _SafeStr_7879 = "_-R1Z" (String#8348, DoABC#3)
// _SafeStr_7880 = "_-nD" (String#9897, DoABC#3)
// _SafeStr_7881 = "_-cI" (String#9139, DoABC#3)


