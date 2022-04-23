// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-3D._SafeStr_1152

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-41O._SafeStr_1607;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1152 implements IMessageParser 
    {

        private var _SafeStr_5684:_SafeStr_1607;


        public function flush():Boolean
        {
            _SafeStr_5684 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5684 = new _SafeStr_1607(_arg_1);
            return (true);
        }

        public function get quest():_SafeStr_1607
        {
            return (_SafeStr_5684);
        }


    }
}//package _-3D

// _SafeStr_1152 = "_-ho" (String#9506, DoABC#3)
// _SafeStr_1607 = "_-oH" (String#9950, DoABC#3)
// _SafeStr_5684 = "_-91m" (String#7172, DoABC#3)


