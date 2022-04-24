// by nota

//_-g1G._SafeStr_1527

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1527 implements IMessageParser 
    {

        private var _pageName:String;
        private var _SafeStr_4786:int;
        private var _SafeStr_6909:int;
        private var _SafeStr_4204:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4786 = _arg_1.readInteger();
            _pageName = _arg_1.readString();
            _SafeStr_6909 = _arg_1.readInteger();
            _SafeStr_4204 = _arg_1.readString();
            return (true);
        }

        public function get pageName():String
        {
            return (_pageName);
        }

        public function get pageId():int
        {
            return (_SafeStr_4786);
        }

        public function get secondsToExpiry():int
        {
            return (_SafeStr_6909);
        }

        public function get image():String
        {
            return (_SafeStr_4204);
        }


    }
}//package _-g1G

// _SafeStr_1527 = "_-En" (String#7520, DoABC#3)
// _SafeStr_4204 = "_-WT" (String#8742, DoABC#3)
// _SafeStr_4786 = "_-l1k" (String#9753, DoABC#3)
// _SafeStr_6909 = "_-6Q" (String#6986, DoABC#3)


