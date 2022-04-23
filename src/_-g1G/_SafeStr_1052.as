// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-g1G._SafeStr_1052

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1406;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1052 implements IMessageParser 
    {

        private var _SafeStr_7235:_SafeStr_1406;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7235 = new _SafeStr_1406(_arg_1);
            return (true);
        }

        public function get offerData():_SafeStr_1406
        {
            return (_SafeStr_7235);
        }


    }
}//package _-g1G

// _SafeStr_1052 = "_-I1P" (String#7724, DoABC#3)
// _SafeStr_1406 = "_-227" (String#6660, DoABC#3)
// _SafeStr_7235 = "_-t1d" (String#10258, DoABC#3)


