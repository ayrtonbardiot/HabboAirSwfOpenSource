// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1r._SafeStr_1467

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1467 implements IMessageParser 
    {

        private var _SafeStr_7233:String;

        public function _SafeStr_1467()
        {
            _SafeStr_7233 = "";
        }

        public function flush():Boolean
        {
            _SafeStr_7233 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7233 = _arg_1.readString();
            return (true);
        }

        public function get machineID():String
        {
            return (_SafeStr_7233);
        }


    }
}//package _-K1r

// _SafeStr_1467 = "_-m1d" (String#9808, DoABC#3)
// _SafeStr_7233 = "_-m1h" (String#9812, DoABC#3)


