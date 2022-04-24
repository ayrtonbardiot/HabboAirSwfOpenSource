// by nota

//_-g1G._SafeStr_1460

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1406;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1460 implements IMessageParser 
    {

        private var _SafeStr_4786:int;
        private var _SafeStr_7235:_SafeStr_1406;


        public function flush():Boolean
        {
            _SafeStr_4786 = -1;
            _SafeStr_7235 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4786 = _arg_1.readInteger();
            _SafeStr_7235 = new _SafeStr_1406(_arg_1);
            return (true);
        }

        public function get pageId():int
        {
            return (_SafeStr_4786);
        }

        public function get offerData():_SafeStr_1406
        {
            return (_SafeStr_7235);
        }


    }
}//package _-g1G

// _SafeStr_1406 = "_-227" (String#6660, DoABC#3)
// _SafeStr_1460 = "_-j9" (String#9616, DoABC#3)
// _SafeStr_4786 = "_-l1k" (String#9753, DoABC#3)
// _SafeStr_7235 = "_-t1d" (String#10258, DoABC#3)


