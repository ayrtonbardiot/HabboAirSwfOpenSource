// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-T1I._SafeStr_1305

package _-T1I
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1305 implements IMessageParser 
    {

        private var _SafeStr_6997:String;
        private var _SafeStr_7559:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_6997 = _arg_1.readString();
            _SafeStr_7559 = _arg_1.readInteger();
            return (true);
        }

        public function get timeStr():String
        {
            return (_SafeStr_6997);
        }

        public function get secondsUntil():int
        {
            return (_SafeStr_7559);
        }


    }
}//package _-T1I

// _SafeStr_1305 = "_-cZ" (String#9149, DoABC#3)
// _SafeStr_6997 = "_-C1h" (String#7368, DoABC#3)
// _SafeStr_7559 = "_-us" (String#10367, DoABC#3)


